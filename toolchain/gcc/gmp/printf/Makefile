#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../../make.def

CFLAGS=$(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I../../gmp/printf -I.. -I. -D__GMP_WITHIN_GMP -I../../gmp -g -O2

SRCS=`find ./ -name "*.c" -print`
OBJS=asprintf.o asprntffuns.o doprnt.o doprntf.o doprnti.o fprintf.o obprintf.o obvprintf.o obprntffuns.o printf.o printffuns.o snprintf.o snprntffuns.o sprintf.o sprintffuns.o vasprintf.o vfprintf.o vprintf.o vsnprintf.o vsprintf.o repl-vsnprintf.o

TARGET=libprintf.a
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
