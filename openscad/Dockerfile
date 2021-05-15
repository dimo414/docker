# debian:stable currently installs OpenSCAD 2015; testing has 2019
FROM debian:testing-slim

# Install https://github.com/krallin/tini manually so users don't need to remember to pass --init
# to docker to get xvfb-run to work correctly.
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    make \
    openscad \
    xauth \
    xvfb \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && chmod +x /tini

ENTRYPOINT ["/tini", "--"]
CMD ["bash"]

LABEL \
  version="0.1" \
  description="Supports running the OpenSCAD command line application, including invocations that require a running X server."
