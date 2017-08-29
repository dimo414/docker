FROM debian:testing

# UTF-8 support - why is this still a thing?!
# https://wiki.debian.org/Locale#Manually
# http://stackoverflow.com/a/38553499/113632
RUN apt-get update && apt-get install -y locales && \
  sed -i -e 's/# \(en_US.UTF-8.*\)/\1/' /etc/locale.gen && \
  locale-gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8


RUN apt-get update && apt-get install -y \
  ant \
  git \
  libprotobuf-java \
  mercurial \
  # https://wiki.debian.org/Java
  openjdk-8-jdk \
  protobuf-compiler \
  wget

WORKDIR /dimo414

LABEL \
  version="0.2" \
  description="Base image that other images in this repo will build upon."
