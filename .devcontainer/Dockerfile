FROM ubuntu:22.04 as base

ENV DEBIAN_FRONTEND=noninteractive

COPY ./installer .

RUN base.sh

# Bahasa Pemrograman yang digunakan
RUN python.sh
RUN dart.sh
RUN flutter.sh

# Aplikasi tambahan yang digunakan

WORKDIR /workspace