FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Basic build tools: compiler + make, CMake, and tools to download/unpack yaml-cpp later
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Boost: Container and Filesystem
RUN apt-get update && apt-get install -y \
    libboost-filesystem-dev \
    libboost-container-dev \
    && rm -rf /var/lib/apt/lists/*


COPY . /root/cmake-exercise

WORKDIR /root
