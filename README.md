# Rocketpool smartnode Helm chart

**Note: This is not production ready yet, you will get slashed!**

## Limitations

Currently there is support for `besu` as the execution client & `lighthouse` as the consensus/validator client. The intent is to add support for all clients which rocketpool supports, but this requires contributions & support.

## Prerequisites

* `ReadWriteMany` volume capabilities. The rocketpool smartnode needs to coordinate the validator. This is facilitated with a shared volume.
  * Examples: hostPath, NFS, block storage

## Usage

1. Use the wizard to generate a basic values.yaml: `$ wizard.sh`
2. `helm upgrade --install release-name ./rocketpool -f values.yaml -n rocketpool --create-namespace`

See `values.example.yaml` for an extremely minimal setup.

## Smartnode & Watchtower crashing after install

This is expected. Once the executor and consensus clients sync, the smartnode containers will "settle".

## TODO

- [ ] Support all clients
- [ ] Fix all the hardcoded values
- [ ] Setup CI
- [ ] Support longhorn [volume encryption](https://longhorn.io/docs/1.5.3/advanced-resources/security/volume-encryption/) for keys
- [x] Test & fix scripts for restarting/stopping validator
