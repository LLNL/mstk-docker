ARG OS
ARG IMAGE_NAME=mstk-${OS}

FROM $IMAGE_NAME

ARG REQUIREMENTS_FILE

LABEL maintainer='Samuel Eklund sam@llnl.gov'

# Set environment variables
ENV dockerfile_folder Dockerfiles
# ENV V_TOOLKIT_VERSION v$TOOLKIT_VERSION
# ENV zip_file Toolkit_zip_files/MI_ScriptingToolkit_${V_TOOLKIT_VERSION}.zip
# ENV toolkit_folder MIScriptingToolkit-${TOOLKIT_VERSION}
# ENV toolkit_gzip ${toolkit_folder}.tar.gz
# ENV test_install test_toolkit.py
# ENV toolkit_dir /mstk

# Install Python requirements
RUN mkdir /requirements
WORKDIR /requirements
RUN echo $REQUIREMENTS_FILE
COPY $REQUIREMENTS_FILE $REQUIREMENTS_FILE
RUN pip3 install -r $REQUIREMENTS_FILE

# Copy test script
COPY $test_install /$toolkit_dir/$test_install

CMD python3 /$toolkit_dir/$test_install
