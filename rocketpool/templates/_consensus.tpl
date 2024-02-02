{{- define "rocketpool.primaryConsensusClient.name" -}}
{{- if .Values.primaryNode.grandine.enabled -}}
grandine
{{- else if .Values.primaryNode.lighthouse.enabled -}}
lighthouse
{{- else if .Values.primaryNode.lodestar.enabled -}}
lodestar
{{- else if .Values.primaryNode.nimbus.enabled -}}
nimbus
{{- else if .Values.primaryNode.prysm.enabled -}}
prysm
{{- else if .Values.primaryNode.teku.enabled -}}
teku
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.httpPort" -}}
{{- if .Values.primaryNode.grandine.enabled -}}
{{- .Values.primaryNode.grandine.httpPort }}
{{- else if .Values.primaryNode.lighthouse.enabled -}}
{{- .Values.primaryNode.lighthouse.httpPort }}
{{- else if .Values.primaryNode.lodestar.enabled -}}
{{- .Values.primaryNode.lodestar.httpPort }}
{{- else if .Values.primaryNode.nimbus.enabled -}}
{{- .Values.primaryNode.nimbus.httpPort }}
{{- else if .Values.primaryNode.prysm.enabled -}}
{{- .Values.primaryNode.prysm.httpPort }}
{{- else if .Values.primaryNode.teku.enabled -}}
{{- .Values.primaryNode.teku.httpPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.metricsPort" -}}
{{- if .Values.primaryNode.grandine.enabled -}}
{{- .Values.primaryNode.grandine.metricsPort }}
{{- else if .Values.primaryNode.lighthouse.enabled -}}
{{- .Values.primaryNode.lighthouse.metricsPort }}
{{- else if .Values.primaryNode.lodestar.enabled -}}
{{- .Values.primaryNode.lodestar.metricsPort }}
{{- else if .Values.primaryNode.nimbus.enabled -}}
{{- .Values.primaryNode.nimbus.metricsPort }}
{{- else if .Values.primaryNode.prysm.enabled -}}
{{- .Values.primaryNode.prysm.metricsPort }}
{{- else if .Values.primaryNode.teku.enabled -}}
{{- .Values.primaryNode.teku.metricsPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryConsensusClient.p2pPort" -}}
{{- if .Values.primaryNode.grandine.enabled -}}
{{- .Values.primaryNode.grandine.p2pPort }}
{{- else if .Values.primaryNode.lighthouse.enabled -}}
{{- .Values.primaryNode.lighthouse.p2pPort }}
{{- else if .Values.primaryNode.lodestar.enabled -}}
{{- .Values.primaryNode.lodestar.p2pPort }}
{{- else if .Values.primaryNode.nimbus.enabled -}}
{{- .Values.primaryNode.nimbus.p2pPort }}
{{- else if .Values.primaryNode.prysm.enabled -}}
{{- .Values.primaryNode.prysm.p2pPort }}
{{- else if .Values.primaryNode.teku.enabled -}}
{{- .Values.primaryNode.teku.p2pPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.name" -}}
{{- if .Values.fallbackNode.grandine.enabled -}}
grandine
{{- else if .Values.fallbackNode.lighthouse.enabled -}}
lighthouse
{{- else if .Values.fallbackNode.lodestar.enabled -}}
lodestar
{{- else if .Values.fallbackNode.nimbus.enabled -}}
nimbus
{{- else if .Values.fallbackNode.prysm.enabled -}}
prysm
{{- else if .Values.fallbackNode.teku.enabled -}}
teku
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.httpPort" -}}
{{- if .Values.fallbackNode.grandine.enabled -}}
{{- .Values.fallbackNode.grandine.httpPort }}
{{- else if .Values.fallbackNode.lighthouse.enabled -}}
{{- .Values.fallbackNode.lighthouse.httpPort }}
{{- else if .Values.fallbackNode.lodestar.enabled -}}
{{- .Values.fallbackNode.lodestar.httpPort }}
{{- else if .Values.fallbackNode.nimbus.enabled -}}
{{- .Values.fallbackNode.nimbus.httpPort }}
{{- else if .Values.fallbackNode.prysm.enabled -}}
{{- .Values.fallbackNode.prysm.httpPort }}
{{- else if .Values.fallbackNode.teku.enabled -}}
{{- .Values.fallbackNode.teku.httpPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.metricsPort" -}}
{{- if .Values.fallbackNode.grandine.enabled -}}
{{- .Values.fallbackNode.grandine.metricsPort }}
{{- else if .Values.fallbackNode.lighthouse.enabled -}}
{{- .Values.fallbackNode.lighthouse.metricsPort }}
{{- else if .Values.fallbackNode.lodestar.enabled -}}
{{- .Values.fallbackNode.lodestar.metricsPort }}
{{- else if .Values.fallbackNode.nimbus.enabled -}}
{{- .Values.fallbackNode.nimbus.metricsPort }}
{{- else if .Values.fallbackNode.prysm.enabled -}}
{{- .Values.fallbackNode.prysm.metricsPort }}
{{- else if .Values.fallbackNode.teku.enabled -}}
{{- .Values.fallbackNode.teku.metricsPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackConsensusClient.p2pPort" -}}
{{- if .Values.fallbackNode.grandine.enabled -}}
{{- .Values.fallbackNode.grandine.p2pPort }}
{{- else if .Values.fallbackNode.lighthouse.enabled -}}
{{- .Values.fallbackNode.lighthouse.p2pPort }}
{{- else if .Values.fallbackNode.lodestar.enabled -}}
{{- .Values.fallbackNode.lodestar.p2pPort }}
{{- else if .Values.fallbackNode.nimbus.enabled -}}
{{- .Values.fallbackNode.nimbus.p2pPort }}
{{- else if .Values.fallbackNode.prysm.enabled -}}
{{- .Values.fallbackNode.prysm.p2pPort }}
{{- else if .Values.fallbackNode.teku.enabled -}}
{{- .Values.fallbackNode.teku.p2pPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}
