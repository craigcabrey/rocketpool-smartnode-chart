{{- define "rocketpool.primaryExecutionClient.name" -}}
{{- if .Values.primaryNode.besu.enabled -}}
besu
{{- else if .Values.primaryNode.erigon.enabled -}}
erigon
{{- else if .Values.primaryNode.ethereumjs.enabled -}}
ethereumjs
{{- else if .Values.primaryNode.geth.enabled -}}
geth
{{- else if .Values.primaryNode.nethermind.enabled -}}
nethermind
{{- else if .Values.primaryNode.reth.enabled -}}
reth
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.enginePort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.authPort }}
{{- else if .Values.primaryNode.erigon.enabled -}}
{{- .Values.primaryNode.erigon.authPort }}
{{- else if .Values.primaryNode.ethereumjs.enabled -}}
{{- .Values.primaryNode.ethereumjs.authPort }}
{{- else if .Values.primaryNode.geth.enabled -}}
{{- .Values.primaryNode.geth.authPort }}
{{- else if .Values.primaryNode.nethermind.enabled -}}
{{- .Values.primaryNode.nethermind.authPort }}
{{- else if .Values.primaryNode.reth.enabled -}}
{{- .Values.primaryNode.reth.authPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.httpPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.httpPort }}
{{- else if .Values.primaryNode.erigon.enabled -}}
{{- .Values.primaryNode.erigon.httpPort }}
{{- else if .Values.primaryNode.ethereumjs.enabled -}}
{{- .Values.primaryNode.ethereumjs.httpPort }}
{{- else if .Values.primaryNode.geth.enabled -}}
{{- .Values.primaryNode.geth.httpPort }}
{{- else if .Values.primaryNode.nethermind.enabled -}}
{{- .Values.primaryNode.nethermind.httpPort }}
{{- else if .Values.primaryNode.reth.enabled -}}
{{- .Values.primaryNode.reth.httpPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.metricsPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.metricsPort }}
{{- else if .Values.primaryNode.erigon.enabled -}}
{{- .Values.primaryNode.erigon.metricsPort }}
{{- else if .Values.primaryNode.ethereumjs.enabled -}}
{{- .Values.primaryNode.ethereumjs.metricsPort }}
{{- else if .Values.primaryNode.geth.enabled -}}
{{- .Values.primaryNode.geth.metricsPort }}
{{- else if .Values.primaryNode.nethermind.enabled -}}
{{- .Values.primaryNode.nethermind.metricsPort }}
{{- else if .Values.primaryNode.reth.enabled -}}
{{- .Values.primaryNode.reth.metricsPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.p2pPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.p2pPort }}
{{- else if .Values.primaryNode.erigon.enabled -}}
{{- .Values.primaryNode.erigon.p2pPort }}
{{- else if .Values.primaryNode.ethereumjs.enabled -}}
{{- .Values.primaryNode.ethereumjs.p2pPort }}
{{- else if .Values.primaryNode.geth.enabled -}}
{{- .Values.primaryNode.geth.p2pPort }}
{{- else if .Values.primaryNode.nethermind.enabled -}}
{{- .Values.primaryNode.nethermind.p2pPort }}
{{- else if .Values.primaryNode.reth.enabled -}}
{{- .Values.primaryNode.reth.p2pPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryExecutionClient.wsPort" -}}
{{- if .Values.primaryNode.besu.enabled -}}
{{- .Values.primaryNode.besu.wsPort}}
{{- else if .Values.primaryNode.erigon.enabled -}}
{{- .Values.primaryNode.erigon.wsPort }}
{{- else if .Values.primaryNode.ethereumjs.enabled -}}
{{- .Values.primaryNode.ethereumjs.wsPort }}
{{- else if .Values.primaryNode.geth.enabled -}}
{{- .Values.primaryNode.geth.wsPort }}
{{- else if .Values.primaryNode.nethermind.enabled -}}
{{- .Values.primaryNode.nethermind.wsPort }}
{{- else if .Values.primaryNode.reth.enabled -}}
{{- .Values.primaryNode.reth.wsPort }}
{{- else -}}
unknown
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
{{- else if .Values.fallbackNode.erigon.enabled -}}
{{- .Values.fallbackNode.erigon.httpPort }}
{{- else if .Values.fallbackNode.ethereumjs.enabled -}}
{{- .Values.fallbackNode.ethereumjs.httpPort }}
{{- else if .Values.fallbackNode.geth.enabled -}}
{{- .Values.fallbackNode.geth.httpPort }}
{{- else if .Values.fallbackNode.nethermind.enabled -}}
{{- .Values.fallbackNode.nethermind.httpPort }}
{{- else if .Values.fallbackNode.reth.enabled -}}
{{- .Values.fallbackNode.reth.httpPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.metricsPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.metricsPort }}
{{- else if .Values.fallbackNode.erigon.enabled -}}
{{- .Values.fallbackNode.erigon.metricsPort }}
{{- else if .Values.fallbackNode.ethereumjs.enabled -}}
{{- .Values.fallbackNode.ethereumjs.metricsPort }}
{{- else if .Values.fallbackNode.geth.enabled -}}
{{- .Values.fallbackNode.geth.metricsPort }}
{{- else if .Values.fallbackNode.nethermind.enabled -}}
{{- .Values.fallbackNode.nethermind.metricsPort }}
{{- else if .Values.fallbackNode.reth.enabled -}}
{{- .Values.fallbackNode.reth.metricsPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.p2pPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.p2pPort }}
{{- else if .Values.fallbackNode.erigon.enabled -}}
{{- .Values.fallbackNode.erigon.p2pPort }}
{{- else if .Values.fallbackNode.ethereumjs.enabled -}}
{{- .Values.fallbackNode.ethereumjs.p2pPort }}
{{- else if .Values.fallbackNode.geth.enabled -}}
{{- .Values.fallbackNode.geth.p2pPort }}
{{- else if .Values.fallbackNode.nethermind.enabled -}}
{{- .Values.fallbackNode.nethermind.p2pPort }}
{{- else if .Values.fallbackNode.reth.enabled -}}
{{- .Values.fallbackNode.reth.p2pPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackExecutionClient.wsPort" -}}
{{- if .Values.fallbackNode.besu.enabled -}}
{{- .Values.fallbackNode.besu.wsPort}}
{{- else if .Values.fallbackNode.erigon.enabled -}}
{{- .Values.fallbackNode.erigon.wsPort }}
{{- else if .Values.fallbackNode.ethereumjs.enabled -}}
{{- .Values.fallbackNode.ethereumjs.wsPort }}
{{- else if .Values.fallbackNode.geth.enabled -}}
{{- .Values.fallbackNode.geth.wsPort }}
{{- else if .Values.fallbackNode.nethermind.enabled -}}
{{- .Values.fallbackNode.nethermind.wsPort }}
{{- else if .Values.fallbackNode.reth.enabled -}}
{{- .Values.fallbackNode.reth.wsPort }}
{{- else -}}
unknown
{{- end -}}
{{- end -}}
