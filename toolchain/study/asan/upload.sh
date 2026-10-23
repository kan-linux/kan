#!/bin/bash
adb push use-after-delete  /system/bin/
adb push dlsym  /system/bin/

TOOLCHAIN_ROOT=${CDE_TOOLCHAIN_BINDIR}/gcc-${CDE_GCCVER}/stage_2
adb push ${TOOLCHAIN_ROOT}/sysroot/usr/lib/armv7-a/libasan.so.1 /system/lib/

