#!/bin/bash

echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > cert.crt

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  apply -f ./kube/

kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  set image deployment/pypytest pypytest=onestoop/pypytest:${TRAVIS_BUILD_NUMBER} --record
