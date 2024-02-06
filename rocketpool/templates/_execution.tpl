{{- define "rocketpool.executionClient" -}}
  {{ $clients := list "besu" "erigon" "ethereumjs" "geth" "nethermind" "reth" }}
  {{- range $key, $value := $clients -}}
    {{- if (get $ $value).enabled -}}
      {{- $result := dict "name" $value "enginePort" (get $ $value).authPort "httpPort" (get $ $value).httpPort "metricsPort" (get $ $value).metricsPort "p2pPort" (get $ $value).p2pPort "wsPort" (get $ $value).wsPort -}}
      {{- $result | toJson }}
    {{- end -}}
  {{- end -}}
{{- end -}}
