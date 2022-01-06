ARG GCC_VERSION=10.2
ARG CMAKE_VERSION=3.22.1
FROM gcc:${GCC_VERSION}

RUN echo GCC_VERSION=${GCC_VERSION}
RUN echo CMAKE_VERSION=${CMAKE_VERSION}
RUN apt update
RUN apt install wget
RUN apt autoremove -y || true
RUN mkdir /opt || true
RUN ln -s /usr/local /opt/gcc${GCC_VERSION}
WORKDIR /src
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
RUN tar -zxf cmake-${CMAKE_VERSION}.tar.gz
WORKDIR /src/build
RUN ../cmake-${CMAKE_VERSION}.tar.gz/configure
RUN make && make install
WORKDIR /
RUN rm -rf /src
RUN cmake --version