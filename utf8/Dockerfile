FROM debian:testing

RUN \
  apt-get update && apt-get install -y --no-install-recommends locales && \
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  sed -i -e 's/# \(en_US.UTF-8.*\)/\1/' /etc/locale.gen && \
  locale-gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
