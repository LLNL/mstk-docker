# mstk-docker

## Description
This project runs the Granta MI:Scripting Toolkit for Python inside a docker container for dev purposes. It also provides a tool to build an image with customized Python packages.

## Authors
- Joe Eklund - https://github.com/joe-eklund
- Sam Eklund - https://github.com/samueldeklund

## Getting Started

1. Make sure you have docker installed (https://www.docker.com/community-edition).
1. Download the MIScriptingToolkit from https://mygranta.grantadesign.com/downloads.
1. Copy the MIScriptingToolkit_vX.X.X.zip file to the Toolkit_zip_files folder. Currently only version 1.4.0 is supported.
1. Run `./docker-build.sh` to build the container.
    - Run `./custom-docker-build.sh -r /path/to/requirements.txt` to build a custom container.
1. Run `./docker-run.sh` to launch the container.
    - Run `./custom-docker-run.sh` to launch the custom container.

## Options

- Running `./docker-build.sh` with no arguments will build a container with default settings. Run `./docker-build.sh -h` to see a list of options.

- You can specify the operating system when building and running the scripts. For example:

    `./docker-build.sh -o debian`

    or

    `./docker-run.sh -o centos`

    Available operating systems:
    - ubuntu_14_04 (Ubuntu 14.04)
    - ubuntu_16_04 (Ubuntu 16.04, default)
    - centos (CentOS 7)
    - debian (Debian 8)

### Run a custom container and load a custom script

If you would like to use the custom container you built using the `./custom-docker-build.sh` script, you can run the following command:

`./custom-docker-run.sh -f /path/to/test_toolkit.py`

Make sure to replace `test_toolkit.py` with the name of your Python script.


## Getting Involved

If you'd like to get involved, you can email either of the authors, create an issue, or fork and open a PR.

## Contributing

Create an issue or fork and open a PR if you'd like to contribute.

mstk-docker is distributed under the terms of the MIT license. All new
contributions must be made under this license.

## Release

LLNL-CODE-766762

SPDX-License-Identifier: MIT