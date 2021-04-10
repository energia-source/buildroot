FROM debian:buster

ENV FORCE_UNSAFE_CONFIGURE 1
ENV VERSION 2021.02.1

RUN apt update && \
    apt install -y wget nano linux-headers-$(uname -r) && \
    apt install -y sed make binutils gcc g++ bash patch gzip bzip2 perl tar cpio python unzip rsync wget libncurses-dev && \
    apt install -y bc zlib1g-dev git

WORKDIR /

COPY entrypoint.sh .

RUN chmod +x ./entrypoint.sh && \
    wget https://buildroot.org/downloads/buildroot-${VERSION}.tar.gz && \
    tar xvzf buildroot-${VERSION}.tar.gz && \
    mv buildroot-${VERSION} /buildroot && \
    rm buildroot-${VERSION}.tar.gz

VOLUME /buildroot/output/images

ENTRYPOINT ./entrypoint.sh
