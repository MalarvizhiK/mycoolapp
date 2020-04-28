#!/bin/bash

echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > cert.crt

/bin/linux/amd64/kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  apply -f ./kube/

echo "The build number is ${TRAVIS_BUILD_NUMBER}"
/bin/linux/amd64/kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --certificate-authority=cert.crt \
  --token=$KUBERNETES_TOKEN \
  set image deployment/pypytest pypytest=onestoop/pypytest:${TRAVIS_BUILD_NUMBER} --record
