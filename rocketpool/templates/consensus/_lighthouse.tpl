{{- define "rocketpool.primaryConsensusClient" -}}
{{- if .Values.primaryNode.lighthouse.enabled -}}
{{- default "lighthouse" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.httpPort" -}}
{{- if .Values.primaryNode.lighthouse.enabled -}}
{{- .Values.primaryNode.lighthouse.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.metricsPort" -}}
{{- if .Values.primaryNode.lighthouse.enabled -}}
{{- .Values.primaryNode.lighthouse.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.p2pPort" -}}
{{- if .Values.primaryNode.lighthouse.enabled -}}
{{- .Values.primaryNode.lighthouse.p2pPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient" -}}
{{- if .Values.fallbackNode.lighthouse.enabled -}}
{{- default "lighthouse" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.httpPort" -}}
{{- if .Values.fallbackNode.lighthouse.enabled -}}
{{- .Values.fallbackNode.lighthouse.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.metricsPort" -}}
{{- if .Values.fallbackNode.lighthouse.enabled -}}
{{- .Values.fallbackNode.lighthouse.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.p2pPort" -}}
{{- if .Values.fallbackNode.lighthouse.enabled -}}
{{- .Values.fallbackNode.lighthouse.p2pPort }}
{{- end -}}
{{- end -}}
