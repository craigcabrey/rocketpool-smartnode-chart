{{- define "rocketpool.executionClient" -}}
{{- if .Values.ethereumNode.besu.enabled -}}
{{- default "besu" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.executionClient.enginePort" -}}
{{- if .Values.ethereumNode.besu.enabled -}}
{{- .Values.ethereumNode.besu.authPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.executionClient.httpPort" -}}
{{- if .Values.ethereumNode.besu.enabled -}}
{{- .Values.ethereumNode.besu.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.executionClient.metricsPort" -}}
{{- if .Values.ethereumNode.besu.enabled -}}
{{- .Values.ethereumNode.besu.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.executionClient.p2pPort" -}}
{{- if .Values.ethereumNode.besu.enabled -}}
{{- .Values.ethereumNode.besu.p2pPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.executionClient.wsPort" -}}
{{- if .Values.ethereumNode.besu.enabled -}}
{{- .Values.ethereumNode.besu.wsPort}}
{{- end -}}
{{- end -}}
