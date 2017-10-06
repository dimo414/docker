FROM dimo414/base

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

LABEL \
  version="0.1" \
  description="Image for CS242"
