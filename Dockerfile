FROM ubuntu:16.04

LABEL maintainer=webframeworks@manheim.com
LABEL repo=423319072129.dkr.ecr.us-east-1.amazonaws.com/terraform-nodejs-builder

RUN apt update \
    && apt upgrade -q -y \
    && apt install -q -y python3 python3-pip curl unzip git make \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -q -y nodejs \
    && pip3 install --upgrade pip \
    && pip3 install awscli virtualenv Jinja2 \
    && pip3 install awsebcli==3.10.2 \
    && curl -LO https://releases.hashicorp.com/terraform/0.9.6/terraform_0.9.6_linux_amd64.zip \
    && curl -LO https://releases.hashicorp.com/consul/0.8.5/consul_0.8.5_linux_amd64.zip \
    && unzip consul_0.8.5_linux_amd64.zip \
    && unzip terraform_0.9.6_linux_amd64.zip \
    && mv terraform /usr/bin/ \
    && mv consul /usr/bin/ \
    && chmod +x /usr/bin/terraform \
    && chmod +x /usr/bin/consul \
    && rm consul_0.8.5_linux_amd64.zip terraform_0.9.6_linux_amd64.zip

WORKDIR /app
CMD sh build.sh
