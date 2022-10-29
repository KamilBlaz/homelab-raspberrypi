FROM python:3.9-slim
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /code
ENV ANSIBLE_VERSION=6.2.0

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
      openssl \
      sshpass \
      git \
      jq \
      wget \
      ssh \
    && pip3 install --no-cache-dir \
      ansible==${ANSIBLE_VERSION} \
      ansible-lint \
      docker \

