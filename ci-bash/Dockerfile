# hadolint ignore=DL3006
FROM dimo414/ci

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    bc byacc gcc make shellcheck && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

COPY install_bash.sh /tmp

RUN \
  bash /tmp/install_bash.sh 3.2.57 && \
  bash /tmp/install_bash.sh 4.4.18 && \
  bash /tmp/install_bash.sh 5.0 && \
  git clone https://github.com/bats-core/bats-core.git /tmp/bats && \
  /tmp/bats/install.sh /usr/local && \
  rm -r /tmp/install_bash.sh /tmp/bats

LABEL \
  version="0.3" \
  description="Image for Bash CI tests"

