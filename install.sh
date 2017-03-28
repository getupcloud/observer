#!/bin/bash

set -exu

oc -n getup new-app -f observer.yaml --param=CLIENT_NAME=$1 --param=APPS_DOMAIN=$2 --param=HANDLE_EVENT_SLACK_WEBHOOK="$3"
oadm -n getup policy add-cluster-role-to-user cluster-reader system:serviceaccount:getup:observer
