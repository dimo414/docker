FROM dimo414/base

# Lua
RUN apt-get update && apt-get install -y \
    gcc \
    lua5.2 \
    liblua5.2-dev \
    make \
    unzip && \
  cd /tmp && \
  wget http://luarocks.github.io/luarocks/releases/luarocks-2.4.3.tar.gz && \
  tar -xf luarocks-2.4.3.tar.gz && \
  cd luarocks-2.4.3 && \
  ./configure && make build && make install && \
  luarocks install luaposix && \
  luarocks install termfx && \
  luarocks install luaunit

# OCaml
# NOTE you must currently preface every OCaml invocation with `eval $(opam config env)`
RUN apt-get update && apt-get install -y \
    m4 \
    opam && \
  opam init -y && \
  opam switch 4.05.0 && \
  eval $(opam config env) && \
  opam install core menhir utop ocp-indent user-setup -y && \
  wget -O "solution.byte" "https://drive.google.com/uc?export=download&id=0B1kqaYwK09xsdTc0WnBQMEYxdXc"

LABEL \
  version="0.1" \
  description="Image for CS242"
