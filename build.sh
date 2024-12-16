#!/bin/bash -ex

if [ -z "$NODE_VERSION" ]; then
    read -p "Node version: " NODE_VERSION
fi
if [ -z "$RUBY_VERSION" ]; then
    read -p "Ruby version: " RUBY_VERSION
fi
TAG=$NODE_VERSION-$RUBY_VERSION

docker build -f Dockerfile.node_ruby -t insurgate/node_ruby:$TAG --build-arg NODE_VERSION=$NODE_VERSION --build-arg RUBY_VERSION=$RUBY_VERSION .
docker push insurgate/node_ruby:$TAG

docker build -f Dockerfile.builder -t insurgate/builder:$TAG --build-arg NODE_VERSION=$NODE_VERSION --build-arg RUBY_VERSION=$RUBY_VERSION .
docker push insurgate/builder:$TAG
