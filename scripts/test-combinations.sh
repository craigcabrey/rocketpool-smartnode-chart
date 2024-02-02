#!/bin/sh

REPO=$(git rev-parse --show-toplevel)
CONSENSUS_CLIENTS="grandine lighthouse lodestar nimbus prysm teku"
EXECUTION_CLIENTS="besu erigon ethereumjs geth nethermind reth"
VALIDATOR_CLIENTS="grandine lighthouse lodestar nimbus prysm teku"

for consensus in $CONSENSUS_CLIENTS; do
  for execution in $EXECUTION_CLIENTS; do
    for validator in $VALIDATOR_CLIENTS; do
      echo "Testing combination: consensus ${consensus}, execution ${execution}, validator ${validator}"
      helm template \
        --set "primaryNode.${consensus}.enabled=true" \
        --set "primaryNode.${execution}.enabled=true" \
        --set "global.validator.${validator}=true" \
        test "${REPO}/rocketpool" >/dev/null

      if [ $? -ne 0 ]; then
        echo "Helm reported failure! Repo with:"
        echo "helm template \
          --set primaryNode.${consensus}.enabled=true \
          --set primaryNode.${execution}.enabled=true \
          --set global.validator.${validator}=true \
          test ${REPO}/rocketpool >/dev/null"
        exit 1
      fi
    done
  done
done
