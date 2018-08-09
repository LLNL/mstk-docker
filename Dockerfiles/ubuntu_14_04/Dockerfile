FROM ubuntu:14.04

LABEL maintainer='Samuel Eklund sam@llnl.gov'

# Install unzip, python3, pip3, and git
RUN apt-get update \
    && apt-get -y install unzip python3 python3-pip git
RUN pip3 install --upgrade pip

# Set environment variables
ENV os_folder Ubuntu_14_04
