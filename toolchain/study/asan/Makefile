SRC=TestCases/use-after-free.cc


ifeq ($(CDE_TARGET), i386)
		CFLAGS  = -fsanitize=address -fno-omit-frame-pointer
		LDFLAGS = -lc -lm -ldl  -lstdc++
		CC=$(CDE_TOOLCHAIN_BINDIR)/bin/x86_64-linux-gnu-gcc

else ifeq ($(CDE_TARGET), x86-64)
		CFLAGS = -fsanitize=address -fno-omit-frame-pointer -D__USE_GNU
		LDFLAGS = -lc -lm  -lstdc++ -lpthread -ldl
		CC=$(CDE_TOOLCHAIN_BINDIR)/bin/x86_64-linux-gnu-gcc

else ifeq ($(CDE_TARGET), armv7-a)
		TOOLCHAIN_ROOT=$(CDE_TOOLCHAIN_BINDIR)/gcc-${CDE_GCCVER}/stage_2
		TOOLCHAIN_ABILIB=$(TOOLCHAIN_ROOT)/arm-linux-androideabi/lib
		TOOLCHAIN_SYSLIB=$(TOOLCHAIN_ROOT)/sysroot/usr/lib
		CFLAGS=-nostdlib -Bstatic -Wl,--gc-sections    -Lib $(TOOLCHAIN_ABILIB)/crtbegin_static.o  -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,--warn-shared-textrel -Wl,--fatal-warnings -Wl,--icf=safe -Wl,--fix-cortex-a8    -Wl,--no-undefined  -fPIE -pie -fsanitize=address
		LDFLAGS=$(TOOLCHAIN_SYSLIB)/armv7-a/libasan_preinit.o -Wl,--whole-archive   -Wl,--no-whole-archive -Wl,--start-group  -lc   ${TOOLCHAIN_ABILIB}/armv7-a/libatomic.a $(TOOLCHAIN_ROOT)/./lib/gcc/arm-linux-androideabi/$(CDE_GCCVER)/libgcc.a -Wl,--end-group $(TOOLCHAIN_ABILIB)/crtend_android.o -L$(TOOLCHAIN_SYSLIB)/armv7-a -lasan -lstdc++ -lgcc -lm  -ldl
		CC=${TOOLCHAIN_ROOT}/bin/arm-linux-androideabi-g++
else
$(error " CDE_TARGET $(CDE_TARGET) is invalid, valid target is : i386 x86-64 arm-v7 ")
endif



TARGET=use-after-delete

all:
	$(CC) -c -o test.o $(CFLAGS) $(SRC)
	$(CC) -o $(TARGET) $(CFLAGS) test.o $(LDFLAGS)


	$(CC) -c -o dlsym.o $(CFLAGS) dlsym.c
	$(CC) -o dlsym $(CFLAGS) dlsym.o $(LDFLAGS)

clean:
	rm -f *.o $(TARGET) dlsym


prebuild:
	@echo "USER:           "${USER}
	@echo "BUILDTIME:      "${CDE_BUILDTIME}
	@echo "TARGET:         "${CDE_TARGET}
	@echo "KERNEL:         "${CDE_KERNELVER}
	@echo "TOPDIR:         "${CDE_TOPDIR}
	@echo "OUTDIR:         "${CDE_OUTDIR}
	@echo "PKGDIR:         "${CDE_PKGDIR}
	@echo "KERNELDIR:      "${CDE_KERNELDIR}
	@echo "TOOLCHAINDIR:   "${CDE_TOOLCHAIN_BINDIR}
	@echo "TOOLCHAIN_ROOT: "${TOOLCHAIN_ROOT}
	@echo "CC:             "${CC}
