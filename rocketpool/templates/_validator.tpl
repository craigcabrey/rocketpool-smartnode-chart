{{- define "rocketpool.validatorClient.metricsPort" -}}
{{/*
Ensure one and only one validator is enabled
*/}}
{{- $vlCount := 0 | int -}}

{{- if .Values.global.validator.grandine -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.grandineValidator.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.lighthouse -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.lighthouseValidator.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.lodestar -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.lodestarValidator.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.nimbus -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.nimbusValidator.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.prysm -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.prysmValidator.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.teku -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.tekuValidator.metricsPort }}
{{- end -}}

{{- if gt $vlCount 1 -}}
{{ fail "ERROR: You can only enable one validator client" -}}
{{- end }}

{{- if lt $vlCount 1 -}}
{{ fail "ERROR: You must enable at least one validator client" -}}
{{- end }}
{{- end -}}
