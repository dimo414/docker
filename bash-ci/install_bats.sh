#!/bin/bash
set -u
#
# Downloads and installs the given version of https://github.com/bats-core/bats-core

VERSION=${1:?version}
FILE="v${VERSION}.tar.gz"
URL="http://github.com/bats-core/bats-core/archive/refs/tags/${FILE}"

(
  set -x
  mkdir /tmp/bats \
    && cd /tmp/bats \
    && wget --no-check-certificate "$URL" \
    && tar xzf "${FILE}" \
    && /tmp/bats/bats-core-1.8.2/install.sh /usr/local \
    && cd /tmp \
    && rm -r /tmp/bats \
    && bats --version
) || exit

echo "bats ${VERSION} installed"
