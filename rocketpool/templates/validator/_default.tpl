{{- $vlCount := 0 | int -}}
{{- if .Values.lighthouseValidator.enabled -}}
{{ $vlCount = add1 $vlCount -}}
{{- end -}}
{{- if .Values.prysmValidator.enabled -}}
{{ $vlCount = add1 $vlCount -}}
{{- end -}}

{{- if gt $vlCount 1 -}}
{{ fail "ERROR: You can only enable one validator client" -}}
{{- end }}

{{- if eq $vlCount 0 -}}
{{ fail "ERROR: You must enable at least one validator client" -}}
{{- end }}

{{- define "rocketpool.validatorClient" -}}
{{- default "" }}
{{- end -}}

{{- define "rocketpool.validatorClient.metricsPort" -}}
{{- default 9101 }}
{{- end -}}
