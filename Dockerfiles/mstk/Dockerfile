ARG OS
ARG IMAGE_NAME=mstk-${OS}-base

FROM $IMAGE_NAME

LABEL maintainer='Samuel Eklund sam@llnl.gov'

# Set environment variables
ENV TOOLKIT_VERSION=2.0.0
ENV dockerfile_folder Dockerfiles
ENV V_TOOLKIT_VERSION v$TOOLKIT_VERSION
ENV mstk_version MI_ScriptingToolkit_${V_TOOLKIT_VERSION}_for_Python
ENV zip_file Toolkit_zip_files/${mstk_version}.zip
ENV toolkit_folder MIScriptingToolkit-${TOOLKIT_VERSION}
ENV toolkit_whl ${toolkit_folder}-py3-none-any.whl
ENV toolkit_dir /mstk

# Copy and install toolkit
RUN mkdir $toolkit_dir
WORKDIR $toolkit_dir
COPY $zip_file $zip_file
RUN unzip $zip_file
# Note: $os_folder var comes from OS-specific Dockerfile
WORKDIR /$toolkit_dir/Installers/$os_folder/
RUN pip install $toolkit_whl