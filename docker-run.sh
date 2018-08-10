#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script runs docker containers based on images   #
# built in docker-build.sh.                                         #
#####################################################################

usage()
{
    echo -e "\n-o | --operating-system"
    echo "  Available operating systems:"
    echo "  - centos"
    echo "  - debian"
    echo "  - ubuntu_14_04"
    echo -e "  - ubuntu_16_04 (default)\n"
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
        -h | --help )
            shift
            usage
            exit
            ;;
    esac
    shift
done

docker run --rm mstk-$OS