#!/bin/sh
# vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab

REPO=$(git rev-parse --show-toplevel)
CONSENSUS_CLIENTS="grandine lighthouse lodestar nimbus prysm teku"
EXECUTION_CLIENTS="besu erigon ethereumjs geth nethermind reth"
VALIDATOR_CLIENTS="grandine lighthouse lodestar nimbus prysm teku"

test_combinations() {
  echo -n "test_combinations: "

  for consensus in $CONSENSUS_CLIENTS; do
    for execution in $EXECUTION_CLIENTS; do
      for validator in $VALIDATOR_CLIENTS; do
        helm template \
          --set "${validator}.persistence.existingClaim=test-rocketpool-smartnode-data" \
          --set "${validator}.acknowledgeValidatorExecutionClientMismatch=true" \
          --set "primaryNode.${consensus}.enabled=true" \
          --set "primaryNode.${execution}.enabled=true" \
          --set "global.validator.${validator}=true" \
          --set "global.main.network=test" \
          test "${REPO}/rocketpool" >/dev/null

        if [ $? -ne 0 ]; then
          echo "Helm reported failure! Repo with:"
          echo "helm template \
            --set "${validator}.persistence.existingClaim=test-rocketpool-smartnode-data" \
            --set "${validator}.acknowledgeValidatorExecutionClientMismatch=true" \
            --set primaryNode.${consensus}.enabled=true \
            --set primaryNode.${execution}.enabled=true \
            --set global.validator.${validator}=true \
            --set "global.main.network=test" \
            test ${REPO}/rocketpool >/dev/null"
          exit 1
        fi
      done
    done
  done

  echo "Pass"
}

test_validator_mismatch() {
  echo -n "test_validator_mismatch: "

  helm template \
    --set "lighthouse.persistence.existingClaim=test-rocketpool-smartnode-data" \
    --set "primaryNode.prysm.enabled=true" \
    --set "primaryNode.besu.enabled=true" \
    --set "global.validator.lighthouse=true" \
    --set "global.main.network=test" \
    test "${REPO}/rocketpool" >/dev/null 2>/dev/null

  if [ $? -eq 0 ]; then
    echo "expected helm failure, got returncode ${?} instead!"
    exit 1
  fi

  echo "Pass"
}

test_validator_mismatch
test_combinations
