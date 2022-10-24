FROM debian:testing

# UTF-8 support - why is this still a thing?!
# https://wiki.debian.org/Locale#Manually
# http://stackoverflow.com/a/38553499/113632
RUN \
  apt-get update && apt-get install -y --no-install-recommends locales && \
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  sed -i -e 's/# \(en_US.UTF-8.*\)/\1/' /etc/locale.gen && \
  locale-gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Prereq for the curl command below
RUN \
  apt-get update && apt-get install -y --no-install-recommends ca-certificates curl gnupg2 && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Bazel: https://bazel.build/install/ubuntu
# Java: https://wiki.debian.org/Java
RUN \
  curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
  mv bazel-archive-keyring.gpg /usr/share/keyrings && \
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
  apt-get update && apt-get install -y --no-install-recommends \
    ant \
    bazel \
    git \
    libprotobuf-java \
    mercurial \
    openjdk-11-jdk \
    protobuf-compiler \
    python3 \
    wget && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /dimo414

LABEL \
  version="0.4" \
  description="Base image that other images in this repo will build upon."
