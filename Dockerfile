FROM gcc:11.2.0-bullseye

ARG GCC_VERSION=11.2.0

RUN echo GCC_VERSION=${GCC_VERSION}
RUN apt update
RUN apt install -y cmake libc6-dev
RUN apt autoremove -y || true
RUN which gcc
RUN gcc --version