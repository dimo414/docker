# hadolint ignore=DL3006
FROM dimo414/ci

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    clang-tidy clang cppcheck && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL \
  version="0.1" \
  description="Image for C/C++ CI"

