# hadolint ignore=DL3006
FROM dimo414/ci

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    bc byacc gcc make parallel shellcheck && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

COPY install_bash.sh /tmp

# Note that later versions overwrite older ones, so e.g. bash-4 points to bash-4.4 not bash 4.2
RUN \
  bash /tmp/install_bash.sh 3.2.57 && \
  bash /tmp/install_bash.sh 4.2.53 && \
  bash /tmp/install_bash.sh 4.4.18 && \
  bash /tmp/install_bash.sh 5.0    && \
  bash /tmp/install_bash.sh 5.1.16 && \
  bash /tmp/install_bash.sh 5.2    && \
  git clone --single-branch --branch v1.2.0 https://github.com/bats-core/bats-core.git /tmp/bats-core && \
  /tmp/bats-core/install.sh /usr/local && \
  rm -r /tmp/install_bash.sh /tmp/bats-core

LABEL \
  version="0.4" \
  description="Image for Bash CI tests"

