FROM centos:7

ARG GCC_VERSION=11.2.0

RUN echo GCC_VERSION=${GCC_VERSION}
RUN yum groupinstall "Development Tools" -y
RUN yum install wget cmake3 glibc-static -y
RUn yum autoremove -y
RUN ln -s /usr/bin/cmake3 /usr/bin/cmake
WORKDIR /code
RUN wget https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.xz -O gcc-${GCC_VERSION}.tar.xz --no-check-certificate
RUN tar -xf gcc-11.2.0.tar.xz
WORKDIR /code/build
RUN ../gcc-${GCC_VERSION}/contrib/download_prerequisites
RUN ../gcc-${GCC_VERSION}/configure --enable-languages=c,c++ --disable-multilib
RUN make -j`cat /proc/cpuinfo| grep "processor"| wc -l`