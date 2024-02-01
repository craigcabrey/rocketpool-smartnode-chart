#!/usr/bin/env python3


import os
import sys


import yaml


CONSENSUS_CHOICES = set(['lighthouse'])
EXECUTOR_CHOICES = set(['besu', 'geth', 'reth'])
NETWORK_CHOICES = set(['holesky', 'mainnet'])
YES_NO_CHOICES = set(['yes', 'no'])


def input_bool(value) -> bool:
    match value:
        case 'yes': return True
        case 'no': return False


def get_selection(preamble, choices, type=None) -> str:
    selection = None
    print(f'{preamble}: {choices}')

    while selection not in choices:
        selection = input('Selection: ')

    if type:
        selection = type(selection)

    return selection


def consensus_selection() -> str:
    return get_selection(
        'Select a consensus client',
        CONSENSUS_CHOICES,
    )


def executor_selection() -> str:
    return get_selection(
        'Select an execution client',
        EXECUTOR_CHOICES,
    )


def main() -> bool:
    values = {
        'global': {
            'network': get_selection(
                'Select network',
                NETWORK_CHOICES,
            ),
            'checkpointSync': {
                'enabled': False,
            },
        },
        'primaryNode': {
            executor_selection(): {
                'enabled': True,
            },
            consensus_selection(): {
                'enabled': True,
            },
        },
    }

    if get_selection(
            'Enable fallback node',
            YES_NO_CHOICES,
            type=input_bool,
    ):
        values['fallbackNode'] = {
            'enabled': True,
            executor_selection(): {
                'enabled': True,
            },
            consensus_selection(): {
                'enabled': True,
            },
        }


    with open('values.yaml', 'w') as outfile:
        yaml.dump(
            values,
            outfile,
            default_flow_style=False,
        )

    print(
        f'Next, run `helm upgrade --install {values["global"]["network"]} '
        './rocketpool -f values.yaml -n rocketpool`'
    )
    return True


if __name__ == '__main__':
    sys.exit(0 if main() else 1)
