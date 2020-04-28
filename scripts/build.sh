#!/bin/sh
docker build -t onestoop/pypytest:$TRAVIS_BUILD_NUMBER .
docker push onestoop/pypytest
