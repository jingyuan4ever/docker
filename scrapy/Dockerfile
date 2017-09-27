# Version: 0.0.1
FROM ubuntu:trusty
MAINTAINER jingyuan

RUN \
    apt-get update && apt-get install -y \
    python-pip \
    libxml2-dev \
    libxslt1-dev \
    python-dev \
    zlib1g-dev \
    libevent-dev \
    libffi-dev \
    libssl-dev

RUN \
    pip install \
    lxml \
    pyOpenSSL \
    cryptography \
    scrapy

WORKDIR /root

ADD testspider.py /root/
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

WORKDIR /root/scrapy
