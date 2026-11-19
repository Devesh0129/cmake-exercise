FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

COPY . /root/cmake-exercise

WORKDIR /root
