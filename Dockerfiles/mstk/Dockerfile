ARG OS
ARG IMAGE_NAME=mstk-${OS}-base

FROM $IMAGE_NAME

ARG REQUIREMENTS_FILE=requirements.txt

LABEL maintainer='Samuel Eklund sam@llnl.gov'

# Set environment variables
ENV TOOLKIT_VERSION=1.4.0
ENV dockerfile_folder Dockerfiles
ENV V_TOOLKIT_VERSION v$TOOLKIT_VERSION
ENV zip_file Toolkit_zip_files/MI_ScriptingToolkit_${V_TOOLKIT_VERSION}.zip
ENV toolkit_folder MIScriptingToolkit-${TOOLKIT_VERSION}
ENV toolkit_gzip ${toolkit_folder}.tar.gz
ENV toolkit_dir /mstk

# Copy and install toolkit
RUN mkdir $toolkit_dir
WORKDIR $toolkit_dir
COPY $zip_file $zip_file
RUN unzip $zip_file
# Note: $os_folder var comes from OS-specific Dockerfile
WORKDIR /$toolkit_dir/$V_TOOLKIT_VERSION/$os_folder/
RUN tar -xf $toolkit_gzip
WORKDIR /$toolkit_dir/$V_TOOLKIT_VERSION/$os_folder/$toolkit_folder
RUN python3 setup.py install