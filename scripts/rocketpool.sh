#!/bin/sh

INSTANCE=
SELECTOR="app.kubernetes.io/component=smartnode,app.kubernetes.io/part-of=rocketpool"

usage() {
  echo "Usage: ${0} {rocketpool-cli args}"
  echo 'For example: rocketpool.sh node status'
  echo 'To specify an instance, use -i {instance}'
  exit 1
}

while getopts 'i:' opt 2>/dev/null; do
    case $opt in
      (i)
          INSTANCE="${OPTARG}"
	  shift 2
          ;;
      (*) break
    esac
done

if [ ! -z "${INSTANCE}" ]; then
  SELECTOR="${SELECTOR},app.kubernetes.io/instance=${INSTANCE}"
fi

if [ $# -lt 1 ]; then
  usage
fi

POD_QUERY_RESULT=$(
  kubectl get pod \
  --no-headers \
  --all-namespaces \
  --selector "${SELECTOR}" \
  --output custom-columns=name:.metadata.name
)

PODS=( $POD_QUERY_RESULT )

if [ ${#PODS[@]} -lt 1 ]; then
  echo "Did not find a deployment! Are you installed correctly?"
  exit 1
fi

if [ ${#PODS[@]} -gt 1 ]; then
  echo "More than one deployment found! Please specify the correct instance with -i."
  exit 1
fi

POD_QUERY_RESULT=$(
  kubectl get pod \
  --no-headers \
  --all-namespaces \
  --selector "${SELECTOR}" \
  --output custom-columns=name:.metadata.name,namespace:.metadata.namespace
)

POD_NAME=$(echo $POD_QUERY_RESULT | awk '{print $1}')
NAMESPACE=$(echo $POD_QUERY_RESULT | awk '{print $2}')

kubectl exec --stdin --tty \
  --namespace "${NAMESPACE}" \
  --container smartnode \
  $POD_NAME \
  -- /scripts/rocketpool $@
