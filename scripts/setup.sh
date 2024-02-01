#!/bin/sh

SELECTOR="app.kubernetes.io/component=setup,app.kubernetes.io/name=rocketpool-cli,app.kubernetes.io/part-of=rocketpool"

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
read -p "Enter installation namespace [rocketpool]: " NAMESPACE

if [ -z "${NAMESPACE}" ]; then
  NAMESPACE="rocketpool"
fi

JOB_NAME=$(
  kubectl get job --no-headers \
  --namespace "${NAMESPACE}" \
  --selector "${SELECTOR}" \
  --output custom-columns=name:.metadata.name
)
POD_NAME=$(
  kubectl get pod --no-headers \
  --namespace "${NAMESPACE}" \
  --selector job-name="${JOB_NAME}" \
  --output custom-columns=name:.metadata.name
)

if [ -z "${POD_NAME}" ]; then
  echo "No setup pod found! Perhaps you've already completed setup?"
  exit 1
fi

echo "Waiting for setup pod to settle..."
kubectl wait --for condition=Ready -n "${NAMESPACE}" "pod/${POD_NAME}"

if [ ! -z "${DRY_RUN}" ]; then
  echo "Found job: ${JOB_NAME}, found pod: ${POD_NAME}"
  exit 0
fi

kubectl exec --stdin --tty --container setup --namespace "${NAMESPACE}" "${POD_NAME}" -- /scripts/setup.sh

if [ $? -eq 0 ]; then
  echo "Success! To run the rocketpool CLI, use scripts/rocketpool.sh."
  kubectl delete job --namespace "${NAMESPACE}" "${JOB_NAME}"
else
  echo "kubectl reported a failure with setup :("
fi
