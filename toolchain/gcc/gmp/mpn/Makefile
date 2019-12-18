#2017-10-28,zhou.weiguo, Houshayu, Shunyi District, Beijing

#use following regex to generate this Makefile

#7,387s/^\t.*sed.*\n//g

#7,387s/^\s+/\t//g

include ../../make.def

OBJS=fib_table.o mp_bases.o add.o add_1.o add_n.o sub.o sub_1.o sub_n.o cnd_add_n.o cnd_sub_n.o cnd_swap.o neg.o com.o mul_1.o addmul_1.o submul_1.o add_err1_n.o add_err2_n.o add_err3_n.o sub_err1_n.o sub_err2_n.o sub_err3_n.o lshift.o rshift.o dive_1.o diveby3.o divis.o divrem.o divrem_1.o divrem_2.o fib2_ui.o mod_1.o mod_34lsub1.o mode1o.o pre_divrem_1.o pre_mod_1.o dump.o mod_1_1.o mod_1_2.o mod_1_3.o mod_1_4.o lshiftc.o mul.o mul_fft.o mul_n.o sqr.o mul_basecase.o sqr_basecase.o nussbaumer_mul.o mulmid_basecase.o toom42_mulmid.o mulmid_n.o mulmid.o random.o random2.o pow_1.o rootrem.o sqrtrem.o sizeinbase.o get_str.o set_str.o scan0.o scan1.o popcount.o hamdist.o cmp.o zero_p.o perfsqr.o perfpow.o gcd_1.o gcd.o gcdext_1.o gcdext.o gcd_subdiv_step.o gcdext_lehmer.o div_q.o tdiv_qr.o jacbase.o jacobi_2.o jacobi.o get_d.o matrix22_mul.o matrix22_mul1_inverse_vector.o hgcd_matrix.o hgcd2.o hgcd_step.o hgcd_reduce.o hgcd.o hgcd_appr.o hgcd2_jacobi.o hgcd_jacobi.o mullo_n.o mullo_basecase.o sqrlo.o sqrlo_basecase.o toom22_mul.o toom32_mul.o toom42_mul.o toom52_mul.o toom62_mul.o toom33_mul.o toom43_mul.o toom53_mul.o toom54_mul.o toom63_mul.o toom44_mul.o toom6h_mul.o toom6_sqr.o toom8h_mul.o toom8_sqr.o toom_couple_handling.o toom2_sqr.o toom3_sqr.o toom4_sqr.o toom_eval_dgr3_pm1.o toom_eval_dgr3_pm2.o toom_eval_pm1.o toom_eval_pm2.o toom_eval_pm2exp.o toom_eval_pm2rexp.o toom_interpolate_5pts.o toom_interpolate_6pts.o toom_interpolate_7pts.o toom_interpolate_8pts.o toom_interpolate_12pts.o toom_interpolate_16pts.o invertappr.o invert.o binvert.o mulmod_bnm1.o sqrmod_bnm1.o div_qr_1.o div_qr_1n_pi1.o div_qr_2.o div_qr_2n_pi1.o div_qr_2u_pi1.o sbpi1_div_q.o sbpi1_div_qr.o sbpi1_divappr_q.o dcpi1_div_q.o dcpi1_div_qr.o dcpi1_divappr_q.o mu_div_qr.o mu_divappr_q.o mu_div_q.o bdiv_q_1.o sbpi1_bdiv_q.o sbpi1_bdiv_qr.o dcpi1_bdiv_q.o dcpi1_bdiv_qr.o mu_bdiv_q.o mu_bdiv_qr.o bdiv_q.o bdiv_qr.o broot.o brootinv.o bsqrt.o bsqrtinv.o divexact.o bdiv_dbm1c.o redc_1.o redc_2.o redc_n.o powm.o powlo.o sec_powm.o sec_mul.o sec_sqr.o sec_div_qr.o sec_div_r.o sec_pi1_div_qr.o sec_pi1_div_r.o sec_add_1.o sec_sub_1.o sec_invert.o trialdiv.o remove.o and_n.o andn_n.o nand_n.o ior_n.o iorn_n.o nior_n.o xor_n.o xnor_n.o copyi.o copyd.o zero.o sec_tabselect.o comb_tables.o add_n_sub_n.o

all: step1 step2

step1:
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_fib_table -g -O2 -c fib_table.c -o fib_table.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mp_bases -g -O2 -c mp_bases.c -o mp_bases.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add -g -O2 -c add.c -o add.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add_1 -g -O2 -c add_1.c -o add_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add_n -g -O2 -c add_n.c -o add_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sub -g -O2 -c sub.c -o sub.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sub_1 -g -O2 -c sub_1.c -o sub_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sub_n -g -O2 -c sub_n.c -o sub_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_cnd_add_n -g -O2 -c cnd_add_n.c -o cnd_add_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_cnd_sub_n -g -O2 -c cnd_sub_n.c -o cnd_sub_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_cnd_swap -g -O2 -c cnd_swap.c -o cnd_swap.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_neg -g -O2 -c neg.c -o neg.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_com -g -O2 -c com.c -o com.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mul_1 -g -O2 -c mul_1.c -o mul_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_addmul_1 -g -O2 -c addmul_1.c -o addmul_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_submul_1 -g -O2 -c submul_1.c -o submul_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add_err1_n -g -O2 -c add_err1_n.c -o add_err1_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add_err2_n -g -O2 -c add_err2_n.c -o add_err2_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add_err3_n -g -O2 -c add_err3_n.c -o add_err3_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sub_err1_n -g -O2 -c sub_err1_n.c -o sub_err1_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sub_err2_n -g -O2 -c sub_err2_n.c -o sub_err2_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sub_err3_n -g -O2 -c sub_err3_n.c -o sub_err3_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_lshift -g -O2 -c lshift.c -o lshift.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_rshift -g -O2 -c rshift.c -o rshift.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dive_1 -g -O2 -c dive_1.c -o dive_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_diveby3 -g -O2 -c diveby3.c -o diveby3.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_divis -g -O2 -c divis.c -o divis.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_divrem -g -O2 -c divrem.c -o divrem.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_divrem_1 -g -O2 -c divrem_1.c -o divrem_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_divrem_2 -g -O2 -c divrem_2.c -o divrem_2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_fib2_ui -g -O2 -c fib2_ui.c -o fib2_ui.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mod_1 -g -O2 -c mod_1.c -o mod_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mod_34lsub1 -g -O2 -c mod_34lsub1.c -o mod_34lsub1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mode1o -g -O2 -c mode1o.c -o mode1o.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_pre_divrem_1 -g -O2 -c pre_divrem_1.c -o pre_divrem_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_pre_mod_1 -g -O2 -c pre_mod_1.c -o pre_mod_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dump -g -O2 -c dump.c -o dump.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mod_1_1 -g -O2 -c mod_1_1.c -o mod_1_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mod_1_2 -g -O2 -c mod_1_2.c -o mod_1_2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mod_1_3 -g -O2 -c mod_1_3.c -o mod_1_3.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mod_1_4 -g -O2 -c mod_1_4.c -o mod_1_4.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_lshiftc -g -O2 -c lshiftc.c -o lshiftc.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mul -g -O2 -c mul.c -o mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mul_fft -g -O2 -c mul_fft.c -o mul_fft.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mul_n -g -O2 -c mul_n.c -o mul_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sqr -g -O2 -c sqr.c -o sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mul_basecase -g -O2 -c mul_basecase.c -o mul_basecase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sqr_basecase -g -O2 -c sqr_basecase.c -o sqr_basecase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_nussbaumer_mul -g -O2 -c nussbaumer_mul.c -o nussbaumer_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mulmid_basecase -g -O2 -c mulmid_basecase.c -o mulmid_basecase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom42_mulmid -g -O2 -c toom42_mulmid.c -o toom42_mulmid.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mulmid_n -g -O2 -c mulmid_n.c -o mulmid_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mulmid -g -O2 -c mulmid.c -o mulmid.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_random -g -O2 -c random.c -o random.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_random2 -g -O2 -c random2.c -o random2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_pow_1 -g -O2 -c pow_1.c -o pow_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_rootrem -g -O2 -c rootrem.c -o rootrem.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sqrtrem -g -O2 -c sqrtrem.c -o sqrtrem.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sizeinbase -g -O2 -c sizeinbase.c -o sizeinbase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_get_str -g -O2 -c get_str.c -o get_str.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_set_str -g -O2 -c set_str.c -o set_str.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_scan0 -g -O2 -c scan0.c -o scan0.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_scan1 -g -O2 -c scan1.c -o scan1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_popcount -g -O2 -c popcount.c -o popcount.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hamdist -g -O2 -c hamdist.c -o hamdist.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_cmp -g -O2 -c cmp.c -o cmp.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_zero_p -g -O2 -c zero_p.c -o zero_p.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_perfsqr -g -O2 -c perfsqr.c -o perfsqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_perfpow -g -O2 -c perfpow.c -o perfpow.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_gcd_1 -g -O2 -c gcd_1.c -o gcd_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_gcd -g -O2 -c gcd.c -o gcd.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_gcdext_1 -g -O2 -c gcdext_1.c -o gcdext_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_gcdext -g -O2 -c gcdext.c -o gcdext.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_gcd_subdiv_step -g -O2 -c gcd_subdiv_step.c -o gcd_subdiv_step.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_gcdext_lehmer -g -O2 -c gcdext_lehmer.c -o gcdext_lehmer.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_div_q -g -O2 -c div_q.c -o div_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_tdiv_qr -g -O2 -c tdiv_qr.c -o tdiv_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_jacbase -g -O2 -c jacbase.c -o jacbase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_jacobi_2 -g -O2 -c jacobi_2.c -o jacobi_2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_jacobi -g -O2 -c jacobi.c -o jacobi.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_get_d -g -O2 -c get_d.c -o get_d.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_matrix22_mul -g -O2 -c matrix22_mul.c -o matrix22_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_matrix22_mul1_inverse_vector -g -O2 -c matrix22_mul1_inverse_vector.c -o matrix22_mul1_inverse_vector.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd_matrix -g -O2 -c hgcd_matrix.c -o hgcd_matrix.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd2 -g -O2 -c hgcd2.c -o hgcd2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd_step -g -O2 -c hgcd_step.c -o hgcd_step.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd_reduce -g -O2 -c hgcd_reduce.c -o hgcd_reduce.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd -g -O2 -c hgcd.c -o hgcd.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd_appr -g -O2 -c hgcd_appr.c -o hgcd_appr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd2_jacobi -g -O2 -c hgcd2_jacobi.c -o hgcd2_jacobi.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_hgcd_jacobi -g -O2 -c hgcd_jacobi.c -o hgcd_jacobi.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mullo_n -g -O2 -c mullo_n.c -o mullo_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mullo_basecase -g -O2 -c mullo_basecase.c -o mullo_basecase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sqrlo -g -O2 -c sqrlo.c -o sqrlo.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sqrlo_basecase -g -O2 -c sqrlo_basecase.c -o sqrlo_basecase.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom22_mul -g -O2 -c toom22_mul.c -o toom22_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom32_mul -g -O2 -c toom32_mul.c -o toom32_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom42_mul -g -O2 -c toom42_mul.c -o toom42_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom52_mul -g -O2 -c toom52_mul.c -o toom52_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom62_mul -g -O2 -c toom62_mul.c -o toom62_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom33_mul -g -O2 -c toom33_mul.c -o toom33_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom43_mul -g -O2 -c toom43_mul.c -o toom43_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom53_mul -g -O2 -c toom53_mul.c -o toom53_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom54_mul -g -O2 -c toom54_mul.c -o toom54_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom63_mul -g -O2 -c toom63_mul.c -o toom63_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom44_mul -g -O2 -c toom44_mul.c -o toom44_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom6h_mul -g -O2 -c toom6h_mul.c -o toom6h_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom6_sqr -g -O2 -c toom6_sqr.c -o toom6_sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom8h_mul -g -O2 -c toom8h_mul.c -o toom8h_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom8_sqr -g -O2 -c toom8_sqr.c -o toom8_sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_couple_handling -g -O2 -c toom_couple_handling.c -o toom_couple_handling.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom2_sqr -g -O2 -c toom2_sqr.c -o toom2_sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom3_sqr -g -O2 -c toom3_sqr.c -o toom3_sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom4_sqr -g -O2 -c toom4_sqr.c -o toom4_sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_eval_dgr3_pm1 -g -O2 -c toom_eval_dgr3_pm1.c -o toom_eval_dgr3_pm1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_eval_dgr3_pm2 -g -O2 -c toom_eval_dgr3_pm2.c -o toom_eval_dgr3_pm2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_eval_pm1 -g -O2 -c toom_eval_pm1.c -o toom_eval_pm1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_eval_pm2 -g -O2 -c toom_eval_pm2.c -o toom_eval_pm2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_eval_pm2exp -g -O2 -c toom_eval_pm2exp.c -o toom_eval_pm2exp.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_eval_pm2rexp -g -O2 -c toom_eval_pm2rexp.c -o toom_eval_pm2rexp.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_interpolate_5pts -g -O2 -c toom_interpolate_5pts.c -o toom_interpolate_5pts.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_interpolate_6pts -g -O2 -c toom_interpolate_6pts.c -o toom_interpolate_6pts.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_interpolate_7pts -g -O2 -c toom_interpolate_7pts.c -o toom_interpolate_7pts.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_interpolate_8pts -g -O2 -c toom_interpolate_8pts.c -o toom_interpolate_8pts.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_interpolate_12pts -g -O2 -c toom_interpolate_12pts.c -o toom_interpolate_12pts.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_toom_interpolate_16pts -g -O2 -c toom_interpolate_16pts.c -o toom_interpolate_16pts.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_invertappr -g -O2 -c invertappr.c -o invertappr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_invert -g -O2 -c invert.c -o invert.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_binvert -g -O2 -c binvert.c -o binvert.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mulmod_bnm1 -g -O2 -c mulmod_bnm1.c -o mulmod_bnm1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sqrmod_bnm1 -g -O2 -c sqrmod_bnm1.c -o sqrmod_bnm1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_div_qr_1 -g -O2 -c div_qr_1.c -o div_qr_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_div_qr_1n_pi1 -g -O2 -c div_qr_1n_pi1.c -o div_qr_1n_pi1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_div_qr_2 -g -O2 -c div_qr_2.c -o div_qr_2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_div_qr_2n_pi1 -g -O2 -c div_qr_2n_pi1.c -o div_qr_2n_pi1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_div_qr_2u_pi1 -g -O2 -c div_qr_2u_pi1.c -o div_qr_2u_pi1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sbpi1_div_q -g -O2 -c sbpi1_div_q.c -o sbpi1_div_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sbpi1_div_qr -g -O2 -c sbpi1_div_qr.c -o sbpi1_div_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sbpi1_divappr_q -g -O2 -c sbpi1_divappr_q.c -o sbpi1_divappr_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dcpi1_div_q -g -O2 -c dcpi1_div_q.c -o dcpi1_div_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dcpi1_div_qr -g -O2 -c dcpi1_div_qr.c -o dcpi1_div_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dcpi1_divappr_q -g -O2 -c dcpi1_divappr_q.c -o dcpi1_divappr_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mu_div_qr -g -O2 -c mu_div_qr.c -o mu_div_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mu_divappr_q -g -O2 -c mu_divappr_q.c -o mu_divappr_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mu_div_q -g -O2 -c mu_div_q.c -o mu_div_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_bdiv_q_1 -g -O2 -c bdiv_q_1.c -o bdiv_q_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sbpi1_bdiv_q -g -O2 -c sbpi1_bdiv_q.c -o sbpi1_bdiv_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sbpi1_bdiv_qr -g -O2 -c sbpi1_bdiv_qr.c -o sbpi1_bdiv_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dcpi1_bdiv_q -g -O2 -c dcpi1_bdiv_q.c -o dcpi1_bdiv_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_dcpi1_bdiv_qr -g -O2 -c dcpi1_bdiv_qr.c -o dcpi1_bdiv_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mu_bdiv_q -g -O2 -c mu_bdiv_q.c -o mu_bdiv_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_mu_bdiv_qr -g -O2 -c mu_bdiv_qr.c -o mu_bdiv_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_bdiv_q -g -O2 -c bdiv_q.c -o bdiv_q.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_bdiv_qr -g -O2 -c bdiv_qr.c -o bdiv_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_broot -g -O2 -c broot.c -o broot.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_brootinv -g -O2 -c brootinv.c -o brootinv.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_bsqrt -g -O2 -c bsqrt.c -o bsqrt.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_bsqrtinv -g -O2 -c bsqrtinv.c -o bsqrtinv.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_divexact -g -O2 -c divexact.c -o divexact.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_bdiv_dbm1c -g -O2 -c bdiv_dbm1c.c -o bdiv_dbm1c.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_redc_1 -g -O2 -c redc_1.c -o redc_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_redc_2 -g -O2 -c redc_2.c -o redc_2.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_redc_n -g -O2 -c redc_n.c -o redc_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_powm -g -O2 -c powm.c -o powm.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_powlo -g -O2 -c powlo.c -o powlo.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_powm -g -O2 -c sec_powm.c -o sec_powm.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_mul -g -O2 -c sec_mul.c -o sec_mul.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_sqr -g -O2 -c sec_sqr.c -o sec_sqr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_div_qr -g -O2 -c sec_div_qr.c -o sec_div_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_div_r -g -O2 -c sec_div_r.c -o sec_div_r.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_pi1_div_qr -g -O2 -c sec_pi1_div_qr.c -o sec_pi1_div_qr.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_pi1_div_r -g -O2 -c sec_pi1_div_r.c -o sec_pi1_div_r.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_add_1 -g -O2 -c sec_add_1.c -o sec_add_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_sub_1 -g -O2 -c sec_sub_1.c -o sec_sub_1.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_invert -g -O2 -c sec_invert.c -o sec_invert.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_trialdiv -g -O2 -c trialdiv.c -o trialdiv.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_remove -g -O2 -c remove.c -o remove.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_and_n -g -O2 -c and_n.c -o and_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_andn_n -g -O2 -c andn_n.c -o andn_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_nand_n -g -O2 -c nand_n.c -o nand_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_ior_n -g -O2 -c ior_n.c -o ior_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_iorn_n -g -O2 -c iorn_n.c -o iorn_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_nior_n -g -O2 -c nior_n.c -o nior_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_xor_n -g -O2 -c xor_n.c -o xor_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_xnor_n -g -O2 -c xnor_n.c -o xnor_n.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_copyi -g -O2 -c copyi.c -o copyi.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_copyd -g -O2 -c copyd.c -o copyd.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_zero -g -O2 -c zero.c -o zero.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_sec_tabselect -g -O2 -c sec_tabselect.c -o sec_tabselect.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_comb_tables -g -O2 -c comb_tables.c -o comb_tables.o
	$(GCC) $(CCFLAGS) -std=gnu99 -DHAVE_CONFIG_H -I. -I/../..//gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/../..//gmp -DOPERATION_add_n_sub_n -g -O2 -c add_n_sub_n.c -o add_n_sub_n.o

step2:
	$(AR) libmpn.a  fib_table.o mp_bases.o add.o add_1.o add_n.o sub.o sub_1.o sub_n.o cnd_add_n.o cnd_sub_n.o cnd_swap.o neg.o com.o mul_1.o addmul_1.o submul_1.o add_err1_n.o add_err2_n.o add_err3_n.o sub_err1_n.o sub_err2_n.o sub_err3_n.o lshift.o rshift.o dive_1.o diveby3.o divis.o divrem.o divrem_1.o divrem_2.o fib2_ui.o mod_1.o mod_34lsub1.o mode1o.o pre_divrem_1.o pre_mod_1.o dump.o mod_1_1.o mod_1_2.o mod_1_3.o mod_1_4.o lshiftc.o mul.o mul_fft.o mul_n.o sqr.o mul_basecase.o sqr_basecase.o nussbaumer_mul.o mulmid_basecase.o toom42_mulmid.o mulmid_n.o mulmid.o random.o random2.o pow_1.o rootrem.o sqrtrem.o sizeinbase.o get_str.o set_str.o scan0.o scan1.o popcount.o hamdist.o cmp.o zero_p.o perfsqr.o perfpow.o gcd_1.o gcd.o gcdext_1.o gcdext.o gcd_subdiv_step.o gcdext_lehmer.o div_q.o tdiv_qr.o jacbase.o jacobi_2.o jacobi.o get_d.o matrix22_mul.o matrix22_mul1_inverse_vector.o hgcd_matrix.o hgcd2.o hgcd_step.o hgcd_reduce.o hgcd.o hgcd_appr.o hgcd2_jacobi.o hgcd_jacobi.o mullo_n.o mullo_basecase.o sqrlo.o sqrlo_basecase.o toom22_mul.o toom32_mul.o toom42_mul.o toom52_mul.o toom62_mul.o toom33_mul.o toom43_mul.o toom53_mul.o toom54_mul.o toom63_mul.o toom44_mul.o toom6h_mul.o toom6_sqr.o toom8h_mul.o toom8_sqr.o toom_couple_handling.o toom2_sqr.o toom3_sqr.o toom4_sqr.o toom_eval_dgr3_pm1.o toom_eval_dgr3_pm2.o toom_eval_pm1.o toom_eval_pm2.o toom_eval_pm2exp.o toom_eval_pm2rexp.o toom_interpolate_5pts.o toom_interpolate_6pts.o toom_interpolate_7pts.o toom_interpolate_8pts.o toom_interpolate_12pts.o toom_interpolate_16pts.o invertappr.o invert.o binvert.o mulmod_bnm1.o sqrmod_bnm1.o div_qr_1.o div_qr_1n_pi1.o div_qr_2.o div_qr_2n_pi1.o div_qr_2u_pi1.o sbpi1_div_q.o sbpi1_div_qr.o sbpi1_divappr_q.o dcpi1_div_q.o dcpi1_div_qr.o dcpi1_divappr_q.o mu_div_qr.o mu_divappr_q.o mu_div_q.o bdiv_q_1.o sbpi1_bdiv_q.o sbpi1_bdiv_qr.o dcpi1_bdiv_q.o dcpi1_bdiv_qr.o mu_bdiv_q.o mu_bdiv_qr.o bdiv_q.o bdiv_qr.o broot.o brootinv.o bsqrt.o bsqrtinv.o divexact.o bdiv_dbm1c.o redc_1.o redc_2.o redc_n.o powm.o powlo.o sec_powm.o sec_mul.o sec_sqr.o sec_div_qr.o sec_div_r.o sec_pi1_div_qr.o sec_pi1_div_r.o sec_add_1.o sec_sub_1.o sec_invert.o trialdiv.o remove.o and_n.o andn_n.o nand_n.o ior_n.o iorn_n.o nior_n.o xor_n.o xnor_n.o copyi.o copyd.o zero.o sec_tabselect.o comb_tables.o add_n_sub_n.o
	ranlib libmpn.a

clean:
	rm -f *.o
	rm -f libmpn.a
