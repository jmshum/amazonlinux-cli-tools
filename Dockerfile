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
  groff && \
  yum clean all && \
  rm -rf /var/cache/yum

# Install AWS CLI
RUN pip3 install awscli

# Install AWS ECS-CLI
RUN curl -o /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest && \
  chmod +x /usr/local/bin/ecs-cli