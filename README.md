# mstk-docker

## Description
This project runs the Granta MI:Scripting Toolkit V2 for Python inside a docker container for develpment purposes.


## Requiremenets
- Docker and Docker Compose
- A My Granta account

## Getting Started

1. Make sure you have docker installed.
    - [Download for Windows or Mac](https://www.docker.com/products/docker-desktop)
    - [Instructions for Linux flavors](https://docs.docker.com/install/).
1. [Download the MIScriptingToolkit V2](https://grantadesign.com/industry/support/).
    - Click on "Restricted" on the left side and login with your My Granta account.
    - Click on "Download" on the left side in the Download Software section.
    - Select the Granta MI version that you require. The MI:Scripting Toolkit V2 requires  at least Granta MI v11.0.
    - Select "Options".
    - Scroll down to "MI:Scripting Toolkit v2.0 for Python" and download the zip file.
1. Copy the zip file to the `Toolkit_zip_files` folder. 
    > **_NOTE:_** Currently only version 2.0 of the scripting toolkit is supported.

1. Run `docker-compose build` to build the container.
    > **_NOTE:_** If you would like to install additional python packages into the image you can list these in the included `requirements.txt` file. You will then need to run a build command again.

## Running the container

1. Run `docker-compose run mstk` to run the container and drop into an interactive shell.
1. Run `docker-compose run mstk python` to run the container and drop into a Python REPL. Alternativly, you can uncomment the `command` portion of the `docker-compose.yml` file and run `docker-compose run mstk` to acheive the same effect.
    - You can verify you have the toolkit available by typing `from GRANTA_MIScriptingToolkit import granta as gdl` into your REPL.

## Options

- If you would like to mount a folder from your host into the mstk docker container, uncomment the `volumes` section of the `docker-compose.yml` file and put in the path to the folder you would like to mount.

## Extending this image

If you would like to build upon this docker image you must follow the above build instructions first listed in the **Getting Started** section. Then in your Dockerfile begin with `FROM mstk-docker_mstk`. That's it! Your new docker image will now have the Granta:MI Scripting Toolkit available in the system Python environment.

## Authors
- Data Lifecycle Management Team - https://github.com/orgs/LLNL/teams/dlm
- Joe Eklund - https://github.com/joe-eklund
- Sam Eklund - https://github.com/samueldeklund
- Sam Maphey - https://github.com/sammaphey 

## Contributing

Create an issue or fork and open a PR if you'd like to contribute.

mstk-docker is distributed under the terms of the MIT license. All new
contributions must be made under this license.

## Release

LLNL-CODE-766762

SPDX-License-Identifier: MIT