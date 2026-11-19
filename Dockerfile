FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y build-essential cmake wget \
    libboost-filesystem-dev libboost-container-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cmake -S yaml-cpp-yaml-cpp-0.6.3 -B yaml-build -DYAML_CPP_BUILD_TESTS=OFF \
    && cmake --build yaml-build -j"$(nproc)" \
    && cmake --install yaml-build \
    && rm -rf yaml-cpp-0.6.3.tar.gz yaml-cpp-yaml-cpp-0.6.3 yaml-build

COPY . /root/cmake-exercise
WORKDIR /root
