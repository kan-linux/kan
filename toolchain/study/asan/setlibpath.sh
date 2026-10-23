#!/bin/bash

set -e 
. ${CDE_TOPDIR}/build/public.sh || (echo "can't find public.sh"; exit 1)
#funcDumpGlobalEnvs
funcCheckGlobalEnvs
#echo "func result:" $?
if [ $? != 0 ]; then
    echo -e "${TEXT_RED} envs invalid ${TEXT_RESET}"
    exit 1
fi
 
echo "current LD_LIBRARY_PATH is: $LD_LIBRARY_PATH"

echo "CDE_TOOLCHAIN_BINDIR    is: $CDE_TOOLCHAIN_BINDIR"

if [ ${CDE_TARGET} == "i386" ]; then
    export LD_LIBRARY_PATH=${CDE_TOOLCHAIN_BINDIR}/lib:$LD_LIBRARY_PATH
elif [ ${CDE_TARGET} == "x86-64" ]; then
    export LD_LIBRARY_PATH=${CDE_TOOLCHAIN_BINDIR}/lib64:$LD_LIBRARY_PATH
elif [ ${CDE_TARGET} == "arm-v7" ]; then
    echo -e "${TEXT_BLUE} do nothing ${TEXT_RESET}"
else
    echo -e "${TEXT_RED} CDE_TARGET ${CDE_TARGET} is invalide ${TEXT_RESET}"
fi


echo "now export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LD_LIBRARY_PATH"
