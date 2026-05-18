FROM gcc:latest

WORKDIR /usr/src/fib

COPY fib.cpp Makefile ./

RUN apt-get update && \
    apt-get install -y make && \
    apt-get clean

RUN make all

RUN make DESTDIR=/ install

RUN apt-get remove -y make && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
#
