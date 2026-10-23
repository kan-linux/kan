qemu-system-i386 -m 1024 -kernel ./kernel/linux-3.8.6/arch/x86/boot/bzImage -initrd ./out/i386/build_rootfs/rootfs.img
qemu-system-i386 -m 1024 -serial stdio  -append "root=/dev/sda console=tty0 console=ttyAMA0 console=ttyS0,115200n8 mem=1024m" -kernel kernel/linux-3.8.6/arch/x86/boot/bzImage -initrd out/i386/build_rootfs/rootfs.img
