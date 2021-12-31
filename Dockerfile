FROM centos:7

RUN yum update -y
RUN yum groupinstall "Development Tools" -y
RUN yum install cmake3 gmp-devel mpfr-devel libmpc-devel -y
RUN ln -s /usr/bin/cmake3 /usr/bin/cmake