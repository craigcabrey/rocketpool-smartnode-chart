{{- define "rocketpool.primaryConsensusClient" -}}
{{- if .Values.primaryNode.prysm.enabled -}}
{{- default "prysm" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.httpPort" -}}
{{- if .Values.primaryNode.prysm.enabled -}}
{{- .Values.primaryNode.prysm.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.metricsPort" -}}
{{- if .Values.primaryNode.prysm.enabled -}}
{{- .Values.primaryNode.prysm.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.p2pPort" -}}
{{- if .Values.primaryNode.prysm.enabled -}}
{{- .Values.primaryNode.prysm.p2pPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient" -}}
{{- if .Values.fallbackNode.prysm.enabled -}}
{{- default "prysm" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.httpPort" -}}
{{- if .Values.fallbackNode.prysm.enabled -}}
{{- .Values.fallbackNode.prysm.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.metricsPort" -}}
{{- if .Values.fallbackNode.prysm.enabled -}}
{{- .Values.fallbackNode.prysm.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.p2pPort" -}}
{{- if .Values.fallbackNode.prysm.enabled -}}
{{- .Values.fallbackNode.prysm.p2pPort }}
{{- end -}}
{{- end -}}
