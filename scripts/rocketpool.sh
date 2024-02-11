#!/bin/sh
# vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab

REPO=$(git rev-parse --show-toplevel)
. "${REPO}/scripts/common.sh"

NAMESPACE="rocketpool"
SELECTOR="app.kubernetes.io/component=smartnode,app.kubernetes.io/part-of=rocketpool"

usage() {
  echo "Usage: ${0} [OPTION]... [--] COMMAND [ARG]..."
  echo -e "Run rocketpool COMMAND on a Helm deployment.\n"
  echo "Options:"
  echo "    -n NAMESPACE Specify a namespace (defaults to rocketpool)"
  echo "    -r RELEASE   Specify a Helm release"
  echo -e "    -h           Display this help and exit\n"
  echo -e "Hint: Use -- to delineate parameters intended for rocketpoolcli\n"
  echo "Examples:"
  echo "  Query the node status:"
  echo "    ${0} node status"
  echo "  Query the version of the smartnode:"
  echo "    ${0} -- --version"
  echo "  Query the node status of a specific release:"
  echo "    ${0} -r holesky node status"
  exit 1
}

while getopts "hn:r:" opt; do
  debug "$opt at $OPTIND has $OPTARG"
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
shift $((OPTIND - 1))

if [ "$1" = "--" ]; then
  shift
fi

if [ $# -lt 1 ]; then
  usage
fi

debug "Namespace: ${NAMESPACE}, Selector: ${SELECTOR}, Args: ${@}"

if [ ! -z "${RKT_DEBUG}" ]; then
  exit 0
fi

POD_QUERY_RESULT=$(
  kubectl get pod \
  --no-headers \
  --namespace "${NAMESPACE}" \
  --selector "${SELECTOR}" \
  --output custom-columns=name:.metadata.name
)

PODS=( $POD_QUERY_RESULT )

if [ ${#PODS[@]} -lt 1 ]; then
  echo "Did not find a deployment! Are you installed correctly?"
  exit 1
fi

if [ ${#PODS[@]} -gt 1 ]; then
  echo "More than one deployment found! Please specify the correct release with -r."
  exit 1
fi

kubectl exec --stdin --tty \
  --namespace "${NAMESPACE}" \
  --container smartnode \
  "${POD_QUERY_RESULT}" \
  -- /scripts/rocketpool $@
