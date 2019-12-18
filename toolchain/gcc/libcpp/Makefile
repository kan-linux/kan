#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../make.def

CFLAGS=-DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/mpc/src -I.. -I/ismp/build/./gmp -I/android/gcc/gcc-6.4.0/mpfr/src -g -O2
CFLAGS=$(CCFLAGS) -I/android/gcc/gcc-6.4.0/libcpp -I. -I/android/gcc/gcc-6.4.0/libcpp/../include -I/android/gcc/gcc-6.4.0/libcpp/include  -g -O2 -W -Wall -Wno-narrowing -Wwrite-strings -Wmissing-format-attribute -pedantic -Wno-long-long  -fno-exceptions -fno-rtti -I/android/gcc/gcc-6.4.0/libcpp -I. -I/android/gcc/gcc-6.4.0/libcpp/../include -I/android/gcc/gcc-6.4.0/libcpp/include


SRCS=`find ./ -name "*.c" -print`
OBJS=charset.o directives.o directives-only.o errors.o expr.o files.o identifiers.o init.o lex.o line-map.o macro.o mkdeps.o pch.o symtab.o traditional.o

TARGET=libcpp.a

all:$(OBJS)
	$(AR) $(TARGET) $(OBJS)


$(OBJS): %.o: %.c
	g++ -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(TARGET)
