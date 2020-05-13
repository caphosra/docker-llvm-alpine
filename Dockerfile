FROM alpine:3.11

ENV LLVM_FILE_VERSION 9.0.1

ENV LLVM_ARCHIVE llvm-${LLVM_FILE_VERSION}.src.tar.xz
ENV LLVM_DOWNLOAD_URL https://github.com/llvm/llvm-project/releases/download/llvmorg-${LLVM_FILE_VERSION}/${LLVM_ARCHIVE}

RUN \
    set -e; \
    apk update; \
    apk add --no-cache --virtual builddep \
        alpine-sdk \
        build-base \
        util-linux-dev \
        python3 \
        ninja \
        cmake \
        wget;

WORKDIR /tmp

RUN \
    set -e; \
    wget ${LLVM_DOWNLOAD_URL}; \
    tar xJf ${LLVM_ARCHIVE}; \
    mv /tmp/llvm-${LLVM_FILE_VERSION}.src /tmp/llvm;

WORKDIR /tmp/llvm/build

RUN \
    set -e; \
    cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release ..; \
    ninja; \
    ninja install;

RUN \
    set -e; \
    apk del builddep; \
    rm -rf /tmp;
