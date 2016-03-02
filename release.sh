#!/bin/sh

# Exit if anything fails
set -e

target=x86_64-elf
crossdir=$(pwd)"/cross"

# build it
mkdir build-binutils
cd build-binutils
../src/configure --target=$target --prefix=$crossdir --disable-nls --disable-werror
make
make install
cd ..

mkdir release
cd "$crossdir/bin"
strip *
tar czf "../../release/binutils-$HOST.tar.gz" *
cd ../..
