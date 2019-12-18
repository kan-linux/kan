#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../../make.def

CFLAGS=$(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I../../gmp/rand -I.. -I. -D__GMP_WITHIN_GMP -I../../gmp -g -O2 

SRCS=`find ./ -name "*.c" -print`
OBJS=rand.o randclr.o randdef.o randiset.o randlc2s.o randlc2x.o randmt.o randmts.o rands.o randsd.o randsdui.o randbui.o randmui.o

TARGET=librand.a
vpath %.c mpf
vpath %.c mpz
vpath %.c mpn
vpath %.c mpq

all:$(OBJS)
	$(AR) $(TARGET) $(OBJS)


%.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(TARGET)
