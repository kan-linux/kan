#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../../make.def

CFLAGS=$(CCFLAGS) -DHAVE_CONFIG_H -I. -I../mpc/src -I.. -I../../gmp -I../../mpfr/src -g -O2

SRCS=`find ./ -name "*.c" -print`
OBJS=abs.o acos.o acosh.o add.o add_fr.o add_si.o add_ui.o arg.o asin.o asinh.o atan.o atanh.o clear.o cmp.o cmp_si_si.o conj.o cos.o cosh.o div_2si.o div_2ui.o div.o div_fr.o div_ui.o exp.o fma.o fr_div.o fr_sub.o get_prec2.o get_prec.o get_version.o get_x.o imag.o init2.o init3.o inp_str.o log.o log10.o mem.o mul_2si.o mul_2ui.o mul.o mul_fr.o mul_i.o mul_si.o mul_ui.o neg.o norm.o out_str.o pow.o pow_fr.o pow_ld.o pow_d.o pow_si.o pow_ui.o pow_z.o proj.o real.o urandom.o set.o set_prec.o set_str.o set_x.o set_x_x.o sin.o sin_cos.o sinh.o sqr.o sqrt.o strtoc.o sub.o sub_fr.o sub_ui.o swap.o tan.o tanh.o uceil_log2.o ui_div.o ui_ui_sub.o

TARGET=libmpc.a

all:$(OBJS)
	$(AR) $(TARGET) $(OBJS)
	ranlib libmpc.a


$(OBJS): %.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS)
	rm -f $(TARGET)
