{{- define "rocketpool.consensusClient" -}}
{{- if .Values.ethereumNode.lighthouse.enabled -}}
{{- default "lighthouse" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.consensusClient.httpPort" -}}
{{- if .Values.ethereumNode.lighthouse.enabled -}}
{{- .Values.ethereumNode.lighthouse.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.consensusClient.metricsPort" -}}
{{- if .Values.ethereumNode.lighthouse.enabled -}}
{{- .Values.ethereumNode.lighthouse.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.consensusClient.p2pPort" -}}
{{- if .Values.ethereumNode.lighthouse.enabled -}}
{{- .Values.ethereumNode.lighthouse.p2pPort }}
{{- end -}}
{{- end -}}
