{{- define "rocketpool.primaryKINDClient" -}}
{{- if .Values.primaryNode.NAME.enabled -}}
{{- default "NAME" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryKINDClient.httpPort" -}}
{{- if .Values.primaryNode.NAME.enabled -}}
{{- .Values.primaryNode.NAME.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryKINDClient.metricsPort" -}}
{{- if .Values.primaryNode.NAME.enabled -}}
{{- .Values.primaryNode.NAME.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.primaryKINDClient.p2pPort" -}}
{{- if .Values.primaryNode.NAME.enabled -}}
{{- .Values.primaryNode.NAME.p2pPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackKINDClient" -}}
{{- if .Values.fallbackNode.NAME.enabled -}}
{{- default "NAME" }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackKINDClient.httpPort" -}}
{{- if .Values.fallbackNode.NAME.enabled -}}
{{- .Values.fallbackNode.NAME.httpPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackKINDClient.metricsPort" -}}
{{- if .Values.fallbackNode.NAME.enabled -}}
{{- .Values.fallbackNode.NAME.metricsPort }}
{{- end -}}
{{- end -}}

{{- define "rocketpool.fallbackKINDClient.p2pPort" -}}
{{- if .Values.fallbackNode.NAME.enabled -}}
{{- .Values.fallbackNode.NAME.p2pPort }}
{{- end -}}
{{- end -}}
