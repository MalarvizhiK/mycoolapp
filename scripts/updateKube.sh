#!/bin/sh
sed 's/VERSION/$TRAVIS_BUILD_NUMBER/g' /kube/deployment.yml > kube/deployment.yml
cat kube/deployment.yml
