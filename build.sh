#!/bin/bash

# Docker image we extend from
from="$1"

# Tag of the built image
tag="$2"

# Context directory relative to project root
context="$3"

# Path to Dockerfile
dockerfile="$4"

# Debug mode on/off (does not push images)
debug="$5"

# create temp dockerfile
tmpDockerfile="tmp/Dockerfile"
cp $dockerfile $tmpDockerfile

sed -i -e "s#\$PARENT_IMAGE#$from#g" "$tmpDockerfile"

docker build \
    -t $tag \
    -f $tmpDockerfile \
$context

if [ -z $debug ]; then
    docker push $tag
    rm $tmpDockerfile
fi
