#!/bin/bash

#####################################################################
#                                                                   #
# Author: Samuel Eklund                                             #
# Email: sam@llnl.gov                                               #
#                                                                   #
# Description: This script runs docker containers based on images   #
# built in docker-build.sh.                                         #
#####################################################################


# Set env vars
. ./env-vars.sh

docker run --rm mstk-$OS