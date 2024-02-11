#!/bin/sh
# vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab

NAMESPACE="rocketpool"
SELECTOR="app.kubernetes.io/component=setup,app.kubernetes.io/name=rocketpool,app.kubernetes.io/part-of=rocketpool"

usage() {
  echo "Usage: ${0} [OPTION]..."
  exit 1
}

while getopts 'hn:r:' opt; do
  case $opt in
    h)
      usage
      ;;
    n)
      NAMESPACE="${OPTARG}"
      ;;
    r)
      SELECTOR="${SELECTOR},app.kubernetes.io/instance=${OPTARG}"
      ;;
    *)
      usage
      ;;
  esac
done

if ! command -v kubectl >/dev/null; then
  echo "No kubectl found! Are you running this from the same machine as helm?"
  exit 1
fi

if ! command -v helm >/dev/null; then
  read -p "Helm not found, are you on the right machine? (y/N): " \
    confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
  exit 1
fi

read -p "kubectl is configured for the cluster with rocketpool installed? (y/N): " \
  confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

JOB_QUERY_RESULT=$(
  kubectl get job --no-headers \
  --namespace "${NAMESPACE}" \
  --selector "${SELECTOR}" \
  --output custom-columns=name:.metadata.name
)

JOBS=( $JOB_QUERY_RESULT )

if [ ${#JOBS[@]} -lt 1 ]; then
  echo "No setup job found! Perhaps you've already completed setup?"
  exit 1
fi

if [ ${#JOBS[@]} -gt 1 ]; then
  echo "More than one setup job found! Please specify the correct release with -i."
  exit 1
fi

POD_NAME=$(
  kubectl get pod --no-headers \
  --namespace "${NAMESPACE}" \
  --selector job-name="${JOB_QUERY_RESULT}" \
  --output custom-columns=name:.metadata.name
)

if [ -z "${POD_NAME}" ]; then
  echo "No setup pod found! Perhaps you've already completed setup?"
  exit 1
fi

POD_STATUS=$(
  kubectl get pod --no-headers \
    --namespace "${NAMESPACE}" \
    --selector job-name="${JOB_QUERY_RESULT}" \
    --output custom-columns=status:.status.phase
)

if [ "${POD_STATUS}" = "Succeeded" ]; then
  echo "Setup pod already exited! Perhaps you've already completed setup?"
  exit 0
fi

echo "Waiting for setup pod to settle..."
kubectl wait --for condition=Ready -n "${NAMESPACE}" "pod/${POD_NAME}"

if [ ! -z "${DRY_RUN}" ]; then
  echo "Found job: ${JOB_QUERY_RESULT}, found pod: ${POD_NAME}"
  exit 0
fi

kubectl exec --stdin --tty --container setup --namespace "${NAMESPACE}" "${POD_NAME}" -- /scripts/setup.sh

if [ $? -eq 0 ]; then
  echo "Success! Continue in the guide starting from 'Creating a New Wallet':"
  echo "https://docs.rocketpool.net/guides/node/wallet-init"
  echo "Replace all invocations of the rocketpool CLI with scripts/rocketpool.sh"
  kubectl delete job --namespace "${NAMESPACE}" "${JOB_QUERY_RESULT}"
else
  echo "kubectl reported a failure with setup :("
fi
