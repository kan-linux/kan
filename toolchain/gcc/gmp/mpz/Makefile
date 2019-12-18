#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../../make.def

CFLAGS=$(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I../../gmp/mpz -I.. -I. -D__GMP_WITHIN_GMP -I../../gmp -g -O2 

SRCS=`find ./ -name "*.c" -print`
OBJS=2fac_ui.o add.o add_ui.o abs.o aorsmul.o aorsmul_i.o and.o array_init.o bin_ui.o bin_uiui.o cdiv_q.o cdiv_q_ui.o cdiv_qr.o cdiv_qr_ui.o cdiv_r.o cdiv_r_ui.o cdiv_ui.o cfdiv_q_2exp.o cfdiv_r_2exp.o clear.o clears.o clrbit.o cmp.o cmp_d.o cmp_si.o cmp_ui.o cmpabs.o cmpabs_d.o cmpabs_ui.o com.o combit.o cong.o cong_2exp.o cong_ui.o divexact.o divegcd.o dive_ui.o divis.o divis_ui.o divis_2exp.o dump.o export.o fac_ui.o fdiv_q.o fdiv_q_ui.o fdiv_qr.o fdiv_qr_ui.o fdiv_r.o fdiv_r_ui.o fdiv_ui.o fib_ui.o fib2_ui.o fits_sint.o fits_slong.o fits_sshort.o fits_uint.o fits_ulong.o fits_ushort.o gcd.o gcd_ui.o gcdext.o get_d.o get_d_2exp.o get_si.o get_str.o get_ui.o getlimbn.o hamdist.o import.o init.o init2.o inits.o inp_raw.o inp_str.o invert.o ior.o iset.o iset_d.o iset_si.o iset_str.o iset_ui.o jacobi.o kronsz.o kronuz.o kronzs.o kronzu.o lcm.o lcm_ui.o limbs_read.o limbs_write.o limbs_modify.o limbs_finish.o lucnum_ui.o lucnum2_ui.o mfac_uiui.o millerrabin.o mod.o mul.o mul_2exp.o mul_si.o mul_ui.o n_pow_ui.o neg.o nextprime.o oddfac_1.o out_raw.o out_str.o perfpow.o perfsqr.o popcount.o pow_ui.o powm.o powm_sec.o powm_ui.o pprime_p.o prodlimbs.o primorial_ui.o random.o random2.o realloc.o realloc2.o remove.o roinit_n.o root.o rootrem.o rrandomb.o scan0.o scan1.o set.o set_d.o set_f.o set_q.o set_si.o set_str.o set_ui.o setbit.o size.o sizeinbase.o sqrt.o sqrtrem.o sub.o sub_ui.o swap.o tdiv_ui.o tdiv_q.o tdiv_q_2exp.o tdiv_q_ui.o tdiv_qr.o tdiv_qr_ui.o tdiv_r.o tdiv_r_2exp.o tdiv_r_ui.o tstbit.o ui_pow_ui.o ui_sub.o urandomb.o urandomm.o xor.o

TARGET=libmpz.a
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
