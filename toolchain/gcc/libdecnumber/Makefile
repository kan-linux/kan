#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../make.def

CFLAGS=-DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/mpc/src -I.. -I/ismp/build/./gmp -I/android/gcc/gcc-6.4.0/mpfr/src -g -O2
CFLAGS=$(CCFLAGS) -I/android/gcc/gcc-6.4.0/libdecnumber -I.  -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition -Wmissing-format-attribute -Wcast-qual -pedantic -Wno-long-long  -I/android/gcc/gcc-6.4.0/libdecnumber -I.  


SRCS=`find ./ -name "*.c" -print`
OBJS=decNumber.o decContext.o bid/decimal32.o bid/decimal64.o bid/decimal128.o bid/bid2dpd_dpd2bid.o bid/host-ieee32.o bid/host-ieee64.o bid/host-ieee128.o

TARGET=libdecnumber.a

all:$(OBJS)
	$(AR) $(TARGET) $(OBJS)


$(OBJS): %.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(TARGET)
