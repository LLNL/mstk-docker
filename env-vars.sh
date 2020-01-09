#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script sets environment variables for both the  #
# docker-build.sh and docker-run.sh scripts.                        #
#####################################################################

# Set env vars for image tags
OS_CENTOS=centos
DEBIAN=debian
OS_UBUNTU_14_04=ubuntu_14_04
OS_UBUNTU_16_04=ubuntu_16_04
# Sets default OS to Ubuntu 16.04
OS=$OS_UBUNTU_16_04

# Set version env vars for file locations and for toolkit version
DOCKERFILE_FOLDER=Dockerfiles
TOOLKIT_FOLDER=Toolkit_zip_files
TOOLKIT_VERSION=2.0.0

# Function to grab the full path of a file, used in run scripts
abspath () {
    case "$1" in /*)printf "%s\n" "$1";; *)printf "%s\n" "$PWD/$1";; esac; 
    }