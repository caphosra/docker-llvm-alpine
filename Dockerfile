FROM alpine:3.11

ENV LLVM_FILE_VERSION 10.0.0

ENV LLVM_ARCHIVE llvm-${LLVM_FILE_VERSION}.src.tar.xz
ENV LLVM_DOWNLOAD_URL https://github.com/llvm/llvm-project/releases/download/llvmorg-${LLVM_FILE_VERSION}/${LLVM_ARCHIVE}

RUN \
    apk update; \
    apk add --no-cache --virtual builddep \
        alpine-sdk \
        build-base \
        util-linux-dev \
        ninja \
        cmake \
        wget;

WORKDIR /tmp

RUN \
    wget ${LLVM_DOWNLOAD_URL}; \
    tar xJf ${LLVM_ARCHIVE}; \
    mv /tmp/llvm-${LLVM_FILE_VERSION}.src /tmp/llvm;

WORKDIR /tmp/llvm/build

RUN \
    cmake -G Ninja ..; \
    ninja; \
    ninja install;

RUN \
    apk del builddep; \
    rm -rf /tmp;
