#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../../make.def

CFLAGS=$(CCFLGAS) -std=gnu99 -DHAVE_CONFIG_H -I. -I../../gmp/scanf -I.. -I. -D__GMP_WITHIN_GMP -I../../gmp -g -O2 -c

SRCS=`find ./ -name "*.c" -print`
OBJS=doscan.o fscanf.o fscanffuns.o scanf.o sscanf.o sscanffuns.o vfscanf.o vscanf.o vsscanf.o

TARGET=libscanf.a
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
