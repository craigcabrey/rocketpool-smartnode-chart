#!/bin/sh
# vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab

debug() {
  if [ ! -z "${RKT_DEBUG}" ]; then
    echo $1
  fi
}
