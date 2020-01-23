FROM python:3.7

LABEL maintainer='Data Lifecycle Management Team - dlm@llnl.gov'

# Set environment variables
ENV TOOLKIT_VERSION=2.0.0
ENV V_TOOLKIT_VERSION v$TOOLKIT_VERSION
ENV install_version MI_ScriptingToolkit_${V_TOOLKIT_VERSION}_for_Python
ENV zip_file Toolkit_zip_files/${install_version}.zip
ENV toolkit_folder MIScriptingToolkit-${TOOLKIT_VERSION}
ENV toolkit_whl ${toolkit_folder}-py3-none-any.whl
ENV toolkit_dir /mstk
ENV os_folder Debian9

# Copy and install toolkit
RUN mkdir $toolkit_dir
WORKDIR $toolkit_dir
COPY $zip_file $zip_file
RUN unzip $zip_file
WORKDIR /$toolkit_dir/Installers/$os_folder/
RUN pip install $toolkit_whl

# Copy and install any additional reqs
RUN mkdir /add_reqs
WORKDIR /add_reqs
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN mkdir /data
WORKDIR /

CMD ["/bin/bash"]