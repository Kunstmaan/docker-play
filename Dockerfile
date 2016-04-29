FROM ubuntu:xenial

RUN apt-get update && \
    apt-get -y -qq upgrade && \
    apt-get -y -qq install openjdk-8-jdk wget unzip && \
    wget https://downloads.typesafe.com/typesafe-activator/1.3.10/typesafe-activator-1.3.10.zip && \
    unzip typesafe-activator-1.3.10.zip -d / && \
    rm -Rf typesafe-activator-1.3.10.zip && \
    chmod a+x /activator-dist-1.3.10/bin/activator && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:/activator-dist-1.3.10/bin/

RUN mkdir /app
WORKDIR /app
