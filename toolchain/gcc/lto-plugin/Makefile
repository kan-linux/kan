GCC=gcc
AR=ar
RANLIB=ranlib

CFLAGS=-DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/lto-plugin -I/android/gcc/gcc-6.4.0/lto-plugin/../include -DHAVE_CONFIG_H -Wall -g -O2  -fPIC -DPIC

SRCS=`find ./ -name "*.c" -print`
OBJS=lto-plugin.o

TARGET=liblto_plugin.so

all:$(OBJS)
	#$(GCC) -shared  -fPIC -DPIC  lto-plugin.o    -static-libgcc -static-libstdc++ -static-libgcc ../libiberty/pic/libiberty.a   -Wl,-soname -Wl,liblto_plugin.so.0 -o $@
	$(GCC) -shared  -fPIC -DPIC  lto-plugin.o    -static-libgcc -static-libstdc++ -static-libgcc ../libiberty/libiberty.a   -Wl,-soname -Wl,liblto_plugin.so.0 -o $@


$(OBJS): %.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@


clean:
	rm -f $(OBJS)
