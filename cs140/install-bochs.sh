#!/bin/bash
# Downloads a version of Bochs patched to be used with Pintos and builds and installs two variants
# of it to /usr/local.

set -e

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT
cd "$TMPDIR"

wget -O "bochs-2.2.6-pintos-unix-patched.tar.gz" "https://drive.google.com/uc?export=download&id=1nPFKg5XxicgxRF4GeyZj1G4QoiOR5du3"
tar xzf "bochs-2.2.6-pintos-unix-patched.tar.gz"
cd "bochs-2.2.6"

# From pintos src/misc/bochs-2.2.6-build.sh
DSTDIR=/usr/local
CFGOPTS="--with-x --with-x11 --with-term --with-nogui --prefix=$DSTDIR --enable-cpu-level=6"
echo Compiling Plain
( mkdir plain &&
        cd plain &&
        ../configure $CFGOPTS --enable-gdb-stub &&
        make &&
        make install
)
echo Compiling With DBG
( mkdir with-dbg &&
        cd with-dbg &&
        pwd &&
        ../configure --enable-debugger $CFGOPTS &&
        make &&
        cp bochs "$DSTDIR/bin/bochs-dbg"
)

echo Successfully installed Bochs