# Amazon Linux 2 with AWS CLI / ECS CLI tools
This image is based on [Amazon Linux 2](https://hub.docker.com/_/amazonlinux) and also has the [AWS CLI](https://aws.amazon.com/cli/) tools, [ECS CLI](https://docs.aws.amazon.com/cli/latest/reference/ecs/index.html) tools and [python3](https://www.python.org/download/releases/3.0/) / pip3 installed.

## Usage
This image is designed to be run in interactive mode with a bash shell. This will allow you to configure the AWS CLI to connect to your AWS account.

### Building the Docker image
```bash
docker image build -t jmshum/amazonlinux-cli-tools .
```

### Running the Docker image
```bash
docker container run --rm -it jmshum/amazonlinux-cli-tools bash
```
Verify the AWS CLI tool.
```bash
aws --version
```
Verify the ECS CLI tool.
```bash
ecs-cli --version
```
Run the following after the container is running to configure the AWS CLI tool.
```bash
aws configure
```