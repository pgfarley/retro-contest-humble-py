#!/bin/sh

if [ $# -ne 2 ]; then
    echo "usage ./build_nogpu.sh AGENT VERSION (ex. ./build_nogpu.sh rainbow v1"
    exit 1
fi

echo "Building $1:$2.nogpu"
docker build -f $1.docker --build-arg NOGPU=1 --cache-from $DOCKER_REGISTRY/$1:$2.nogpu -t $DOCKER_REGISTRY/$1:$2.nogpu .

echo "Building $1:$2"
docker build -f $1.docker --cache-from $DOCKER_REGISTRY/$1:$2 -t $DOCKER_REGISTRY/$1:$2 .

