ARG GCC_VERSION=10.2
FROM gcc:${GCC_VERSION}

RUN apt update
RUN apt install -y cmake
RUN apt autoremove -y || true
RUN mkdir /opt || true
RUN ln -s /usr/local /opt/gcc${GCC_VERSION}