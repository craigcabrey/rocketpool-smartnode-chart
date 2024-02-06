{{- define "rocketpool.consensusClient" -}}
  {{ $clients := list "grandine" "lighthouse" "lodestar" "nimbus" "prysm" "teku" }}
  {{- range $key, $value := $clients -}}
    {{- if (get $ $value).enabled -}}
      {{- $result := dict "name" $value "httpPort" (get $ $value).httpPort "metricsPort" (get $ $value).metricsPort "p2pPort" (get $ $value).p2pPort -}}
      {{- $result | toJson }}
    {{- end -}}
  {{- end -}}
{{- end -}}
