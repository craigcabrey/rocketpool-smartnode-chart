{{- define "rocketpool.primaryExecutionClient" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- default "besu" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.enginePort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.authPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.httpPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.metricsPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.p2pPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.p2pPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.wsPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.wsPort}}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- default "besu" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.enginePort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.authPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.httpPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.metricsPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.p2pPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.p2pPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.wsPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.wsPort}}
{{- end -}}
{{- end -}}
