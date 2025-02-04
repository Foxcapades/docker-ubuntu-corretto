FROM ubuntu:24.10

LABEL io.foxcapades.jdk-version="21"

RUN apt-get update \
    && apt-get install -y wget java-common \
    && wget -q https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.deb -O java.deb \
    && wget -q https://corretto.aws/downloads/latest_sha256/amazon-corretto-21-x64-linux-jdk.deb -O java.sum \
    && sha256sum java.deb | grep -q "$(cat java.sum)" \
    && dpkg -i java.deb \
    && rm java.deb java.sum \
    && apt-get purge wget \
    && apt-get clean
