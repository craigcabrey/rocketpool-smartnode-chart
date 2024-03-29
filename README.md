# Rocketpool smartnode Helm chart

**Note: This is not production ready yet, you will [probably] get slashed!**

# Supported Configurations

## Execution (ETH1) Clients

- [x] Besu
- [ ] Erigon
- [ ] EthereumJS
- [ ] Geth[^1]
- [ ] Nethermind
- [ ] Reth

[^1]: [Which you should not be using anyway](https://clientdiversity.org/)

## Consensus (ETH2) Clients

- [ ] Grandine
- [x] Lighthouse
- [ ] Lodestar
- [ ] Nimbus
- [ ] Prysm
- [ ] Teku

# Prerequisites

* `ReadWriteMany` volume capabilities. The rocketpool smartnode needs to coordinate the validator. This is facilitated with a shared volume.
  * Examples: hostPath, NFS, block storage

# Usage

1. Use the wizard to generate a basic values.yaml: `$ wizard.sh`
2. `helm upgrade --install release-name ./rocketpool -f values.yaml -n rocketpool --create-namespace`

See `example/values.yaml` for an extremely minimal setup.

## Known Issues

* **Smartnode & Watchtower crashing after install** This is expected. Once the executor and consensus clients sync, the smartnode containers will "settle".
* **Error when joining smoothing pool** If you see something like the following, it's an issue with the CLI communicating with the rocketpool daemon. The command still went through (confirm with `node status`): `Could not decode set-smoothing-pool-status response: json: cannot unmarshal object into Go struct field SetSmoothingPoolRegistrationStatusResponse.Status of type string`
