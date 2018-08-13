ARG OS
ARG IMAGE_NAME=mstk-${OS}

FROM $IMAGE_NAME

ARG REQUIREMENTS_FILE

LABEL maintainer='Samuel Eklund sam@llnl.gov'

# Set environment variables
ENV dockerfile_folder Dockerfiles

# Install Python requirements
RUN mkdir /requirements
WORKDIR /requirements
RUN echo $REQUIREMENTS_FILE
COPY $REQUIREMENTS_FILE $REQUIREMENTS_FILE
RUN pip3 install -r $REQUIREMENTS_FILE