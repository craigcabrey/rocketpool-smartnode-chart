#!/bin/sh

POD=$(
  kubectl get pod \
  --no-headers \
  --all-namespaces \
  --selector app.kubernetes.io/component=smartnode,app.kubernetes.io/name=smartnode,app.kubernetes.io/part-of=rocketpool \
  --output custom-columns=name:.metadata.name,namespace:.metadata.namespace
)

POD_NAME=$(echo $POD | awk '{print $1}')
NAMESPACE=$(echo $POD | awk '{print $2}')

kubectl exec --stdin --tty \
  --namespace "${NAMESPACE}" \
  --container smartnode \
  $POD_NAME \
  -- /scripts/rocketpool $@
