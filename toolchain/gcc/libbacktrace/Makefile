#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../make.def

CFLAGS=-DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/mpc/src -I.. -I/ismp/build/./gmp -I/android/gcc/gcc-6.4.0/mpfr/src -g -O2
CFLAGS=$(CCFLAGS) -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/libbacktrace  -I /android/gcc/gcc-6.4.0/libbacktrace/../include -I /android/gcc/gcc-6.4.0/libbacktrace/../libgcc -I ../libgcc  -funwind-tables -frandom-seed=atomic.lo -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual  -g -O2 -c


SRCS=`find ./ -name "*.c" -print`
OBJS=atomic.o dwarf.o fileline.o posix.o print.o sort.o state.o backtrace.o simple.o elf.o mmapio.o mmap.o

TARGET=libbacktrace.a

all:$(OBJS)
	$(AR) $(TARGET) $(OBJS)


$(OBJS): %.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(TARGET)
