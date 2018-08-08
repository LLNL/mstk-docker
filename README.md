# mstk-docker

## What is this?
This project runs the Granta MI:Scripting Toolkit for Python inside a docker container for dev purposes.

### Project Maintainer
Samuel Eklund - sam@llnl.gov

### Instructions

1. Make sure you have docker installed (https://www.docker.com/community-edition)
1. Run ./docker-build.sh to build the container.
1. Run ./docker-run.sh to launch the container.

#### Options

You can specify the operating system when building and running the scripts. For example:

`./docker-build.sh debian`

or

`./docker-run.sh centos`

Available operating systems:
- Ubuntu 14.04: ubuntu_14_04
- Ubuntu 16.04: ubuntu_16_04 (default)
- CentOS 7: centos
- Debian: debian