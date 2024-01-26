# Rocketpool smartnode Helm chart

**Note: This is not production ready yet, you will get slashed!**

## Usage

`helm upgrade --install release-name ./rocketpool -f values.yaml -n rocketpool --create-namespace`

See `values.example.yaml` for an extremely minimal setup.

## Smartnode & Watchtower crashing after install

This is expected. Once the executor and consensus clients sync, the smartnode containers will "settle".
