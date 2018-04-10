FROM dimo414/ci

RUN apt-get update && apt-get install -y bc byacc gcc make shellcheck

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

RUN \
  git clone https://github.com/bats-core/bats-core.git /tmp/bats && \
  cd /tmp/bats && \
  ./install.sh /usr/local

LABEL \
  version="0.2" \
  description="Image for Bash CI tests"

