#GCC=gcc
#AR=ar
#RANLIB=ranlib
include ../make.def

CFLAGS=$(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I../gmp  -D__GMP_WITHIN_GMP   -g -O2 -c 

SRCS=`find ./ -name "*.c" -print`

OBJS=assert.o compat.o errno.o extract-dbl.o invalid.o memory.o mp_bpl.o mp_clz_tab.o mp_dv_tab.o mp_minv_tab.o mp_get_fns.o mp_set_fns.o version.o nextprime.o primesieve.o tal-reent.o mpf/init.o mpf/init2.o mpf/inits.o mpf/set.o mpf/set_ui.o mpf/set_si.o mpf/set_str.o mpf/set_d.o mpf/set_z.o mpf/iset.o mpf/iset_ui.o mpf/iset_si.o mpf/iset_str.o mpf/iset_d.o mpf/clear.o mpf/clears.o mpf/get_str.o mpf/dump.o mpf/size.o mpf/eq.o mpf/reldiff.o mpf/sqrt.o mpf/random2.o mpf/inp_str.o mpf/out_str.o mpf/add.o mpf/add_ui.o mpf/sub.o mpf/sub_ui.o mpf/ui_sub.o mpf/mul.o mpf/mul_ui.o mpf/div.o mpf/div_ui.o mpf/cmp_z.o mpf/cmp.o mpf/cmp_d.o mpf/cmp_ui.o mpf/cmp_si.o mpf/mul_2exp.o mpf/div_2exp.o mpf/abs.o mpf/neg.o mpf/set_q.o mpf/get_d.o mpf/get_d_2exp.o mpf/set_dfl_prec.o mpf/set_prc.o mpf/set_prc_raw.o mpf/get_dfl_prec.o mpf/get_prc.o mpf/ui_div.o mpf/sqrt_ui.o mpf/ceilfloor.o mpf/trunc.o mpf/pow_ui.o mpf/urandomb.o mpf/swap.o mpf/fits_sint.o mpf/fits_slong.o mpf/fits_sshort.o mpf/fits_uint.o mpf/fits_ulong.o mpf/fits_ushort.o mpf/get_si.o mpf/get_ui.o mpf/int_p.o .libs/libgmp.lax/lt1-abs.o .libs/libgmp.lax/lt2-add.o .libs/libgmp.lax/lt3-add_ui.o mpz/aorsmul.o mpz/aorsmul_i.o mpz/and.o mpz/array_init.o mpz/bin_ui.o mpz/bin_uiui.o mpz/cdiv_q.o mpz/cdiv_q_ui.o mpz/cdiv_qr.o mpz/cdiv_qr_ui.o mpz/cdiv_r.o mpz/cdiv_r_ui.o mpz/cdiv_ui.o mpz/cfdiv_q_2exp.o mpz/cfdiv_r_2exp.o .libs/libgmp.lax/lt4-clear.o .libs/libgmp.lax/lt5-clears.o mpz/clrbit.o .libs/libgmp.lax/lt6-cmp.o .libs/libgmp.lax/lt7-cmp_d.o .libs/libgmp.lax/lt8-cmp_si.o .libs/libgmp.lax/lt9-cmp_ui.o mpz/cmpabs.o mpz/cmpabs_d.o mpz/cmpabs_ui.o mpz/com.o mpz/combit.o mpz/cong.o mpz/cong_2exp.o mpz/cong_ui.o mpz/divexact.o mpz/divegcd.o mpz/dive_ui.o mpz/divis.o mpz/divis_ui.o mpz/divis_2exp.o .libs/libgmp.lax/lt10-dump.o mpz/export.o mpz/mfac_uiui.o mpz/2fac_ui.o mpz/fac_ui.o mpz/oddfac_1.o mpz/prodlimbs.o mpz/fdiv_q_ui.o mpz/fdiv_qr.o mpz/fdiv_qr_ui.o mpz/fdiv_r.o mpz/fdiv_r_ui.o mpz/fdiv_q.o mpz/fdiv_ui.o mpz/fib_ui.o mpz/fib2_ui.o .libs/libgmp.lax/lt11-fits_sint.o .libs/libgmp.lax/lt12-fits_slong.o .libs/libgmp.lax/lt13-fits_sshort.o .libs/libgmp.lax/lt14-fits_uint.o .libs/libgmp.lax/lt15-fits_ulong.o .libs/libgmp.lax/lt16-fits_ushort.o mpz/gcd.o mpz/gcd_ui.o mpz/gcdext.o .libs/libgmp.lax/lt17-get_d.o .libs/libgmp.lax/lt18-get_d_2exp.o .libs/libgmp.lax/lt19-get_si.o .libs/libgmp.lax/lt20-get_str.o .libs/libgmp.lax/lt21-get_ui.o mpz/getlimbn.o mpz/hamdist.o mpz/import.o .libs/libgmp.lax/lt22-init.o .libs/libgmp.lax/lt23-init2.o .libs/libgmp.lax/lt24-inits.o mpz/inp_raw.o .libs/libgmp.lax/lt25-inp_str.o mpz/invert.o mpz/ior.o .libs/libgmp.lax/lt26-iset.o .libs/libgmp.lax/lt27-iset_d.o .libs/libgmp.lax/lt28-iset_si.o .libs/libgmp.lax/lt29-iset_str.o .libs/libgmp.lax/lt30-iset_ui.o mpz/jacobi.o mpz/kronsz.o mpz/kronuz.o mpz/kronzs.o mpz/kronzu.o mpz/lcm.o mpz/lcm_ui.o mpz/limbs_finish.o mpz/limbs_modify.o mpz/limbs_read.o mpz/limbs_write.o mpz/lucnum_ui.o mpz/lucnum2_ui.o mpz/millerrabin.o mpz/mod.o .libs/libgmp.lax/lt31-mul.o .libs/libgmp.lax/lt32-mul_2exp.o mpz/mul_si.o .libs/libgmp.lax/lt33-mul_ui.o mpz/n_pow_ui.o .libs/libgmp.lax/lt34-neg.o .libs/libgmp.lax/lt35-nextprime.o mpz/out_raw.o .libs/libgmp.lax/lt36-out_str.o mpz/perfpow.o mpz/perfsqr.o mpz/popcount.o .libs/libgmp.lax/lt37-pow_ui.o mpz/powm.o mpz/powm_sec.o mpz/powm_ui.o mpz/primorial_ui.o mpz/pprime_p.o mpz/random.o .libs/libgmp.lax/lt38-random2.o mpz/realloc.o mpz/realloc2.o mpz/remove.o mpz/roinit_n.o mpz/root.o mpz/rootrem.o mpz/rrandomb.o mpz/scan0.o mpz/scan1.o .libs/libgmp.lax/lt39-set.o .libs/libgmp.lax/lt40-set_d.o mpz/set_f.o .libs/libgmp.lax/lt41-set_q.o .libs/libgmp.lax/lt42-set_si.o .libs/libgmp.lax/lt43-set_str.o .libs/libgmp.lax/lt44-set_ui.o mpz/setbit.o .libs/libgmp.lax/lt45-size.o mpz/sizeinbase.o .libs/libgmp.lax/lt46-sqrt.o mpz/sqrtrem.o .libs/libgmp.lax/lt47-sub.o .libs/libgmp.lax/lt48-sub_ui.o .libs/libgmp.lax/lt49-swap.o mpz/tdiv_ui.o mpz/tdiv_q.o mpz/tdiv_q_2exp.o mpz/tdiv_q_ui.o mpz/tdiv_qr.o mpz/tdiv_qr_ui.o mpz/tdiv_r.o mpz/tdiv_r_2exp.o mpz/tdiv_r_ui.o mpz/tstbit.o mpz/ui_pow_ui.o .libs/libgmp.lax/lt50-ui_sub.o .libs/libgmp.lax/lt51-urandomb.o mpz/urandomm.o mpz/xor.o .libs/libgmp.lax/lt52-abs.o mpq/aors.o mpq/canonicalize.o .libs/libgmp.lax/lt53-clear.o .libs/libgmp.lax/lt54-clears.o .libs/libgmp.lax/lt55-cmp.o .libs/libgmp.lax/lt56-cmp_si.o .libs/libgmp.lax/lt57-cmp_ui.o .libs/libgmp.lax/lt58-div.o .libs/libgmp.lax/lt59-get_d.o mpq/get_den.o mpq/get_num.o .libs/libgmp.lax/lt60-get_str.o .libs/libgmp.lax/lt61-init.o .libs/libgmp.lax/lt62-inits.o .libs/libgmp.lax/lt63-inp_str.o mpq/inv.o mpq/md_2exp.o .libs/libgmp.lax/lt64-mul.o .libs/libgmp.lax/lt65-neg.o .libs/libgmp.lax/lt66-out_str.o .libs/libgmp.lax/lt67-set.o mpq/set_den.o mpq/set_num.o .libs/libgmp.lax/lt68-set_si.o .libs/libgmp.lax/lt69-set_str.o .libs/libgmp.lax/lt70-set_ui.o mpq/equal.o .libs/libgmp.lax/lt71-set_z.o .libs/libgmp.lax/lt72-set_d.o .libs/libgmp.lax/lt73-set_f.o .libs/libgmp.lax/lt74-swap.o mpn/fib_table.o mpn/mp_bases.o .libs/libgmp.lax/lt75-add.o mpn/add_1.o mpn/add_n.o .libs/libgmp.lax/lt76-sub.o mpn/sub_1.o mpn/sub_n.o mpn/cnd_add_n.o mpn/cnd_sub_n.o mpn/cnd_swap.o .libs/libgmp.lax/lt77-neg.o .libs/libgmp.lax/lt78-com.o mpn/mul_1.o mpn/addmul_1.o mpn/submul_1.o mpn/add_err1_n.o mpn/add_err2_n.o mpn/add_err3_n.o mpn/sub_err1_n.o mpn/sub_err2_n.o mpn/sub_err3_n.o mpn/lshift.o mpn/rshift.o mpn/dive_1.o mpn/diveby3.o .libs/libgmp.lax/lt79-divis.o mpn/divrem.o mpn/divrem_1.o mpn/divrem_2.o .libs/libgmp.lax/lt80-fib2_ui.o mpn/mod_1.o mpn/mod_34lsub1.o mpn/mode1o.o mpn/pre_divrem_1.o mpn/pre_mod_1.o .libs/libgmp.lax/lt81-dump.o mpn/mod_1_1.o mpn/mod_1_2.o mpn/mod_1_3.o mpn/mod_1_4.o mpn/lshiftc.o .libs/libgmp.lax/lt82-mul.o mpn/mul_fft.o mpn/mul_n.o mpn/sqr.o mpn/mul_basecase.o mpn/sqr_basecase.o mpn/nussbaumer_mul.o mpn/mulmid_basecase.o mpn/toom42_mulmid.o mpn/mulmid_n.o mpn/mulmid.o .libs/libgmp.lax/lt83-random.o .libs/libgmp.lax/lt84-random2.o mpn/pow_1.o .libs/libgmp.lax/lt85-rootrem.o .libs/libgmp.lax/lt86-sqrtrem.o .libs/libgmp.lax/lt87-sizeinbase.o .libs/libgmp.lax/lt88-get_str.o .libs/libgmp.lax/lt89-set_str.o .libs/libgmp.lax/lt90-scan0.o .libs/libgmp.lax/lt91-scan1.o .libs/libgmp.lax/lt92-popcount.o .libs/libgmp.lax/lt93-hamdist.o .libs/libgmp.lax/lt94-cmp.o mpn/zero_p.o .libs/libgmp.lax/lt95-perfsqr.o .libs/libgmp.lax/lt96-perfpow.o mpn/gcd_1.o .libs/libgmp.lax/lt97-gcd.o mpn/gcdext_1.o .libs/libgmp.lax/lt98-gcdext.o mpn/gcd_subdiv_step.o mpn/gcdext_lehmer.o mpn/div_q.o .libs/libgmp.lax/lt99-tdiv_qr.o mpn/jacbase.o mpn/jacobi_2.o .libs/libgmp.lax/lt100-jacobi.o .libs/libgmp.lax/lt101-get_d.o mpn/matrix22_mul.o mpn/matrix22_mul1_inverse_vector.o mpn/hgcd_matrix.o mpn/hgcd2.o mpn/hgcd_step.o mpn/hgcd_reduce.o mpn/hgcd.o mpn/hgcd_appr.o mpn/hgcd2_jacobi.o mpn/hgcd_jacobi.o mpn/mullo_n.o mpn/mullo_basecase.o mpn/sqrlo.o mpn/sqrlo_basecase.o mpn/toom22_mul.o mpn/toom32_mul.o mpn/toom42_mul.o mpn/toom52_mul.o mpn/toom62_mul.o mpn/toom33_mul.o mpn/toom43_mul.o mpn/toom53_mul.o mpn/toom54_mul.o mpn/toom63_mul.o mpn/toom44_mul.o mpn/toom6h_mul.o mpn/toom6_sqr.o mpn/toom8h_mul.o mpn/toom8_sqr.o mpn/toom_couple_handling.o mpn/toom2_sqr.o mpn/toom3_sqr.o mpn/toom4_sqr.o mpn/toom_eval_dgr3_pm1.o mpn/toom_eval_dgr3_pm2.o mpn/toom_eval_pm1.o mpn/toom_eval_pm2.o mpn/toom_eval_pm2exp.o mpn/toom_eval_pm2rexp.o mpn/toom_interpolate_5pts.o mpn/toom_interpolate_6pts.o mpn/toom_interpolate_7pts.o mpn/toom_interpolate_8pts.o mpn/toom_interpolate_12pts.o mpn/toom_interpolate_16pts.o mpn/invertappr.o .libs/libgmp.lax/lt102-invert.o mpn/binvert.o mpn/mulmod_bnm1.o mpn/sqrmod_bnm1.o mpn/div_qr_1.o mpn/div_qr_1n_pi1.o mpn/div_qr_2.o mpn/div_qr_2n_pi1.o mpn/div_qr_2u_pi1.o mpn/sbpi1_div_q.o mpn/sbpi1_div_qr.o mpn/sbpi1_divappr_q.o mpn/dcpi1_div_q.o mpn/dcpi1_div_qr.o mpn/dcpi1_divappr_q.o mpn/mu_div_qr.o mpn/mu_divappr_q.o mpn/mu_div_q.o mpn/bdiv_q_1.o mpn/sbpi1_bdiv_q.o mpn/sbpi1_bdiv_qr.o mpn/dcpi1_bdiv_q.o mpn/dcpi1_bdiv_qr.o mpn/mu_bdiv_q.o mpn/mu_bdiv_qr.o mpn/bdiv_q.o mpn/bdiv_qr.o mpn/broot.o mpn/brootinv.o mpn/bsqrt.o mpn/bsqrtinv.o .libs/libgmp.lax/lt103-divexact.o mpn/bdiv_dbm1c.o mpn/redc_1.o mpn/redc_2.o mpn/redc_n.o .libs/libgmp.lax/lt104-powm.o mpn/powlo.o mpn/sec_powm.o mpn/sec_mul.o mpn/sec_sqr.o mpn/sec_div_qr.o mpn/sec_div_r.o mpn/sec_pi1_div_qr.o mpn/sec_pi1_div_r.o mpn/sec_add_1.o mpn/sec_sub_1.o mpn/sec_invert.o mpn/trialdiv.o .libs/libgmp.lax/lt105-remove.o mpn/and_n.o mpn/andn_n.o mpn/nand_n.o mpn/ior_n.o mpn/iorn_n.o mpn/nior_n.o mpn/xor_n.o mpn/xnor_n.o mpn/copyi.o mpn/copyd.o mpn/zero.o mpn/sec_tabselect.o mpn/comb_tables.o mpn/add_n_sub_n.o printf/asprintf.o printf/asprntffuns.o printf/doprnt.o printf/doprntf.o printf/doprnti.o printf/fprintf.o printf/obprintf.o printf/obvprintf.o printf/obprntffuns.o printf/printf.o printf/printffuns.o printf/snprintf.o printf/snprntffuns.o printf/sprintf.o printf/sprintffuns.o printf/vasprintf.o printf/vfprintf.o printf/vprintf.o printf/vsnprintf.o printf/vsprintf.o printf/repl-vsnprintf.o scanf/doscan.o scanf/fscanf.o scanf/fscanffuns.o scanf/scanf.o scanf/sscanf.o scanf/sscanffuns.o scanf/vfscanf.o scanf/vscanf.o scanf/vsscanf.o rand/rand.o rand/randclr.o rand/randdef.o rand/randiset.o rand/randlc2s.o rand/randlc2x.o rand/randmt.o rand/randmts.o rand/rands.o rand/randsd.o rand/randsdui.o rand/randbui.o rand/randmui.o




TARGET=libgmp.a

all: step0 step1 step2 step3
	
step0:
	make -C mpn
	make -C mpq
	make -C mpz
	make -C printf 
	make -C scanf
	make -C rand

step2:$(OBJS)
	$(AR) $(TARGET) $(OBJS)
	ranlib libgmp.a


step3:
	rm -rf .libs/libgmp.lax
#libtool: link: rm -fr .libs/libgmp.lax
#libtool: link: ( cd ".libs" && rm -f "libgmp.la" && ln -s "../libgmp.la" "libgmp.la" )
#make[2]: Leaving directory `/android/build/gmp'
#make[1]: Leaving directory `/android/build/gmp'


clean:
	rm -f $(OBJS)
	rm -f $(TARGET)
	rm -rf .libs/libgmp.lax
	make -C mpn clean
	make -C mpq clean
	make -C mpz clean
	make -C printf  clean
	make -C scanf clean
	make -C rand clean

step1:
	echo "copying selected object files to avoid basename conflicts..."
	mkdir -p .libs/libgmp.lax
	ln mpz/abs.o .libs/libgmp.lax/lt1-abs.o || cp mpz/abs.o .libs/libgmp.lax/lt1-abs.o
	ln mpz/add.o .libs/libgmp.lax/lt2-add.o || cp mpz/add.o .libs/libgmp.lax/lt2-add.o
	ln mpz/add_ui.o .libs/libgmp.lax/lt3-add_ui.o || cp mpz/add_ui.o .libs/libgmp.lax/lt3-add_ui.o
	ln mpz/clear.o .libs/libgmp.lax/lt4-clear.o || cp mpz/clear.o .libs/libgmp.lax/lt4-clear.o
	ln mpz/clears.o .libs/libgmp.lax/lt5-clears.o || cp mpz/clears.o .libs/libgmp.lax/lt5-clears.o
	ln mpz/cmp.o .libs/libgmp.lax/lt6-cmp.o || cp mpz/cmp.o .libs/libgmp.lax/lt6-cmp.o
	ln mpz/cmp_d.o .libs/libgmp.lax/lt7-cmp_d.o || cp mpz/cmp_d.o .libs/libgmp.lax/lt7-cmp_d.o
	ln mpz/cmp_si.o .libs/libgmp.lax/lt8-cmp_si.o || cp mpz/cmp_si.o .libs/libgmp.lax/lt8-cmp_si.o
	ln mpz/cmp_ui.o .libs/libgmp.lax/lt9-cmp_ui.o || cp mpz/cmp_ui.o .libs/libgmp.lax/lt9-cmp_ui.o
	ln mpz/dump.o .libs/libgmp.lax/lt10-dump.o || cp mpz/dump.o .libs/libgmp.lax/lt10-dump.o
	ln mpz/fits_sint.o .libs/libgmp.lax/lt11-fits_sint.o || cp mpz/fits_sint.o .libs/libgmp.lax/lt11-fits_sint.o
	ln mpz/fits_slong.o .libs/libgmp.lax/lt12-fits_slong.o || cp mpz/fits_slong.o .libs/libgmp.lax/lt12-fits_slong.o
	ln mpz/fits_sshort.o .libs/libgmp.lax/lt13-fits_sshort.o || cp mpz/fits_sshort.o .libs/libgmp.lax/lt13-fits_sshort.o
	ln mpz/fits_uint.o .libs/libgmp.lax/lt14-fits_uint.o || cp mpz/fits_uint.o .libs/libgmp.lax/lt14-fits_uint.o
	ln mpz/fits_ulong.o .libs/libgmp.lax/lt15-fits_ulong.o || cp mpz/fits_ulong.o .libs/libgmp.lax/lt15-fits_ulong.o
	ln mpz/fits_ushort.o .libs/libgmp.lax/lt16-fits_ushort.o || cp mpz/fits_ushort.o .libs/libgmp.lax/lt16-fits_ushort.o
	ln mpz/get_d.o .libs/libgmp.lax/lt17-get_d.o || cp mpz/get_d.o .libs/libgmp.lax/lt17-get_d.o
	ln mpz/get_d_2exp.o .libs/libgmp.lax/lt18-get_d_2exp.o || cp mpz/get_d_2exp.o .libs/libgmp.lax/lt18-get_d_2exp.o
	ln mpz/get_si.o .libs/libgmp.lax/lt19-get_si.o || cp mpz/get_si.o .libs/libgmp.lax/lt19-get_si.o
	ln mpz/get_str.o .libs/libgmp.lax/lt20-get_str.o || cp mpz/get_str.o .libs/libgmp.lax/lt20-get_str.o
	ln mpz/get_ui.o .libs/libgmp.lax/lt21-get_ui.o || cp mpz/get_ui.o .libs/libgmp.lax/lt21-get_ui.o
	ln mpz/init.o .libs/libgmp.lax/lt22-init.o || cp mpz/init.o .libs/libgmp.lax/lt22-init.o
	ln mpz/init2.o .libs/libgmp.lax/lt23-init2.o || cp mpz/init2.o .libs/libgmp.lax/lt23-init2.o
	ln mpz/inits.o .libs/libgmp.lax/lt24-inits.o || cp mpz/inits.o .libs/libgmp.lax/lt24-inits.o
	ln mpz/inp_str.o .libs/libgmp.lax/lt25-inp_str.o || cp mpz/inp_str.o .libs/libgmp.lax/lt25-inp_str.o
	ln mpz/iset.o .libs/libgmp.lax/lt26-iset.o || cp mpz/iset.o .libs/libgmp.lax/lt26-iset.o
	ln mpz/iset_d.o .libs/libgmp.lax/lt27-iset_d.o || cp mpz/iset_d.o .libs/libgmp.lax/lt27-iset_d.o
	ln mpz/iset_si.o .libs/libgmp.lax/lt28-iset_si.o || cp mpz/iset_si.o .libs/libgmp.lax/lt28-iset_si.o
	ln mpz/iset_str.o .libs/libgmp.lax/lt29-iset_str.o || cp mpz/iset_str.o .libs/libgmp.lax/lt29-iset_str.o
	ln mpz/iset_ui.o .libs/libgmp.lax/lt30-iset_ui.o || cp mpz/iset_ui.o .libs/libgmp.lax/lt30-iset_ui.o
	ln mpz/mul.o .libs/libgmp.lax/lt31-mul.o || cp mpz/mul.o .libs/libgmp.lax/lt31-mul.o
	ln mpz/mul_2exp.o .libs/libgmp.lax/lt32-mul_2exp.o || cp mpz/mul_2exp.o .libs/libgmp.lax/lt32-mul_2exp.o
	ln mpz/mul_ui.o .libs/libgmp.lax/lt33-mul_ui.o || cp mpz/mul_ui.o .libs/libgmp.lax/lt33-mul_ui.o
	ln mpz/neg.o .libs/libgmp.lax/lt34-neg.o || cp mpz/neg.o .libs/libgmp.lax/lt34-neg.o
	ln mpz/nextprime.o .libs/libgmp.lax/lt35-nextprime.o || cp mpz/nextprime.o .libs/libgmp.lax/lt35-nextprime.o
	ln mpz/out_str.o .libs/libgmp.lax/lt36-out_str.o || cp mpz/out_str.o .libs/libgmp.lax/lt36-out_str.o
	ln mpz/pow_ui.o .libs/libgmp.lax/lt37-pow_ui.o || cp mpz/pow_ui.o .libs/libgmp.lax/lt37-pow_ui.o
	ln mpz/random2.o .libs/libgmp.lax/lt38-random2.o || cp mpz/random2.o .libs/libgmp.lax/lt38-random2.o
	ln mpz/set.o .libs/libgmp.lax/lt39-set.o || cp mpz/set.o .libs/libgmp.lax/lt39-set.o
	ln mpz/set_d.o .libs/libgmp.lax/lt40-set_d.o || cp mpz/set_d.o .libs/libgmp.lax/lt40-set_d.o
	ln mpz/set_q.o .libs/libgmp.lax/lt41-set_q.o || cp mpz/set_q.o .libs/libgmp.lax/lt41-set_q.o
	ln mpz/set_si.o .libs/libgmp.lax/lt42-set_si.o || cp mpz/set_si.o .libs/libgmp.lax/lt42-set_si.o
	ln mpz/set_str.o .libs/libgmp.lax/lt43-set_str.o || cp mpz/set_str.o .libs/libgmp.lax/lt43-set_str.o
	ln mpz/set_ui.o .libs/libgmp.lax/lt44-set_ui.o || cp mpz/set_ui.o .libs/libgmp.lax/lt44-set_ui.o
	ln mpz/size.o .libs/libgmp.lax/lt45-size.o || cp mpz/size.o .libs/libgmp.lax/lt45-size.o
	ln mpz/sqrt.o .libs/libgmp.lax/lt46-sqrt.o || cp mpz/sqrt.o .libs/libgmp.lax/lt46-sqrt.o
	ln mpz/sub.o .libs/libgmp.lax/lt47-sub.o || cp mpz/sub.o .libs/libgmp.lax/lt47-sub.o
	ln mpz/sub_ui.o .libs/libgmp.lax/lt48-sub_ui.o || cp mpz/sub_ui.o .libs/libgmp.lax/lt48-sub_ui.o
	ln mpz/swap.o .libs/libgmp.lax/lt49-swap.o || cp mpz/swap.o .libs/libgmp.lax/lt49-swap.o
	ln mpz/ui_sub.o .libs/libgmp.lax/lt50-ui_sub.o || cp mpz/ui_sub.o .libs/libgmp.lax/lt50-ui_sub.o
	ln mpz/urandomb.o .libs/libgmp.lax/lt51-urandomb.o || cp mpz/urandomb.o .libs/libgmp.lax/lt51-urandomb.o
	ln mpq/abs.o .libs/libgmp.lax/lt52-abs.o || cp mpq/abs.o .libs/libgmp.lax/lt52-abs.o
	ln mpq/clear.o .libs/libgmp.lax/lt53-clear.o || cp mpq/clear.o .libs/libgmp.lax/lt53-clear.o
	ln mpq/clears.o .libs/libgmp.lax/lt54-clears.o || cp mpq/clears.o .libs/libgmp.lax/lt54-clears.o
	ln mpq/cmp.o .libs/libgmp.lax/lt55-cmp.o || cp mpq/cmp.o .libs/libgmp.lax/lt55-cmp.o
	ln mpq/cmp_si.o .libs/libgmp.lax/lt56-cmp_si.o || cp mpq/cmp_si.o .libs/libgmp.lax/lt56-cmp_si.o
	ln mpq/cmp_ui.o .libs/libgmp.lax/lt57-cmp_ui.o || cp mpq/cmp_ui.o .libs/libgmp.lax/lt57-cmp_ui.o
	ln mpq/div.o .libs/libgmp.lax/lt58-div.o || cp mpq/div.o .libs/libgmp.lax/lt58-div.o
	ln mpq/get_d.o .libs/libgmp.lax/lt59-get_d.o || cp mpq/get_d.o .libs/libgmp.lax/lt59-get_d.o
	ln mpq/get_str.o .libs/libgmp.lax/lt60-get_str.o || cp mpq/get_str.o .libs/libgmp.lax/lt60-get_str.o
	ln mpq/init.o .libs/libgmp.lax/lt61-init.o || cp mpq/init.o .libs/libgmp.lax/lt61-init.o
	ln mpq/inits.o .libs/libgmp.lax/lt62-inits.o || cp mpq/inits.o .libs/libgmp.lax/lt62-inits.o
	ln mpq/inp_str.o .libs/libgmp.lax/lt63-inp_str.o || cp mpq/inp_str.o .libs/libgmp.lax/lt63-inp_str.o
	ln mpq/mul.o .libs/libgmp.lax/lt64-mul.o || cp mpq/mul.o .libs/libgmp.lax/lt64-mul.o
	ln mpq/neg.o .libs/libgmp.lax/lt65-neg.o || cp mpq/neg.o .libs/libgmp.lax/lt65-neg.o
	ln mpq/out_str.o .libs/libgmp.lax/lt66-out_str.o || cp mpq/out_str.o .libs/libgmp.lax/lt66-out_str.o
	ln mpq/set.o .libs/libgmp.lax/lt67-set.o || cp mpq/set.o .libs/libgmp.lax/lt67-set.o
	ln mpq/set_si.o .libs/libgmp.lax/lt68-set_si.o || cp mpq/set_si.o .libs/libgmp.lax/lt68-set_si.o
	ln mpq/set_str.o .libs/libgmp.lax/lt69-set_str.o || cp mpq/set_str.o .libs/libgmp.lax/lt69-set_str.o
	ln mpq/set_ui.o .libs/libgmp.lax/lt70-set_ui.o || cp mpq/set_ui.o .libs/libgmp.lax/lt70-set_ui.o
	ln mpq/set_z.o .libs/libgmp.lax/lt71-set_z.o || cp mpq/set_z.o .libs/libgmp.lax/lt71-set_z.o
	ln mpq/set_d.o .libs/libgmp.lax/lt72-set_d.o || cp mpq/set_d.o .libs/libgmp.lax/lt72-set_d.o
	ln mpq/set_f.o .libs/libgmp.lax/lt73-set_f.o || cp mpq/set_f.o .libs/libgmp.lax/lt73-set_f.o
	ln mpq/swap.o .libs/libgmp.lax/lt74-swap.o || cp mpq/swap.o .libs/libgmp.lax/lt74-swap.o
	ln mpn/add.o .libs/libgmp.lax/lt75-add.o || cp mpn/add.o .libs/libgmp.lax/lt75-add.o
	ln mpn/sub.o .libs/libgmp.lax/lt76-sub.o || cp mpn/sub.o .libs/libgmp.lax/lt76-sub.o
	ln mpn/neg.o .libs/libgmp.lax/lt77-neg.o || cp mpn/neg.o .libs/libgmp.lax/lt77-neg.o
	ln mpn/com.o .libs/libgmp.lax/lt78-com.o || cp mpn/com.o .libs/libgmp.lax/lt78-com.o
	ln mpn/divis.o .libs/libgmp.lax/lt79-divis.o || cp mpn/divis.o .libs/libgmp.lax/lt79-divis.o
	ln mpn/fib2_ui.o .libs/libgmp.lax/lt80-fib2_ui.o || cp mpn/fib2_ui.o .libs/libgmp.lax/lt80-fib2_ui.o
	ln mpn/dump.o .libs/libgmp.lax/lt81-dump.o || cp mpn/dump.o .libs/libgmp.lax/lt81-dump.o
	ln mpn/mul.o .libs/libgmp.lax/lt82-mul.o || cp mpn/mul.o .libs/libgmp.lax/lt82-mul.o
	ln mpn/random.o .libs/libgmp.lax/lt83-random.o || cp mpn/random.o .libs/libgmp.lax/lt83-random.o
	ln mpn/random2.o .libs/libgmp.lax/lt84-random2.o || cp mpn/random2.o .libs/libgmp.lax/lt84-random2.o
	ln mpn/rootrem.o .libs/libgmp.lax/lt85-rootrem.o || cp mpn/rootrem.o .libs/libgmp.lax/lt85-rootrem.o
	ln mpn/sqrtrem.o .libs/libgmp.lax/lt86-sqrtrem.o || cp mpn/sqrtrem.o .libs/libgmp.lax/lt86-sqrtrem.o
	ln mpn/sizeinbase.o .libs/libgmp.lax/lt87-sizeinbase.o || cp mpn/sizeinbase.o .libs/libgmp.lax/lt87-sizeinbase.o
	ln mpn/get_str.o .libs/libgmp.lax/lt88-get_str.o || cp mpn/get_str.o .libs/libgmp.lax/lt88-get_str.o
	ln mpn/set_str.o .libs/libgmp.lax/lt89-set_str.o || cp mpn/set_str.o .libs/libgmp.lax/lt89-set_str.o
	ln mpn/scan0.o .libs/libgmp.lax/lt90-scan0.o || cp mpn/scan0.o .libs/libgmp.lax/lt90-scan0.o
	ln mpn/scan1.o .libs/libgmp.lax/lt91-scan1.o || cp mpn/scan1.o .libs/libgmp.lax/lt91-scan1.o
	ln mpn/popcount.o .libs/libgmp.lax/lt92-popcount.o || cp mpn/popcount.o .libs/libgmp.lax/lt92-popcount.o
	ln mpn/hamdist.o .libs/libgmp.lax/lt93-hamdist.o || cp mpn/hamdist.o .libs/libgmp.lax/lt93-hamdist.o
	ln mpn/cmp.o .libs/libgmp.lax/lt94-cmp.o || cp mpn/cmp.o .libs/libgmp.lax/lt94-cmp.o
	ln mpn/perfsqr.o .libs/libgmp.lax/lt95-perfsqr.o || cp mpn/perfsqr.o .libs/libgmp.lax/lt95-perfsqr.o
	ln mpn/perfpow.o .libs/libgmp.lax/lt96-perfpow.o || cp mpn/perfpow.o .libs/libgmp.lax/lt96-perfpow.o
	ln mpn/gcd.o .libs/libgmp.lax/lt97-gcd.o || cp mpn/gcd.o .libs/libgmp.lax/lt97-gcd.o
	ln mpn/gcdext.o .libs/libgmp.lax/lt98-gcdext.o || cp mpn/gcdext.o .libs/libgmp.lax/lt98-gcdext.o
	ln mpn/tdiv_qr.o .libs/libgmp.lax/lt99-tdiv_qr.o || cp mpn/tdiv_qr.o .libs/libgmp.lax/lt99-tdiv_qr.o
	ln mpn/jacobi.o .libs/libgmp.lax/lt100-jacobi.o || cp mpn/jacobi.o .libs/libgmp.lax/lt100-jacobi.o
	ln mpn/get_d.o .libs/libgmp.lax/lt101-get_d.o || cp mpn/get_d.o .libs/libgmp.lax/lt101-get_d.o
	ln mpn/invert.o .libs/libgmp.lax/lt102-invert.o || cp mpn/invert.o .libs/libgmp.lax/lt102-invert.o
	ln mpn/divexact.o .libs/libgmp.lax/lt103-divexact.o || cp mpn/divexact.o .libs/libgmp.lax/lt103-divexact.o
	ln mpn/powm.o .libs/libgmp.lax/lt104-powm.o || cp mpn/powm.o .libs/libgmp.lax/lt104-powm.o
	ln mpn/remove.o .libs/libgmp.lax/lt105-remove.o || cp mpn/remove.o .libs/libgmp.lax/lt105-remove.o


%.o: %.c
	$(GCC) -c $(CFLAGS) $< -o $@
