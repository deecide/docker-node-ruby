#!/bin/bash -ex

if [ -z "$NODE_VERSION" ]; then
    read -p "Node version: " NODE_VERSION
fi
if [ -z "$RUBY_VERSION" ]; then
    read -p "Ruby version: " RUBY_VERSION
fi
TAG=$RUBY_VERSION-$NODE_VERSION

docker build -t insurgate/node_ruby:$TAG --build-arg NODE_VERSION=$NODE_VERSION --build-arg RUBY_VERSION=$RUBY_VERSION .
docker build -t insurgate/node_ruby:$TAG-builder --build-arg NODE_VERSION=$NODE_VERSION --build-arg RUBY_VERSION=$RUBY_VERSION --build-arg BUILDER=true .

docker push insurgate/node_ruby:$TAG
docker push insurgate/node_ruby:$TAG-builder
