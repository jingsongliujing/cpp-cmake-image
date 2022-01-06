FROM gcc:10.2.0-bullseye

RUN apt update
RUN apt install -y cmake
RUN apt autoremove -y || true
RUN mkdir /opt
RUN ln /usr/local /opt/gcc10.2