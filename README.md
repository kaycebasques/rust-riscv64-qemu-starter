# rust-riscv64-qemu-starter

A starter repo for creating an OS in Rust. The OS is intended to run on a
QEMU-emulated RISC-V 64-bit computer.

[osblog]: https://osblog.stephenmarz.com/index.html

The OS code is based off [The Adventures of OS: Making a RISC-V Operating
System using Rust][osblog] by Stephen Marz.

## Assumptions

* `setup.sh` uses `apt` to install QEMU.

## Get started

```
$ source setup.sh
```

## Build the OS

```
$ make all
```

## Run the OS on QEMU

```
$ make qemu
```

### Troubleshooting: `can't link double-float modules with soft-float modules`

[my answer on Stack Overflow]: https://stackoverflow.com/a/75652961/1669860

See [my answer on Stack Overflow].
