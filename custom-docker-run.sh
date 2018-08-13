#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script runs docker containers based on images   #
# built in custom-docker-build.sh.                                  #
#####################################################################


# Set env vars
. ./env-vars.sh

usage()
{
    echo -e "\n-f | --file"
    echo -e "Pass in a Python script to run in the container (required) .\n"
    echo "-o | --operating-system"
    echo "  Available operating systems:"
    echo "  - centos"
    echo "  - debian"
    echo "  - ubuntu_14_04"
    echo -e "  - ubuntu_16_04 (default)\n"
    echo "-h | --help"
    echo -e "  Show this help message.\n"
}

while [ "$1" != "" ]; do
    case $1 in
        -f | --file )
            shift
            PYTHON_FILE=$1
            ;;
        -o | --operating-system )
            shift
            OS=$1
            ;;
        -h | --help )
            shift
            usage
            exit
            ;;
    esac
    shift
done

if [ -z $PYTHON_FILE ]; then
    echo "Must specify a Python script (-f | --file)."
    exit
fi

# Allows loading file into container from any directory
PYTHON_FILE="$(abspath $PYTHON_FILE)"
DIR="$(dirname $PYTHON_FILE)"
FILE="$(basename $PYTHON_FILE)"

docker run -it --rm -v "$DIR":/usr/src/myapp -w /usr/src/myapp mstk-$OS-custom python3 $FILE