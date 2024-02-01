#!/bin/sh

REPO=$(git rev-parse --show-toplevel)

if [ ! -d "${REPO}/.venv" ]; then
  python3 -m venv .venv
  source .venv/bin/activate
  pip3 install -r requirements.txt
fi

source .venv/bin/activate

python3 ${REPO}/scripts/wizard.py
