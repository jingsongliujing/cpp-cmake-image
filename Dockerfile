FROM gcc:10.2.0

RUN apt update
RUN apt install -y cmake
RUN apt autoremove -y || true
RUN ls /
RUN ln /usr/local /opt/gcc10.2