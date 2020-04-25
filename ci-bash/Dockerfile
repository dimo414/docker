# hadolint ignore=DL3006
FROM dimo414/ci

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    bc byacc gcc make parallel shellcheck && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

COPY install_bash.sh /tmp

RUN \
  bash /tmp/install_bash.sh 3.2.57 && \
  bash /tmp/install_bash.sh 4.4.18 && \
  bash /tmp/install_bash.sh 5.0 && \
  git clone --single-branch --branch v1.2.0 https://github.com/bats-core/bats-core.git /tmp/bats-core && \
  /tmp/bats-core/install.sh /usr/local && \
  rm -r /tmp/install_bash.sh /tmp/bats-core

LABEL \
  version="0.4" \
  description="Image for Bash CI tests"

