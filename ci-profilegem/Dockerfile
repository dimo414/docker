FROM dimo414/ci

RUN apt-get update && apt-get install -y byacc gcc make

# Install Bash 3.2
# http://stackoverflow.com/a/41554230/113632
RUN \
  mkdir /bash && \
  cd /bash && \
  wget http://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz && \
  tar xzf bash-3.2.57.tar.gz && \
  rm bash-3.2.57.tar.gz && \
  cd bash-3.2.57 && \
  ./configure && \
  make && \
  ./bash -version \
ENV BASH_3 /bash/bash-3.2.57/bash

ENV PGEM_TEST='/pgem_test'
RUN mkdir $PGEM_TEST
COPY *.sh /pgem_test/

ENV _PGEM_DEBUG true

LABEL \
  version="0.1" \
  description="Image for CI tests of ProfileGem and ProfileGem gems"

