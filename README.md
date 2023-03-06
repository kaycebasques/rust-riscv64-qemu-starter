# riscv64-qemu-ubuntu-starter

https://osblog.stephenmarz.com/ch1.html

## notes

run configure with --enable-multilib?

--enable-multilib didn't compile but maybe if I use it with
the --with-arch and --with-abi flags used next it would help

The g in --with-arch=rv64gc is shorthand for imadfc
https://wiki.gentoo.org/wiki/RISC-V_Multilib

Now trying --with-abi=lp64d instead of the lp64 default

Now specifying --with-arch=rv64gc and --with-abi=lp64

Still no good

Let's try specifying imafdc when running g++
https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1038#issuecomment-1068478180

.../riscv64-unknown-linux-gnu-g++ -march=rv64imafdc -mabi=lp64 -c foo.cpp

lp64 doesn't work for some reason

maybe I can use lp64d when building the toolchain and building the OS?

Eureka! Finally working, I think....

sudo apt install qemu-system-riscv64

source make_hdd.sh
