# rust-riscv64-qemu-starter

A starter repo for writing an OS in Rust. The OS is intended to be run on a
RISC-V 64-bit (RV64) computer. The starter repo sets you up to emulate the
RV64 computer with QEMU.

[osblog]: https://osblog.stephenmarz.com/index.html

The OS code is based off chapter 1 in [The Adventures of OS: Making a RISC-V
Operating System using Rust][osblog] (`osblog`) by Stephen Marz. I created this
repo because I was very excited to work through `osblog` but had a difficult
time setting up my development environment. I hope this repo makes it easier
for others to follow along with Stephen's amazing work.

## Assumptions

* [rustup](https://rustup.rs) is available
* `setup.sh` uses `apt` to install QEMU. In other words, your development
  host is assumed to be Debian-based.
* `setup.sh` downloads the prebuilt GNU Compiler Toolchain that is intended
  for Ubuntu 22.04.

## Get started

```
$ source setup.sh
```

This script:

* Installs QEMU through `apt`
* Downloads and extracts the prebuilt RISC-V GNU Compiler Toolchain to `//tools`
* Creates a disk for QEMU

## Build the OS

```
$ make all
```

### Troubleshooting: `can't link double-float modules with soft-float modules`

[my answer on Stack Overflow]: https://stackoverflow.com/a/75652961/1669860

See [my answer on Stack Overflow].

## Run the OS on QEMU

```
$ make qemu
```

You should see something like this followed by a blinking cursor:

```
$ make qemu
qemu-system-riscv64 -machine virt -cpu rv64 -smp 4 -m 128M  -nographic
    -serial mon:stdio -bios none -kernel os.elf -drive if=none,format=raw,file=qemu.dsk,id=foo
    -device virtio-blk-device,scsi=off,drive=foo
```

Try pressing <kbd>Ctrl</kbd>+<kbd>A</kbd> and then press <kbd>C</kbd>. If you
see `(qemu)` before the blinking cursor then you have successfully accessed
QEMU Monitor.

Try running `info registers` in QEMU Monitor. You should see something like
this:

```
(qemu) info registers

CPU#0
 V      =   0
 pc       000000008000006c
 mhartid  0000000000000000
 mstatus  0000000a00000088
 hstatus  0000000200000000
 vsstatus 0000000a00000000
 mip      0000000000000080
...
```

To exit, press <kbd>Ctrl</kbd>+<kbd>A</kbd> again and then press <kbd>X</kbd>.

## Next steps

Check out chapter 1 in [The Adventures of OS: Making a RISC-V Operating System
using Rust][osblog] by Stephen Marz for an explanation of this
code.
