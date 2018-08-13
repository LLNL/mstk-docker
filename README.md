# mstk-docker

## What is this?
This project runs the Granta MI:Scripting Toolkit for Python inside a docker container for dev purposes. It also provides a tool to build an image with customized Python packages.

### Project Maintainer
Samuel Eklund - sam@llnl.gov

### Instructions

1. Make sure you have docker installed (https://www.docker.com/community-edition).
1. Copy the MIScriptingToolkit_vX.X.zip file to the Toolkit_zip_files folder. You may need to rename the file to fit the pattern above.
1. Run `./docker-build.sh` to build the container.
    - Run `./custom-docker-build.sh -r /path/to/requirements.txt` to build a custom container.
1. Run `./docker-run.sh` to launch the container.
    - Run `./custom-docker-run.sh` to launch the custom container.

#### Options

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

- You can specify the version of the toolkit you would like to use. This is only available when building an image and you must have a corresponding zip file in the Toolkit_zip_files folder. Current default is v1.4. For example:

    `./docker-build.sh -t 1.3`

#### Run a custom container and load a custom script

If you would like to use the custom container you built using the `./custom-docker-build.sh` script, you can run the following command:

`./custom-docker-run.sh -f /path/to/test_toolkit.py`

Make sure to replace `test_toolkit.py` with the name of your Python script.