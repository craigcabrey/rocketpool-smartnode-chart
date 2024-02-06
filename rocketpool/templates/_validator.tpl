{{- define "rocketpool.validatorClient.metricsPort" -}}

  {{- $vlCount := 0 | int -}}
  {{- $expectedClaim := print (include "rocketpool.fullname" .) "-smartnode-data" -}}
  {{- $primaryConsensusClient := print (include "rocketpool.consensusClient" .Values.primaryNode | fromJson).name -}}

  {{- range $validator, $enabled := .Values.global.validator -}}
    {{- if $enabled -}}
      {{ (get $.Values $validator).metricsPort }}
      {{- $vlCount = add1 $vlCount -}}
      {{- $existingClaim := (get $.Values $validator).persistence.existingClaim -}}
      {{- if ne $existingClaim $expectedClaim -}}
        {{- fail (print $existingClaim " does not match the expected volume claim of " $expectedClaim) -}}
      {{- end -}}
      {{- if ne $primaryConsensusClient $validator -}}
        {{- if not (default false (get $.Values $validator).acknowledgeValidatorExecutionClientMismatch) -}}
          {{- fail (print "Warning! Consensus client is " $primaryConsensusClient " but validator client is " $validator ". This is an advanced and unrecommended config. To proceed with it, config your validator block with acknowledgeValidatorExecutionClientMismatch.") -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Ensure one and only one validator is enabled */}}

  {{- if gt $vlCount 1 -}}
    {{ fail "ERROR: You can only enable one validator client" -}}
  {{- end -}}

  {{- if lt $vlCount 1 -}}
    {{ fail "ERROR: You must enable at least one validator client" -}}
  {{- end -}}

{{- end -}}
