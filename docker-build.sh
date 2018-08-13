#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script builds docker images.                    #
#####################################################################

usage()
{
    echo -e "\n-o | --operating-system"
    echo "  Available operating systems:"
    echo "  - centos"
    echo "  - debian"
    echo "  - ubuntu_14_04"
    echo -e "  - ubuntu_16_04 (default)\n"
    # echo "-t | --toolkit-version"
    # echo -e "Choose the tookit version when building. Must have a corresponding zip file in Toolkit_zip_files folder. Valid options are: "1.4, 1.3".\n"
    echo "-h | --help"
    echo -e "  Show this help message.\n"
}

# Set env vars
. ./env-vars.sh

while [ "$1" != "" ]; do
    case $1 in
        -o | --operating-system )
            shift
            OS=$1
            ;;
        # -t | --toolkit-version )
        #     shift
        #     TOOLKIT_VERSION=$1
        #     ;;
        -h | --help )
            shift
            usage
            exit
            ;;
    esac
    shift
done

TOOLKIT_FILENAME="MI_ScriptingToolkit_v${TOOLKIT_VERSION}.zip"

# Check for existence of zip file.
if [ ! -f Toolkit_zip_files/${TOOLKIT_FILENAME} ] ; then
    echo "Must have a corresponding zip file for provided toolkit version (${TOOLKIT_VERSION})"
    exit
fi

# Build docker images
docker build -t mstk-${OS}-base \
    -f ${DOCKERFILE_FOLDER}/${OS}/Dockerfile .

docker build --rm -t mstk-${OS} \
    --build-arg OS=$OS \
    -f ${DOCKERFILE_FOLDER}/mstk/Dockerfile .
