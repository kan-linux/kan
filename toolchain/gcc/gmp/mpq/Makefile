#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../../make.def

CFLAGS=$(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I../../gmp/mpq -I.. -I. -D__GMP_WITHIN_GMP -I../../gmp -g -O2

SRCS=`find ./ -name "*.c" -print`
OBJS=abs.o aors.o canonicalize.o clear.o clears.o cmp.o cmp_si.o cmp_ui.o div.o equal.o get_d.o get_den.o get_num.o get_str.o init.o inits.o inp_str.o inv.o md_2exp.o mul.o neg.o out_str.o set.o set_den.o set_num.o set_si.o set_str.o set_ui.o set_z.o set_d.o set_f.o swap.o

TARGET=libmpq.a
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
