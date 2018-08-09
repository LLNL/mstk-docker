#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script builds docker images.                    #
#####################################################################

# Set env vars
. ./env-vars.sh

# Build docker images
docker build -t mstk-${OS}-base \
    -f ${DOCKERFILE_FOLDER}/${OS}/Dockerfile .

docker build --rm -t mstk-${OS} \
    --build-arg OS=$OS \
    --build-arg TOOLKIT_VERSION=${TOOLKIT_VERSION} \
    --build-arg REQUIREMENTS_FILE=${REQUIREMENTS_FILE} \
    -f ${DOCKERFILE_FOLDER}/mstk/Dockerfile .
