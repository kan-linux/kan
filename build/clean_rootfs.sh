#!/bin/bash

set -e 
. ${CDE_TOPDIR}/build/public.sh || (echo "can't find public.sh"; exit 1)
funcCheckGlobalEnvs
if [ $? != 0 ]; then
    echo -e "${TEXT_RED} envs invalid ${TEXT_RESET}"
    exit 1
fi
 
/bin/rm -rf ${CDE_OUTDIR}/build_rootfs/busybox-1.31.1
/bin/rm -rf ${CDE_OUTDIR}/build_rootfs/rootfs
/bin/rm -rf ${CDE_OUTDIR}/build_rootfs/rootfs.img
