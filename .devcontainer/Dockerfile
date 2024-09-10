FROM ubuntu:22.04 as base

ENV DEBIAN_FRONTEND=noninteractive

COPY ./installer .

RUN bash base.sh

# Bahasa Pemrograman yang digunakan
RUN bash python.sh
RUN bash dart.sh
RUN bash flutter.sh

# Aplikasi tambahan yang digunakan

WORKDIR /workspace