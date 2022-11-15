# hadolint ignore=DL3006
FROM ghcr.io/dimo414/utf8

# Note that subsequent installs overwrite earlier ones, so e.g. bash-4 points to bash-4.4 not bash 4.3

COPY install_bash.sh install_bats.sh /tmp/

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential byacc gcc make parallel shellcheck wget && \
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  bash /tmp/install_bash.sh 3.2.57 && \
  bash /tmp/install_bash.sh 4.3.30 && \
  bash /tmp/install_bash.sh 4.4.18 && \
  bash /tmp/install_bash.sh 5.0    && \
  bash /tmp/install_bash.sh 5.1.16 && \
  bash /tmp/install_bash.sh 5.2    && \
  bash /tmp/install_bats.sh 1.8.2

LABEL \
  version="0.1" \
  description="Image for CI of Bash scripts across multiple Bash versions, also includes Bats and ShellCheck"

