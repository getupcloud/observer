#!/bin/bash

set -exu

oc -n getup new-app -f observer.yaml \
    --param=APPS_DOMAIN=$1 \
    --param=HANDLE_EVENT_SLACK_WEBHOOK="$2" \
    ${3:+--params=HANDLE_EVENT_SLACK_CHANNEL="#$3"}

oadm -n getup policy add-cluster-role-to-user cluster-reader system:serviceaccount:getup:observer
