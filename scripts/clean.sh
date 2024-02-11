#!/bin/sh
# vim: tabstop=2 softtabstop=2 shiftwidth=2 expandtab

if [ -z "${DEBUG}" ]; then
  read -p "dev use only! if you don't know what you are doing, say no! you have been warned!" \
    confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
fi

kubectl delete --all job -n rocketpool --force
kubectl delete --all pod -n rocketpool --force
