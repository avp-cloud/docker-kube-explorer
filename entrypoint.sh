#!/usr/bin/env bash

if [[ -v KUBECONFIG ]]; then
KUBECONFIG_ARG="--kubeconfig=$KUBECONFIG"

/kube-explorer $KUBECONFIG_ARG --http-listen-port=8080 --https-listen-port=0