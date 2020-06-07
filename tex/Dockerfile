# hadolint ignore=DL3006
FROM dimo414/base

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-fonts-recommended \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-science && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

LABEL \
  version="0.1" \
  description="Image for TeX generation"
