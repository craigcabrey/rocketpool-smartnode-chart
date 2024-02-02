{{- define "rocketpool.validatorClient.metricsPort" -}}
{{/*
Ensure one and only one validator is enabled
*/}}
{{- $vlCount := 0 | int -}}

{{- if .Values.global.validator.grandine -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.grandine.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.lighthouse -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.lighthouse.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.lodestar -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.lodestar.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.nimbus -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.nimbus.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.prysm -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.prysm.metricsPort }}
{{- end -}}

{{- if .Values.global.validator.teku -}}
{{ $vlCount = add1 $vlCount -}}
{{ .Values.teku.metricsPort }}
{{- end -}}

{{- if gt $vlCount 1 -}}
{{ fail "ERROR: You can only enable one validator client" -}}
{{- end }}

{{- if lt $vlCount 1 -}}
{{ fail "ERROR: You must enable at least one validator client" -}}
{{- end }}
{{- end -}}
