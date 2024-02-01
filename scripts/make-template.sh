#!/bin/sh

KIND="${1}"
NAME="${2}"
REPO=$(git rev-parse --show-toplevel)

BASE_TEMPLATE="${REPO}/scripts/_base.tpl"
TEMPLATE_PATH="${REPO}/rocketpool/templates/${KIND}/_${NAME}.tpl"
sed -e "s/KIND/${KIND^}/g" -e "s/NAME/${NAME}/g" $BASE_TEMPLATE > $TEMPLATE_PATH
