# hadolint ignore=DL3006
FROM dimo414/base

# Lua
# hadolint ignore=DL3003
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    lua5.2 \
    liblua5.2-dev \
    make \
    unzip && \
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  cd /tmp && \
  wget --progress=dot:giga http://luarocks.github.io/luarocks/releases/luarocks-2.4.3.tar.gz && \
  tar -xf luarocks-2.4.3.tar.gz && \
  cd luarocks-2.4.3 && \
  ./configure && make build && make install && \
  luarocks install luaposix && \
  luarocks install termfx && \
  luarocks install luaunit

# OCaml
# NOTE you must currently preface every OCaml invocation with `eval $(opam config env)`
RUN apt-get update && apt-get install -y --no-install-recommends \
    m4 \
    opam && \
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  opam init -y && \
  opam switch 4.05.0 && \
  eval "$(opam config env)" && \
  opam install core menhir utop ocp-indent user-setup -y && \
  wget --progress=dot:giga -O "solution.byte" "https://drive.google.com/uc?export=download&id=0B1kqaYwK09xsdTc0WnBQMEYxdXc"

# Rust
# Referenced https://github.com/rust-lang-nursery/docker-rust/blob/master/1.21.0/jessie/Dockerfile
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN wget --progress=dot:giga https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init -O rustup-init && \
  chmod +x rustup-init && \
  ./rustup-init -y --no-modify-path && \
  rm rustup-init

LABEL \
  version="0.1" \
  description="Image for CS242"
