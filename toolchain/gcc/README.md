1) History of minigcc

   the earliest start-point of minigcc is came from my first PR in gcc community https://github.com/google/sanitizers/issues/407
  
2) Purpose of minigcc

   minigcc used to learning and research internal mechnism of gcc. The purpose of minigcc is intend to be part of CDEOS(Custom Design Engagement OS, everything in CDEOS created from scratch, the purpose of CDEOS is intend to create another thin/lightweight "Android").


3) How to build minigcc in Ubuntu 18.04.2

3.1)host dev env:

wgzhou:$ cat /etc/issue

Ubuntu 18.04.2 LTS \n \l

wgzhou:$ gcc -v

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/7/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 7.4.0-1ubuntu1~18.04.1' --with-bugurl=file:///usr/share/doc/gcc-7/README.Bugs --enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++ --prefix=/usr --with-gcc-major-version-only --program-suffix=-7 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-libmpx --enable-plugin --enable-default-pie --with-system-zlib --with-target-system-zlib --enable-objc-gc=auto --enable-multiarch --disable-werror --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)


3.2) checkout minigcc source code

wgzhou:$ git clone https://github.com/zhouwg/minigcc

3.3) built minigcc

wgzhou:$ cd minigcc


wgzhou:$ sudo make prebuild


wgzhou:$ make 


the cc1,cpp,xgcc,xg++ ... should be founded in directory gcc if everything is running ok as expected.



4) Roadmap

4.1)remove dependency with aux source tree(/android/gcc/gcc-6.4.0/);

4.2)refine the build system in minigcc;

4.3)asan feature enablement in minigcc;



5) Status/Defect

   minigcc is under developent and only support target x86-ia32 currently. 
