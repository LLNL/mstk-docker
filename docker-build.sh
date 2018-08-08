#!/bin/bash

# Set image tag env vars
OS_CENTOS=centos
DEBIAN=debian
OS_UBUNTU_14_04=ubuntu_14_04
OS_UBUNTU_16_04=ubuntu_16_04

# Set lcoation for files and toolkit version env vars
DOCKERFILE_FOLDER=Dockerfiles
TOOLKIT_FOLDER=Toolkit_zip_files
TOOLKIT_VERSION=1.4.0

# Set OS variable appropriately; defaults to ubuntu_16_04
case $1 in
    $OS_CENTOS|$DEBIAN|$OS_UBUNTU_14_04|$OS_UBUNTU_16_04)
        OS=$1
        ;;
    *)
        OS=$OS_UBUNTU_16_04
        ;;
esac

# Build docker images
docker build -t mstk-${OS}-base \
    -f ${DOCKERFILE_FOLDER}/Dockerfile.${OS} .

docker build --rm -t mstk-${OS} \
    --build-arg OS=$OS \
    --build-arg TOOLKIT_VERSION=1.4.0 \
    -f ${DOCKERFILE_FOLDER}/Dockerfile.mstk .
