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
    echo "-r | --requirements (required)"
    echo -e "  Specify a Python requirements file to install packages when building.\n"
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
        -r | --requirements )
            shift
            REQUIREMENTS_FILE=$1
            ;;
        -h | --help )
            shift
            usage
            exit
            ;;
    esac
    shift
done

if [ -z $REQUIREMENTS_FILE ]; then
    echo "Must specify a requirements file (-r | --requirements)."
    exit
fi

docker build --rm -t mstk-${OS}-custom \
    --build-arg OS=$OS \
    --build-arg REQUIREMENTS_FILE=$REQUIREMENTS_FILE \
    -f ${DOCKERFILE_FOLDER}/custom/Dockerfile .