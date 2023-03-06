#!/bin/sh

mkdir tools
cd tools

# Install QEMU.
# sudo apt install qemu-system-misc
wget https://download.qemu.org/qemu-7.2.0.tar.xz
tar xvJf qemu-7.2.0.tar.xz
cd qemu-7.2.0
./configure --target-list=riscv64-softmmu
make

# Download and extract the RISC-V GNU Compiler Toolchain.
ARCHIVE_DATE="2023.02.25"
ARCHIVE_FILENAME="riscv64-glibc-ubuntu-22.04-nightly-$ARCHIVE_DATE-nightly.tar.gz"
ARCHIVE_URL="https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/$ARCHIVE_DATE/$ARCHIVE_FILENAME"
wget $ARCHIVE_URL
tar -xf $ARCHIVE_FILENAME
mv riscv riscv-gnu-toolchain

cd ..

# Set up a disk for QEMU.
dd if=/dev/zero of=qemu.dsk bs=1M count=32
