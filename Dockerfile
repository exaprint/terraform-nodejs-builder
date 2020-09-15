FROM alpine:latest
LABEL maintainer=kevin.monteiro@exagroup.biz
LABEL repo=exaprint/terraform-nodejs-builder

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
      && echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
      && apk add --no-cache libuv http-parser \
      && apk add --no-cache py3-pip curl tar unzip zip git make ruby ruby-rdoc ruby-irb gcc musl-dev libffi-dev openssl-dev \
      && apk add --no-cache --virtual .pynacl_deps build-base python3-dev \
      && apk add --no-cache --force nodejs nodejs-npm \
      && gem install awssume --no-document \
#      && pip3 install --upgrade pip \
#      && pip3 install awscli virtualenv Jinja2 awsebcli \
      && pip3 install awscli virtualenv \
#      && npm install -g underscore \
      && curl -LO https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip \
      && curl -LO https://releases.hashicorp.com/consul/0.8.5/consul_0.8.5_linux_amd64.zip \
      && unzip consul_0.8.5_linux_amd64.zip \
      && unzip terraform_0.11.7_linux_amd64.zip \
      && mv terraform /usr/bin/ \
      && mv consul /usr/bin/ \
      && chmod +x /usr/bin/terraform \
      && chmod +x /usr/bin/consul \
      && rm consul_0.8.5_linux_amd64.zip terraform_0.11.7_linux_amd64.zip \
      && mkdir -p /root

# USER builder
ENV HOME=/root

ENTRYPOINT ["/bin/sh", "-c"]
