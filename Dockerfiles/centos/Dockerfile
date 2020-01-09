FROM centos:7

LABEL maintainer='Samuel Eklund sam@llnl.gov'

# Install unzip, python3, and pip3
RUN yum update -y \
    && yum install -y epel-release \
    && yum install -y unzip python34 python34-pip git
RUN pip3 install --upgrade pip

# Set environment variables
ENV os_folder CentOS7
