#!/bin/bash
#zhouwg2000@gmail.com
#2018-10-05


funcBuildGCCStage1() {
    echo -e "${TEXT_BLUE} prepare build stage-1 gcc...  ${TEXT_RESET}"
    echo -e "${TEXT_BLUE} prepare build stage-1 binutils  ${TEXT_RESET}"
    cd  ${basepath}
    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "workpath:     "$workpath

    mkdir -p  ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-1
    if [ ! -d ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-1 ]; then
        echo -e "bintuils build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-1 ${TEXT_RED}  not exist ${TEXT_RESET}"
        exit 1
    else
        echo -e "binutils build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-1 ${TEXT_BLUE}  was found ${TEXT_RESET}"
        cd ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-1
    fi


    #--with-arch=armv7a --with-float=soft --with-fpu=neon-vfpv4 --disable-lto
    echo -e "${TEXT_BLUE} build stage-1 binutils  ${TEXT_RESET}"
    ${CDE_TOOLCHAIN_SRCDIR}/src/binutils-2.28/configure  --prefix=${toolchain_stage1} --target=arm-linux-androideabi --disable-nls --enable-gold --enable-gold=default
    make -j4
    make install


    #build the minminal gcc (stage-1 gcc)
    export PATH=${toolchain_stage1}/bin:$PATH
    echo "cur_path: " $PATH

    cd  ${basepath}
    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "workpath:     "$workpath


    echo -e "${TEXT_BLUE} prepare build stage-1 gcc  ${TEXT_RESET}"
    mkdir -p ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-1
    if [ ! -d ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-1 ]; then
        echo -e "gcc build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-1 ${TEXT_RED}  not exist ${TEXT_RESET}"
        exit 1
    else
        echo -e "gcc build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-1 ${TEXT_BLUE}  was found ${TEXT_RESET}"
        cd ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-1
    fi


    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "workpath: " $workpath
    echo "host gcc:"
    gcc -v

    echo -e "${TEXT_BLUE} build stage-1 gcc... ${TEXT_RESET}"
    #--with-tune=cortex-a17 --with-fpu=neon-vfpv4 --with-arch=armv7-a
    #https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=ec1cc0263f156f70693a62cf17b254a0029f4852
    ${CDE_TOOLCHAIN_SRCDIR}/src/${gcc_name}/configure --prefix=${toolchain_stage1} --target=arm-linux-androideabi --host=x86_64-linux-gnu --build=x86_64-linux-gnu --enable-languages=c,c++ --without-ppl --without-cloog --disable-libssp --disable-threads --disable-nls --disable-libmudflap --disable-decimal-float --disable-libffi --disable-libgomp --disable-libstdcxx-pch --disable-libstdc__-v3 --disable-libstdcxx --disable-sjlj-exceptions --disable-shared --disable-tls --disable-libitm --enable-target-optspace --enable-initfini-array --disable-nls --disable-bootstrap --disable-libquadmath --disable-plugin --program-transform-name='s&^&arm-linux-androideabi-&' --without-headers --disable-libatomic --disable-libsanitizer --disable-libquadmath --disable-libada --disable-lto --enable-gold --enable-gold=default --disable-gcov --with-float=soft --with-arch=armv7-a --disable-werror
    make -j4
    make install

    ls -l ${toolchain_stage1}/bin/arm-linux-androideabi-ld*
    #/bin/cp -fv ${toolchain_stage1}/bin/arm-linux-androideabi-ld.gold  ${toolchain_stage1}/bin/arm-linux-androideabi-ld
    echo -e "${TEXT_BLUE} end build stage-1 gcc ${TEXT_RESET}"

    export PATH=${toolchain_stage1}/bin:$PATH
    echo "cur_path: " $PATH

    cd  ${basepath}
    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "curpath: " $workpath
    echo -e "${TEXT_BLUE} end build stage-1 gcc...  ${TEXT_RESET}"
}



funcBuildBionic() {
#configure:3586: /home/weiguo/cdeos/toolchain/gcc-4.9.2-gcc-build-1/./gcc/xgcc -B/home/weiguo/cdeos/toolchain/gcc-4.9.2-gcc-build-1/./gcc/ -B/tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-andr    oideabi/bin/ -B/tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-androideabi/lib/ -isystem /tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-androideabi/include -isystem /tmp/gcc-4.9.2_rk3288_    android_5.1/stage_1/arm-linux-androideabi/sys-include    -g -Os   conftest.c  >&5
# Welcome to gold!  Commandline written to /tmp/ld-run-a.out.sh.
#/tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-androideabi/bin/ld: error: cannot open crtbegin_dynamic.o: No such file or directory
# /tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-androideabi/bin/ld: error: cannot open crtend_android.o: No such file or directory
# /tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-androideabi/bin/ld: error: cannot find -lc
# /tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/arm-linux-androideabi/bin/ld: error: cannot find -ldl
# collect2: error: ld returned 1 exit status
    cd ${bionic_srcpath}
    #bionic_srcpath=${CDE_TOOLCHAIN_SRCDIR}/sysroot/rk3288_android5.1
    echo "bionic_srcpath : " $bionic_srcpath

    echo -e "${TEXT_BLUE} enter ${bionic_srcpath}  ${TEXT_RESET}"
    cd ${bionic_srcpath}
    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)



    #export STAGE_1_TOOLCHAIN=${toolchain_stage1}
    #export STAGE_1_TOOLCHAIN=/tmp/gcc-4.9.2_rk3288_android_5.1/stage_1/

    #export android_board=rk3288_box
    #export android_board=generic
    echo "work path: " ${workpath}
    echo "toolchain path: " ${STAGE_1_TOOLCHAIN}

    export JAVA_HOME=/opt/jdk1.8.0_112
    export JRE_HOME=${JAVA_HOME}/jre 
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib:$JAVA_HOME/lib/tools.jar
    export PATH=${JAVA_HOME}/bin:$PATH

    echo -e "${TEXT_BLUE} prepare build bionic...  ${TEXT_RESET}"
    #source build.sh
    #. build/envsetup.sh
    source build/envsetup.sh

    if [ $bionic_source == "rk3288_android5.1" ]; then
        lunch rk3288_box-userdebug
    elif [ $bionic_source == "amlogic_android5.1.1" ]; then
        lunch q201-userdebug-32
    else
        echo -e "${TEXT_RED} bionic_source ${bionic_source} unknown ${TEXT_RESET}"
    fi


    rm -rf out/target/product/${android_board}/*
    rm -rf out/host/linux-x86/*

    #make: *** No rule to make target 'out/target/product/rk3288_box/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/libcompiler_rt-extras.a', needed by 'out/target/product/rk3288_box/obj/SHARED_LIBRARIES/libdl_intermediates/LINKED/libdl.so'.  Stop.
    #make: Leaving directory '/home/weiguo/cdeos/toolchain/sysroot/rk3288_android5.1'

    mkdir -p out/host/linux-x86/obj32/STATIC_LIBRARIES/libhost_intermediates/
    touch out/host/linux-x86/obj32/STATIC_LIBRARIES/libhost_intermediates/export_includes

    mkdir -p out/host/linux-x86/obj/STATIC_LIBRARIES/libunwindbacktrace_intermediates
    touch out/host/linux-x86/obj/STATIC_LIBRARIES/libunwindbacktrace_intermediates/export_includes

    mkdir -p out/target/product/${android_board}/obj/SHARED_LIBRARIES/libstlport_intermediates/
    touch out/target/product/${android_board}/obj/SHARED_LIBRARIES/libstlport_intermediates/export_includes

    mkdir -p out/target/product/${android_board}/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/
    touch out/target/product/${android_board}/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/export_includes
    mkdir -p out/target/product/${android_board}/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/
    touch out/target/product/${android_board}/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/export_includes

    mkdir -p out/target/product/${android_board}/obj/STATIC_LIBRARIES/libc_intermediates/
    touch out/target/product/${android_board}/obj/STATIC_LIBRARIES/libc_intermediates/export_includes


    mkdir -p out/target/product/${android_board}/obj/SHARED_LIBRARIES/libm_intermediates/
    touch out/target/product/${android_board}/obj/SHARED_LIBRARIES/libm_intermediates/export_includes
    mkdir -p out/target/product/${android_board}/obj/SHARED_LIBRARIES/libc_intermediates/
    touch out/target/product/${android_board}/obj/SHARED_LIBRARIES/libc_intermediates/export_includes
    mkdir -p out/target/product/${android_board}/obj/SHARED_LIBRARIES/libc++_intermediates/
    touch out/target/product/${android_board}/obj/SHARED_LIBRARIES/libc++_intermediates/export_includes

    mkdir -p out/target/product/${android_board}/obj/STATIC_LIBRARIES/libc++_intermediates/
    touch out/target/product/${android_board}/obj/STATIC_LIBRARIES/libc++_intermediates/export_includes


    mkdir -p out/target/product/${android_board}/obj/STATIC_LIBRARIES/libc_intermediates/
    touch out/target/product/${android_board}/obj/STATIC_LIBRARIES/libc_intermediates/export_includes

    mkdir -p out/target/product/${android_board}/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates
    touch out/target/product/${android_board}/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/export_includes

    echo -e "${TEXT_BLUE} build bionic...  ${TEXT_RESET}"

    cd ${bionic_srcpath}/build/libs/host
    mm

    cd ${bionic_srcpath}/build/tools/acp
    mm

    cd ${bionic_srcpath}/bionic
    mm
    cd ${bionic_srcpath}

    cd ${bionic_srcpath}/external/compiler-rt
    mm
    cd ${bionic_srcpath}

    cd bionic
    mm
    cd ${bionic_srcpath}

    cd ${bionic_srcpath}/external/jemalloc
    mm
    cd ${bionic_srcpath}


    cd bionic
    mm
    cd ${bionic_srcpath}

    cd ${bionic_srcpath}/external/libcxxabi
    mm
    cd ${bionic_srcpath}

    cd ${bionic_srcpath}/external/libunwind
    mm
    cd ${bionic_srcpath}


    cd ${bionic_srcpath}/external/libcxxabi
    mm
    cd ${bionic_srcpath}

    cd ${bionic_srcpath}/external/libcxx
    mm
    cd ${bionic_srcpath}

    cd bionic
    mm
    cd ${bionic_srcpath}

    cd system/core/liblog
    mm
    cd ${bionic_srcpath}


    echo -e "${TEXT_BLUE} end build bionic...  ${TEXT_RESET}"
    echo "work path: " ${workpath}
    ls -la ${bionic_srcpath}/out/target/product/${android_board}/system/lib/

    cd  ${basepath}
}



funcPrepareSysroot() {
    echo -e "${TEXT_BLUE} prepare sysroot for stage-2 gcc...  ${TEXT_RESET}"
    echo -e "${TEXT_BLUE} preapre sysroot for stage-2 build  ${TEXT_RESET}"
    cd ${bionic_srcpath}
    cd  ${basepath}
    mkdir -p ${toolchain_stage2}/sysroot/usr/lib
    mkdir -p ${toolchain_stage2}/sysroot/usr/lib/armv7-a
    mkdir -p ${toolchain_stage2}/sysroot/usr/include
    echo "base path: " ${basepath}
    echo "org path: " ${org_path}
    #cd ${basepath}
    export PATH=${org_path}
    #export LD_LIBRARY_PATH=${org_ld_path}
    #export PATH=/tmp/toolchain_x86_64/bin/:$PATH
    #export LD_LIBRARY_PATH=/tmp/toolchain_x86_64/lib/../lib64:$LD_LIBRARY_PATH
    echo "current path: " ${PATH}
    #workpath=$(dirname $(readlink -f $0))


    #prepare sysroot:
    echo -e "${TEXT_BLUE} preapre sysroot ${TEXT_RESET}"
    cd ${bionic_srcpath}
    workpath=$(pwd)
    echo "workpath: " $workpath
    mkdir -p ${toolchain_stage2}/arm-linux-androideabi/lib

    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtbegin_so.o      ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtbegin_so.o      ${toolchain_stage2}/arm-linux-androideabi/lib/crtbegin_dynamic.o
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtend_so.o        ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtend_android.o   ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtbegin_static.o  ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libc.so         ${toolchain_stage2}/sysroot/usr/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libstdc++.so    ${toolchain_stage2}/sysroot/usr/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libm.so         ${toolchain_stage2}/sysroot/usr/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libdl.so        ${toolchain_stage2}/sysroot/usr/lib/
    ls -l ${toolchain_stage2}/sysroot/usr/lib/
    #libc.so  libdl.so  libm.so  libstdc++.so


    cp -rf ${bionic_srcpath}/bionic/libc/include/*                 ${toolchain_stage2}/sysroot/usr/include/
    cp -rf ${bionic_srcpath}/bionic/libm/include/*.h               ${toolchain_stage2}/sysroot/usr/include/
    cp -rf ${bionic_srcpath}/bionic/libc/kernel/uapi/linux         ${toolchain_stage2}/sysroot/usr/include/
    cp -rf ${bionic_srcpath}/bionic/libc/kernel/uapi/asm-generic   ${toolchain_stage2}/sysroot/usr/include/
    cp -rf ${bionic_srcpath}/bionic/libc/kernel/uapi/asm-arm/asm   ${toolchain_stage2}/sysroot/usr/include
    cp -rf ${bionic_srcpath}/bionic/libc/arch-arm/include/*        ${toolchain_stage2}/sysroot/usr/include/
    cp ${bionic_srcpath}/bionic/libc/include/sys/syscall.h         ${toolchain_stage2}/sysroot/usr/include/
    cd  ${basepath}
    echo -e "${TEXT_BLUE} end prepare sysroot...  ${TEXT_RESET}"
}



funcResettingSysroot() {
    echo -e "${TEXT_BLUE} resetting sysroot with stage-2 gcc...  ${TEXT_RESET}"
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtbegin_so.o      ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtbegin_so.o      ${toolchain_stage2}/arm-linux-androideabi/lib/crtbegin_dynamic.o
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtend_so.o        ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtend_android.o   ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/obj/lib/crtbegin_static.o  ${toolchain_stage2}/arm-linux-androideabi/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libc.so         ${toolchain_stage2}/sysroot/usr/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libstdc++.so    ${toolchain_stage2}/sysroot/usr/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libm.so         ${toolchain_stage2}/sysroot/usr/lib/
    /bin/cp -fv ${bionic_srcpath}/out/target/product/${android_board}/system/lib/libdl.so        ${toolchain_stage2}/sysroot/usr/lib/
    ls -l ${toolchain_stage2}/sysroot/usr/lib/
    ls -l ${toolchain_stage2}/sysroot/usr/lib/armv7-a

    echo -e "${TEXT_BLUE} end resetting sysroot with stage-2 gcc...  ${TEXT_RESET}"
}



funcBuildGCCStage2() {
    echo -e "${TEXT_BLUE} prepare build stage-2 gcc...  ${TEXT_RESET}"
    cd ${basepath}
    echo -e "${TEXT_BLUE} prepare build stage-2 binutils  ${TEXT_RESET}"
    mkdir -p  ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-2
    if [ ! -d ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-2 ]; then
        echo -e "binutils build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-2 ${TEXT_RED}  not exist ${TEXT_RESET}"
        exit 1
    else
        echo -e "bintuils build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-2 ${TEXT_BLUE}  was found ${TEXT_RESET}"
        cd ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-binutils-build-2
    fi

    echo -e "${TEXT_BLUE} build stage-2 binutils  ${TEXT_RESET}"
    echo "host gcc:"
    gcc -v
    ${CDE_TOOLCHAIN_SRCDIR}/src/binutils-2.28/configure --prefix=${toolchain_stage2} --target=arm-linux-androideabi --disable-nls --enable-gold --enable-gold=default --with-sysroot=${toolchain_stage2}/sysroot --disable-lto
    make -j4
    make install

    echo -e "${TEXT_BLUE} end build stage-2 binutils  ${TEXT_RESET}"
    export PATH=${toolchain_stage2}/bin/:$PATH
    echo "current path: " ${PATH}


    cd ${basepath}
    echo -e "${TEXT_BLUE} prepare build stage-2 gcc  ${TEXT_RESET}"
    mkdir  -p ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-2
    if [ ! -d ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-2 ]; then
        echo -e "gcc build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-2 ${TEXT_RED}  not exist ${TEXT_RESET}"
        exit 1
    else
        echo -e "gcc build directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-2 ${TEXT_BLUE}  was found ${TEXT_RESET}"
        cd ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-2
    fi
    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "workpath: " $workpath
    echo -e "${TEXT_BLUE} build stage-2 gcc  ${TEXT_RESET}"
    #stage-2 gcc
    ${CDE_TOOLCHAIN_SRCDIR}/src/${gcc_name}/configure --prefix=${toolchain_stage2} --target=arm-linux-androideabi --host=x86_64-linux-gnu --build=x86_64-linux-gnu --enable-languages=c,c++ --with-sysroot=${toolchain_stage2}/sysroot --without-ppl --without-cloog --disable-libssp --enable-threads --disable-nls --disable-libmudflap --disable-decimal-float --disable-libffi --disable-libgomp --disable-libstdcxx-pch --disable-libstdc__-v3 --disable-libstdcxx --disable-sjlj-exceptions --disable-shared --disable-tls --disable-libitm --enable-target-optspace --enable-initfini-array --disable-nls --disable-bootstrap --disable-libquadmath --enable-plugin --program-transform-name='s&^&arm-linux-androideabi-&' --enable-gold --enable-libatomic --disable-libquadmath --disable-libada --disable-lto --disable-vtable-verify --enable-gold=default --enable-gcov --with-float=soft  --with-fpu=neon-vfpv4 --with-arch=armv7-a --enable-libsanitizer --enable-gold=default --enable-graphite=yes --enable-eh-frame-hdr-for-static --disable-werror
    make -j4
    make install
    /bin/cp -fv ${toolchain_stage2}/arm-linux-androideabi/lib/armv7-a/libatomic.a   ${toolchain_stage2}/sysroot/usr/lib/
    #/bin/cp -fv ${toolchain_stage2}/arm-linux-androideabi/lib/armv7-a/libsupc++.a   ${toolchain_stage2}/sysroot/usr/lib/
    #/bin/cp -fv ${toolchain_stage2}/arm-linux-androideabi/libsanitizer/asan/libasan_preinit.o ${toolchain_stage2}/sysroot/usr/lib/armv7-a/
    echo -e "${TEXT_BLUE} end build stage-2 gcc  ${TEXT_RESET}"
    cd ${basepath}
    echo -e "${TEXT_BLUE} end build stage-2 gcc...  ${TEXT_RESET}"
}


funcBuildLibstdc++() {
    cd ${basepath}

    echo "toolchain_stage2: ${toolchain_stage2}"
    export PATH=${toolchain_stage2}/bin/:$PATH
    echo "current path: " ${PATH}


    mkdir -p ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libstdc++-build
    if [ ! -d ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libstdc++-build ]; then
        echo -e "directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libstdc++-build ${TEXT_RED}  not exist ${TEXT_RESET}"
        exit 1
    else
        echo -e "directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libstdc++-build ${TEXT_BLUE}  was found ${TEXT_RESET}"
        cd ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libstdc++-build
    fi

    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "workpath: " $workpath
    ${CDE_TOOLCHAIN_SRCDIR}/src/${gcc_name}/libstdc++-v3/configure --prefix=${toolchain_stage2}/sysroot/usr --target=arm-linux-androideabi --host=arm-linux-androideabi --enable-libstdcxx-threads --enable-hosted-libstdcxx --enable-cxx-flags="-frtti -fexceptions -I${toolchain_stage2}/arm-linux-androideabi/include/ -DTARGET_ANDROID" --disable-libstdcxx-dual-abi  --with-default-libstdcxx-abi=new --disable-libstdcxx-filesystem-ts --enable-static --enable-shared --with-gxx-include-dir=${toolchain_stage2}/sysroot/usr/include/c++ --disable-multilib --disable-werror
    make clean
    make
    #make install
    cd ${basepath}
}


funcBuildAsan() {
    cd ${basepath}

    echo "toolchain_stage2: ${toolchain_stage2}"
    export PATH=${toolchain_stage2}/bin/:$PATH
    echo "current path: " ${PATH}

    mkdir -p ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libasan-build
    if [ ! -d ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libasan-build ]; then
        echo -e "directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libasan-build ${TEXT_RED}  not exist ${TEXT_RESET}"
        exit 1
    else
        echo -e "directory ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libasan-build ${TEXT_BLUE}  was found ${TEXT_RESET}"
        cd ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-libasan-build
    fi

    #workpath=$(dirname $(readlink -f $0))
    workpath=$(pwd)
    echo "workpath: " $workpath

    ${CDE_TOOLCHAIN_SRCDIR}/src/${gcc_name}/libsanitizer/configure --prefix=${toolchain_stage2}/sysroot/usr --target=arm-linux-androideabi --host=arm-linux-androideabi --disable-static --disable-multilib --disable-werror
    make clean
    make
    /bin/cp -fv ${CDE_OUTDIR}/${CDE_TARGET}/build_toolchain/${gcc_name}-gcc-build-2/arm-linux-androideabi/libsanitizer/asan/libasan_preinit.o ${toolchain_stage2}/sysroot/usr/lib/armv7-a/
    make install
    if [ ${CDE_GCCVER} == "baseline" ]; then
            cd ${toolchain_stage2}/lib/gcc/arm-linux-androideabi
            ln -sf 4.9.2 baseline
    fi
    cd ${basepath}
}


set -e 
datetime=`date +"%y-%m-%d %H:%M:%S"`
echo ${datetime}

#1. sanity check
. ${CDE_TOPDIR}/build/public.sh || (echo "can't find public.sh"; exit 1)
funcCheckGlobalEnvs
if [ $? != 0 ]; then
    echo -e "${TEXT_RED} envs invalid ${TEXT_RESET}"
    exit 1
fi

if [ ${CDE_TARGET} != "armv7-a" ]; then
    echo -e "${TEXT_RED} CDE_TARGET ${CDE_TARGET} is invalid for the build ${TEXT_RESET}"
    exit 1
fi


#2. local envs setting

bionic_source=amlogic_android5.1.1
bionic_source=rk3288_android5.1

if [ $bionic_source == "rk3288_android5.1" ]; then
    export android_board=generic
    export android_board=rk3288_box
elif [ $bionic_source == "amlogic_android5.1.1" ]; then
    export android_board=q201
else
    echo -e "${TEXT_RED} bionic_source ${bionic_source} unknown ${TEXT_RESET}"
fi

#gcc_name=gcc-4.9.2
gcc_name=gcc-${CDE_GCCVER}
basepath=${CDE_TOOLCHAIN_SRCDIR}
#toolchain_name=${gcc_name}_rk3288_android_5.1
#toolchain_name=${gcc_name}_${bionic_source}
toolchain_name=${gcc_name}
#toolchain_stage1=/tmp/${toolchain_name}/stage_1/
#toolchain_stage2=/tmp/${toolchain_name}/stage_2/
toolchain_stage1=${CDE_TOOLCHAIN_BINDIR}/${toolchain_name}/stage_1/
toolchain_stage2=${CDE_TOOLCHAIN_BINDIR}/${toolchain_name}/stage_2/
#bionic_srcpath=${CDE_TOOLCHAIN_SRCDIR}/sysroot/rk3288_android5.1
bionic_srcpath=${CDE_TOOLCHAIN_SRCDIR}/sysroot/${bionic_source}
export STAGE_1_TOOLCHAIN=${toolchain_stage1}

org_ld_path=$LD_LIBRARY_PATH
org_path=$PATH
echo "org_path: " $org_path
echo "cur_path: " $PATH
echo "basepath: " $basepath
echo "bionic src path: " $bionic_srcpath



#2. build stage-1 gcc 
#funcBuildGCCStage1;

#3. build stage-1 bionic
echo -e "${TEXT_BLUE} prepare build stage-1 bionic...  ${TEXT_RESET}"
set +e 
echo "toolchain_stage1: ${toolchain_stage1}"
export STAGE_1_TOOLCHAIN=${toolchain_stage1}
export PATH=${toolchain_stage1}/bin/:$PATH
echo "current path: " ${PATH}
#funcBuildBionic;
set -e
echo -e "${TEXT_BLUE} end build stage-1 bionic...  ${TEXT_RESET}"


#4. prepare sysroot for stage-2 gcc
#funcPrepareSysroot;

#5. build stage-2 gcc 
#funcBuildGCCStage2;

#6. build stage-2 bionic
echo -e "${TEXT_BLUE} prepare build stage-2 bionic...  ${TEXT_RESET}"
#*** No rule to make target 'out/target/product/rk3288_box/obj/STATIC_LIBRARIES/libcompiler_rt-extras_intermediates/libcompiler_rt-extras.a', needed by 'out/target/product/rk3288_box/obj/SHARED_LIBRARIES/libdl_intermediates/LINKED/libdl.so'.  Stop.
#Leaving directory '/home/weiguo/cdeos/toolchain/sysroot/rk3288_android5.1'
set +e 
echo "toolchain_stage2: ${toolchain_stage2}"
export STAGE_1_TOOLCHAIN=${toolchain_stage2}
export PATH=${toolchain_stage2}/bin/:$PATH
echo "current path: " ${PATH}
#funcBuildBionic;
set -e
echo -e "${TEXT_BLUE} end build stage-2 bionic...  ${TEXT_RESET}"


#funcBuildLibstdc++;

#7. build libasan
funcBuildAsan;

#8. resetting sysroot
funcResettingSysroot;
