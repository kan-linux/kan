GCC=gcc
AR=ar
RANLIB=ranlib

CFLAGS=-std=gnu99 -DHAVE_CONFIG_H -I. -I../mpf -I.. -I. -D__GMP_WITHIN_GMP -I../gmp -g -O2 

SRCS=`find ./ -name "*.c" -print`
OBJS=init.o init2.o inits.o set.o set_ui.o set_si.o set_str.o set_d.o set_z.o set_q.o iset.o iset_ui.o iset_si.o iset_str.o iset_d.o clear.o clears.o get_str.o dump.o size.o eq.o reldiff.o sqrt.o random2.o inp_str.o out_str.o add.o add_ui.o sub.o sub_ui.o ui_sub.o mul.o mul_ui.o div.o div_ui.o cmp.o cmp_d.o cmp_z.o cmp_si.o cmp_ui.o mul_2exp.o div_2exp.o abs.o neg.o get_d.o get_d_2exp.o set_dfl_prec.o set_prc.o set_prc_raw.o get_dfl_prec.o get_prc.o ui_div.o sqrt_ui.o pow_ui.o urandomb.o swap.o get_si.o get_ui.o int_p.o ceilfloor.o trunc.o fits_sint.o fits_slong.o fits_sshort.o fits_uint.o fits_ulong.o fits_ushort.o

TARGET=libmpf.a

all:$(OBJS)
	$(AR) cr $(TARGET) $(OBJS)


%.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
