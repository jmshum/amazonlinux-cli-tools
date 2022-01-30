## Amazon Linux 2 with AWS CLI tools including ECS-CLI and python3/pip3

## Build Example:
#   docker image build -t jmshum/amazonlinux-cli-tools . 

## Run Example:
#   docker container run --rm -it jmshum/amazonlinux-cli-tools bash

## Configure AWS CLI:
#   aws configure

FROM amazonlinux:2

# Install tools (python3, vim)
RUN yum update -y && \
  yum install -y \
  python3 \
  vim \
  wget \
  unzip \
  less \
  groff && \
  yum clean all && \
  rm -rf /var/cache/yum

# Install AWS CLI v2
RUN wget https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -O awscliv2.zip && \
  unzip awscliv2.zip && \
  ./aws/install

# Install AWS ECS-CLI
RUN curl -Lo /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-arm64-latest && \
  chmod +x /usr/local/bin/ecs-cli

WORKDIR /root
