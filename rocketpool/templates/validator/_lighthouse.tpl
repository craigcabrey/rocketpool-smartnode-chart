{{- define "rocketpool.validatorClient" -}}
{{- if .Values.lighthouseValidator.enabled -}}
{{- default "lighthouse" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.validatorClient.metricsPort" -}}
{{- if .Values.lighthouseValidator.enabled -}}
{{- .Values.lighthouseValidator.metricsPort }}
{{- end -}}
{{- end -}}
