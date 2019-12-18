#!/bin/sh
#make[2]: Entering directory `/android/build/gmp/mpn'
cd mpn
gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo fib_table | sed 's/_$//'`   -g -O2 -c -o fib_table.lo fib_table.c
gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_fib_table -g -O2 -c fib_table.c -o fib_table.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mp_bases | sed 's/_$//'`   -g -O2 -c -o mp_bases.lo mp_bases.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mp_bases -g -O2 -c mp_bases.c -o mp_bases.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add | sed 's/_$//'`   -g -O2 -c -o add.lo add.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add -g -O2 -c add.c -o add.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add_1 | sed 's/_$//'`   -g -O2 -c -o add_1.lo add_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add_1 -g -O2 -c add_1.c -o add_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add_n | sed 's/_$//'`   -g -O2 -c -o add_n.lo add_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add_n -g -O2 -c add_n.c -o add_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sub | sed 's/_$//'`   -g -O2 -c -o sub.lo sub.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sub -g -O2 -c sub.c -o sub.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sub_1 | sed 's/_$//'`   -g -O2 -c -o sub_1.lo sub_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sub_1 -g -O2 -c sub_1.c -o sub_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sub_n | sed 's/_$//'`   -g -O2 -c -o sub_n.lo sub_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sub_n -g -O2 -c sub_n.c -o sub_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo cnd_add_n | sed 's/_$//'`   -g -O2 -c -o cnd_add_n.lo cnd_add_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_cnd_add_n -g -O2 -c cnd_add_n.c -o cnd_add_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo cnd_sub_n | sed 's/_$//'`   -g -O2 -c -o cnd_sub_n.lo cnd_sub_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_cnd_sub_n -g -O2 -c cnd_sub_n.c -o cnd_sub_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo cnd_swap | sed 's/_$//'`   -g -O2 -c -o cnd_swap.lo cnd_swap.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_cnd_swap -g -O2 -c cnd_swap.c -o cnd_swap.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo neg | sed 's/_$//'`   -g -O2 -c -o neg.lo neg.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_neg -g -O2 -c neg.c -o neg.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo com | sed 's/_$//'`   -g -O2 -c -o com.lo com.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_com -g -O2 -c com.c -o com.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mul_1 | sed 's/_$//'`   -g -O2 -c -o mul_1.lo mul_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mul_1 -g -O2 -c mul_1.c -o mul_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo addmul_1 | sed 's/_$//'`   -g -O2 -c -o addmul_1.lo addmul_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_addmul_1 -g -O2 -c addmul_1.c -o addmul_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo submul_1 | sed 's/_$//'`   -g -O2 -c -o submul_1.lo submul_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_submul_1 -g -O2 -c submul_1.c -o submul_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add_err1_n | sed 's/_$//'`   -g -O2 -c -o add_err1_n.lo add_err1_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add_err1_n -g -O2 -c add_err1_n.c -o add_err1_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add_err2_n | sed 's/_$//'`   -g -O2 -c -o add_err2_n.lo add_err2_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add_err2_n -g -O2 -c add_err2_n.c -o add_err2_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add_err3_n | sed 's/_$//'`   -g -O2 -c -o add_err3_n.lo add_err3_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add_err3_n -g -O2 -c add_err3_n.c -o add_err3_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sub_err1_n | sed 's/_$//'`   -g -O2 -c -o sub_err1_n.lo sub_err1_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sub_err1_n -g -O2 -c sub_err1_n.c -o sub_err1_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sub_err2_n | sed 's/_$//'`   -g -O2 -c -o sub_err2_n.lo sub_err2_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sub_err2_n -g -O2 -c sub_err2_n.c -o sub_err2_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sub_err3_n | sed 's/_$//'`   -g -O2 -c -o sub_err3_n.lo sub_err3_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sub_err3_n -g -O2 -c sub_err3_n.c -o sub_err3_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo lshift | sed 's/_$//'`   -g -O2 -c -o lshift.lo lshift.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_lshift -g -O2 -c lshift.c -o lshift.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo rshift | sed 's/_$//'`   -g -O2 -c -o rshift.lo rshift.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_rshift -g -O2 -c rshift.c -o rshift.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dive_1 | sed 's/_$//'`   -g -O2 -c -o dive_1.lo dive_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dive_1 -g -O2 -c dive_1.c -o dive_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo diveby3 | sed 's/_$//'`   -g -O2 -c -o diveby3.lo diveby3.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_diveby3 -g -O2 -c diveby3.c -o diveby3.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo divis | sed 's/_$//'`   -g -O2 -c -o divis.lo divis.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_divis -g -O2 -c divis.c -o divis.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo divrem | sed 's/_$//'`   -g -O2 -c -o divrem.lo divrem.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_divrem -g -O2 -c divrem.c -o divrem.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo divrem_1 | sed 's/_$//'`   -g -O2 -c -o divrem_1.lo divrem_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_divrem_1 -g -O2 -c divrem_1.c -o divrem_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo divrem_2 | sed 's/_$//'`   -g -O2 -c -o divrem_2.lo divrem_2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_divrem_2 -g -O2 -c divrem_2.c -o divrem_2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo fib2_ui | sed 's/_$//'`   -g -O2 -c -o fib2_ui.lo fib2_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_fib2_ui -g -O2 -c fib2_ui.c -o fib2_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mod_1 | sed 's/_$//'`   -g -O2 -c -o mod_1.lo mod_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mod_1 -g -O2 -c mod_1.c -o mod_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mod_34lsub1 | sed 's/_$//'`   -g -O2 -c -o mod_34lsub1.lo mod_34lsub1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mod_34lsub1 -g -O2 -c mod_34lsub1.c -o mod_34lsub1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mode1o | sed 's/_$//'`   -g -O2 -c -o mode1o.lo mode1o.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mode1o -g -O2 -c mode1o.c -o mode1o.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo pre_divrem_1 | sed 's/_$//'`   -g -O2 -c -o pre_divrem_1.lo pre_divrem_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_pre_divrem_1 -g -O2 -c pre_divrem_1.c -o pre_divrem_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo pre_mod_1 | sed 's/_$//'`   -g -O2 -c -o pre_mod_1.lo pre_mod_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_pre_mod_1 -g -O2 -c pre_mod_1.c -o pre_mod_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dump | sed 's/_$//'`   -g -O2 -c -o dump.lo dump.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dump -g -O2 -c dump.c -o dump.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mod_1_1 | sed 's/_$//'`   -g -O2 -c -o mod_1_1.lo mod_1_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mod_1_1 -g -O2 -c mod_1_1.c -o mod_1_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mod_1_2 | sed 's/_$//'`   -g -O2 -c -o mod_1_2.lo mod_1_2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mod_1_2 -g -O2 -c mod_1_2.c -o mod_1_2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mod_1_3 | sed 's/_$//'`   -g -O2 -c -o mod_1_3.lo mod_1_3.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mod_1_3 -g -O2 -c mod_1_3.c -o mod_1_3.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mod_1_4 | sed 's/_$//'`   -g -O2 -c -o mod_1_4.lo mod_1_4.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mod_1_4 -g -O2 -c mod_1_4.c -o mod_1_4.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo lshiftc | sed 's/_$//'`   -g -O2 -c -o lshiftc.lo lshiftc.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_lshiftc -g -O2 -c lshiftc.c -o lshiftc.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mul | sed 's/_$//'`   -g -O2 -c -o mul.lo mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mul -g -O2 -c mul.c -o mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mul_fft | sed 's/_$//'`   -g -O2 -c -o mul_fft.lo mul_fft.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mul_fft -g -O2 -c mul_fft.c -o mul_fft.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mul_n | sed 's/_$//'`   -g -O2 -c -o mul_n.lo mul_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mul_n -g -O2 -c mul_n.c -o mul_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sqr | sed 's/_$//'`   -g -O2 -c -o sqr.lo sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sqr -g -O2 -c sqr.c -o sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mul_basecase | sed 's/_$//'`   -g -O2 -c -o mul_basecase.lo mul_basecase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mul_basecase -g -O2 -c mul_basecase.c -o mul_basecase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sqr_basecase | sed 's/_$//'`   -g -O2 -c -o sqr_basecase.lo sqr_basecase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sqr_basecase -g -O2 -c sqr_basecase.c -o sqr_basecase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo nussbaumer_mul | sed 's/_$//'`   -g -O2 -c -o nussbaumer_mul.lo nussbaumer_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_nussbaumer_mul -g -O2 -c nussbaumer_mul.c -o nussbaumer_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mulmid_basecase | sed 's/_$//'`   -g -O2 -c -o mulmid_basecase.lo mulmid_basecase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mulmid_basecase -g -O2 -c mulmid_basecase.c -o mulmid_basecase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom42_mulmid | sed 's/_$//'`   -g -O2 -c -o toom42_mulmid.lo toom42_mulmid.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom42_mulmid -g -O2 -c toom42_mulmid.c -o toom42_mulmid.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mulmid_n | sed 's/_$//'`   -g -O2 -c -o mulmid_n.lo mulmid_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mulmid_n -g -O2 -c mulmid_n.c -o mulmid_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mulmid | sed 's/_$//'`   -g -O2 -c -o mulmid.lo mulmid.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mulmid -g -O2 -c mulmid.c -o mulmid.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo random | sed 's/_$//'`   -g -O2 -c -o random.lo random.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_random -g -O2 -c random.c -o random.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo random2 | sed 's/_$//'`   -g -O2 -c -o random2.lo random2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_random2 -g -O2 -c random2.c -o random2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo pow_1 | sed 's/_$//'`   -g -O2 -c -o pow_1.lo pow_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_pow_1 -g -O2 -c pow_1.c -o pow_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo rootrem | sed 's/_$//'`   -g -O2 -c -o rootrem.lo rootrem.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_rootrem -g -O2 -c rootrem.c -o rootrem.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sqrtrem | sed 's/_$//'`   -g -O2 -c -o sqrtrem.lo sqrtrem.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sqrtrem -g -O2 -c sqrtrem.c -o sqrtrem.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sizeinbase | sed 's/_$//'`   -g -O2 -c -o sizeinbase.lo sizeinbase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sizeinbase -g -O2 -c sizeinbase.c -o sizeinbase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo get_str | sed 's/_$//'`   -g -O2 -c -o get_str.lo get_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_get_str -g -O2 -c get_str.c -o get_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo set_str | sed 's/_$//'`   -g -O2 -c -o set_str.lo set_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_set_str -g -O2 -c set_str.c -o set_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo scan0 | sed 's/_$//'`   -g -O2 -c -o scan0.lo scan0.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_scan0 -g -O2 -c scan0.c -o scan0.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo scan1 | sed 's/_$//'`   -g -O2 -c -o scan1.lo scan1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_scan1 -g -O2 -c scan1.c -o scan1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo popcount | sed 's/_$//'`   -g -O2 -c -o popcount.lo popcount.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_popcount -g -O2 -c popcount.c -o popcount.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hamdist | sed 's/_$//'`   -g -O2 -c -o hamdist.lo hamdist.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hamdist -g -O2 -c hamdist.c -o hamdist.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo cmp | sed 's/_$//'`   -g -O2 -c -o cmp.lo cmp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_cmp -g -O2 -c cmp.c -o cmp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo zero_p | sed 's/_$//'`   -g -O2 -c -o zero_p.lo zero_p.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_zero_p -g -O2 -c zero_p.c -o zero_p.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo perfsqr | sed 's/_$//'`   -g -O2 -c -o perfsqr.lo perfsqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_perfsqr -g -O2 -c perfsqr.c -o perfsqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo perfpow | sed 's/_$//'`   -g -O2 -c -o perfpow.lo perfpow.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_perfpow -g -O2 -c perfpow.c -o perfpow.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo gcd_1 | sed 's/_$//'`   -g -O2 -c -o gcd_1.lo gcd_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_gcd_1 -g -O2 -c gcd_1.c -o gcd_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo gcd | sed 's/_$//'`   -g -O2 -c -o gcd.lo gcd.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_gcd -g -O2 -c gcd.c -o gcd.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo gcdext_1 | sed 's/_$//'`   -g -O2 -c -o gcdext_1.lo gcdext_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_gcdext_1 -g -O2 -c gcdext_1.c -o gcdext_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo gcdext | sed 's/_$//'`   -g -O2 -c -o gcdext.lo gcdext.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_gcdext -g -O2 -c gcdext.c -o gcdext.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo gcd_subdiv_step | sed 's/_$//'`   -g -O2 -c -o gcd_subdiv_step.lo gcd_subdiv_step.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_gcd_subdiv_step -g -O2 -c gcd_subdiv_step.c -o gcd_subdiv_step.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo gcdext_lehmer | sed 's/_$//'`   -g -O2 -c -o gcdext_lehmer.lo gcdext_lehmer.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_gcdext_lehmer -g -O2 -c gcdext_lehmer.c -o gcdext_lehmer.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo div_q | sed 's/_$//'`   -g -O2 -c -o div_q.lo div_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_div_q -g -O2 -c div_q.c -o div_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo tdiv_qr | sed 's/_$//'`   -g -O2 -c -o tdiv_qr.lo tdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_tdiv_qr -g -O2 -c tdiv_qr.c -o tdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo jacbase | sed 's/_$//'`   -g -O2 -c -o jacbase.lo jacbase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_jacbase -g -O2 -c jacbase.c -o jacbase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo jacobi_2 | sed 's/_$//'`   -g -O2 -c -o jacobi_2.lo jacobi_2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_jacobi_2 -g -O2 -c jacobi_2.c -o jacobi_2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo jacobi | sed 's/_$//'`   -g -O2 -c -o jacobi.lo jacobi.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_jacobi -g -O2 -c jacobi.c -o jacobi.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo get_d | sed 's/_$//'`   -g -O2 -c -o get_d.lo get_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_get_d -g -O2 -c get_d.c -o get_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo matrix22_mul | sed 's/_$//'`   -g -O2 -c -o matrix22_mul.lo matrix22_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_matrix22_mul -g -O2 -c matrix22_mul.c -o matrix22_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo matrix22_mul1_inverse_vector | sed 's/_$//'`   -g -O2 -c -o matrix22_mul1_inverse_vector.lo matrix22_mul1_inverse_vector.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_matrix22_mul1_inverse_vector -g -O2 -c matrix22_mul1_inverse_vector.c -o matrix22_mul1_inverse_vector.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd_matrix | sed 's/_$//'`   -g -O2 -c -o hgcd_matrix.lo hgcd_matrix.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd_matrix -g -O2 -c hgcd_matrix.c -o hgcd_matrix.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd2 | sed 's/_$//'`   -g -O2 -c -o hgcd2.lo hgcd2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd2 -g -O2 -c hgcd2.c -o hgcd2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd_step | sed 's/_$//'`   -g -O2 -c -o hgcd_step.lo hgcd_step.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd_step -g -O2 -c hgcd_step.c -o hgcd_step.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd_reduce | sed 's/_$//'`   -g -O2 -c -o hgcd_reduce.lo hgcd_reduce.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd_reduce -g -O2 -c hgcd_reduce.c -o hgcd_reduce.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd | sed 's/_$//'`   -g -O2 -c -o hgcd.lo hgcd.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd -g -O2 -c hgcd.c -o hgcd.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd_appr | sed 's/_$//'`   -g -O2 -c -o hgcd_appr.lo hgcd_appr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd_appr -g -O2 -c hgcd_appr.c -o hgcd_appr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd2_jacobi | sed 's/_$//'`   -g -O2 -c -o hgcd2_jacobi.lo hgcd2_jacobi.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd2_jacobi -g -O2 -c hgcd2_jacobi.c -o hgcd2_jacobi.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo hgcd_jacobi | sed 's/_$//'`   -g -O2 -c -o hgcd_jacobi.lo hgcd_jacobi.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_hgcd_jacobi -g -O2 -c hgcd_jacobi.c -o hgcd_jacobi.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mullo_n | sed 's/_$//'`   -g -O2 -c -o mullo_n.lo mullo_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mullo_n -g -O2 -c mullo_n.c -o mullo_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mullo_basecase | sed 's/_$//'`   -g -O2 -c -o mullo_basecase.lo mullo_basecase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mullo_basecase -g -O2 -c mullo_basecase.c -o mullo_basecase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sqrlo | sed 's/_$//'`   -g -O2 -c -o sqrlo.lo sqrlo.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sqrlo -g -O2 -c sqrlo.c -o sqrlo.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sqrlo_basecase | sed 's/_$//'`   -g -O2 -c -o sqrlo_basecase.lo sqrlo_basecase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sqrlo_basecase -g -O2 -c sqrlo_basecase.c -o sqrlo_basecase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom22_mul | sed 's/_$//'`   -g -O2 -c -o toom22_mul.lo toom22_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom22_mul -g -O2 -c toom22_mul.c -o toom22_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom32_mul | sed 's/_$//'`   -g -O2 -c -o toom32_mul.lo toom32_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom32_mul -g -O2 -c toom32_mul.c -o toom32_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom42_mul | sed 's/_$//'`   -g -O2 -c -o toom42_mul.lo toom42_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom42_mul -g -O2 -c toom42_mul.c -o toom42_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom52_mul | sed 's/_$//'`   -g -O2 -c -o toom52_mul.lo toom52_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom52_mul -g -O2 -c toom52_mul.c -o toom52_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom62_mul | sed 's/_$//'`   -g -O2 -c -o toom62_mul.lo toom62_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom62_mul -g -O2 -c toom62_mul.c -o toom62_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom33_mul | sed 's/_$//'`   -g -O2 -c -o toom33_mul.lo toom33_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom33_mul -g -O2 -c toom33_mul.c -o toom33_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom43_mul | sed 's/_$//'`   -g -O2 -c -o toom43_mul.lo toom43_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom43_mul -g -O2 -c toom43_mul.c -o toom43_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom53_mul | sed 's/_$//'`   -g -O2 -c -o toom53_mul.lo toom53_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom53_mul -g -O2 -c toom53_mul.c -o toom53_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom54_mul | sed 's/_$//'`   -g -O2 -c -o toom54_mul.lo toom54_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom54_mul -g -O2 -c toom54_mul.c -o toom54_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom63_mul | sed 's/_$//'`   -g -O2 -c -o toom63_mul.lo toom63_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom63_mul -g -O2 -c toom63_mul.c -o toom63_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom44_mul | sed 's/_$//'`   -g -O2 -c -o toom44_mul.lo toom44_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom44_mul -g -O2 -c toom44_mul.c -o toom44_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom6h_mul | sed 's/_$//'`   -g -O2 -c -o toom6h_mul.lo toom6h_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom6h_mul -g -O2 -c toom6h_mul.c -o toom6h_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom6_sqr | sed 's/_$//'`   -g -O2 -c -o toom6_sqr.lo toom6_sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom6_sqr -g -O2 -c toom6_sqr.c -o toom6_sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom8h_mul | sed 's/_$//'`   -g -O2 -c -o toom8h_mul.lo toom8h_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom8h_mul -g -O2 -c toom8h_mul.c -o toom8h_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom8_sqr | sed 's/_$//'`   -g -O2 -c -o toom8_sqr.lo toom8_sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom8_sqr -g -O2 -c toom8_sqr.c -o toom8_sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_couple_handling | sed 's/_$//'`   -g -O2 -c -o toom_couple_handling.lo toom_couple_handling.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_couple_handling -g -O2 -c toom_couple_handling.c -o toom_couple_handling.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom2_sqr | sed 's/_$//'`   -g -O2 -c -o toom2_sqr.lo toom2_sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom2_sqr -g -O2 -c toom2_sqr.c -o toom2_sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom3_sqr | sed 's/_$//'`   -g -O2 -c -o toom3_sqr.lo toom3_sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom3_sqr -g -O2 -c toom3_sqr.c -o toom3_sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom4_sqr | sed 's/_$//'`   -g -O2 -c -o toom4_sqr.lo toom4_sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom4_sqr -g -O2 -c toom4_sqr.c -o toom4_sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_eval_dgr3_pm1 | sed 's/_$//'`   -g -O2 -c -o toom_eval_dgr3_pm1.lo toom_eval_dgr3_pm1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_eval_dgr3_pm1 -g -O2 -c toom_eval_dgr3_pm1.c -o toom_eval_dgr3_pm1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_eval_dgr3_pm2 | sed 's/_$//'`   -g -O2 -c -o toom_eval_dgr3_pm2.lo toom_eval_dgr3_pm2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_eval_dgr3_pm2 -g -O2 -c toom_eval_dgr3_pm2.c -o toom_eval_dgr3_pm2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_eval_pm1 | sed 's/_$//'`   -g -O2 -c -o toom_eval_pm1.lo toom_eval_pm1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_eval_pm1 -g -O2 -c toom_eval_pm1.c -o toom_eval_pm1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_eval_pm2 | sed 's/_$//'`   -g -O2 -c -o toom_eval_pm2.lo toom_eval_pm2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_eval_pm2 -g -O2 -c toom_eval_pm2.c -o toom_eval_pm2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_eval_pm2exp | sed 's/_$//'`   -g -O2 -c -o toom_eval_pm2exp.lo toom_eval_pm2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_eval_pm2exp -g -O2 -c toom_eval_pm2exp.c -o toom_eval_pm2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_eval_pm2rexp | sed 's/_$//'`   -g -O2 -c -o toom_eval_pm2rexp.lo toom_eval_pm2rexp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_eval_pm2rexp -g -O2 -c toom_eval_pm2rexp.c -o toom_eval_pm2rexp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_interpolate_5pts | sed 's/_$//'`   -g -O2 -c -o toom_interpolate_5pts.lo toom_interpolate_5pts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_interpolate_5pts -g -O2 -c toom_interpolate_5pts.c -o toom_interpolate_5pts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_interpolate_6pts | sed 's/_$//'`   -g -O2 -c -o toom_interpolate_6pts.lo toom_interpolate_6pts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_interpolate_6pts -g -O2 -c toom_interpolate_6pts.c -o toom_interpolate_6pts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_interpolate_7pts | sed 's/_$//'`   -g -O2 -c -o toom_interpolate_7pts.lo toom_interpolate_7pts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_interpolate_7pts -g -O2 -c toom_interpolate_7pts.c -o toom_interpolate_7pts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_interpolate_8pts | sed 's/_$//'`   -g -O2 -c -o toom_interpolate_8pts.lo toom_interpolate_8pts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_interpolate_8pts -g -O2 -c toom_interpolate_8pts.c -o toom_interpolate_8pts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_interpolate_12pts | sed 's/_$//'`   -g -O2 -c -o toom_interpolate_12pts.lo toom_interpolate_12pts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_interpolate_12pts -g -O2 -c toom_interpolate_12pts.c -o toom_interpolate_12pts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo toom_interpolate_16pts | sed 's/_$//'`   -g -O2 -c -o toom_interpolate_16pts.lo toom_interpolate_16pts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_toom_interpolate_16pts -g -O2 -c toom_interpolate_16pts.c -o toom_interpolate_16pts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo invertappr | sed 's/_$//'`   -g -O2 -c -o invertappr.lo invertappr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_invertappr -g -O2 -c invertappr.c -o invertappr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo invert | sed 's/_$//'`   -g -O2 -c -o invert.lo invert.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_invert -g -O2 -c invert.c -o invert.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo binvert | sed 's/_$//'`   -g -O2 -c -o binvert.lo binvert.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_binvert -g -O2 -c binvert.c -o binvert.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mulmod_bnm1 | sed 's/_$//'`   -g -O2 -c -o mulmod_bnm1.lo mulmod_bnm1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mulmod_bnm1 -g -O2 -c mulmod_bnm1.c -o mulmod_bnm1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sqrmod_bnm1 | sed 's/_$//'`   -g -O2 -c -o sqrmod_bnm1.lo sqrmod_bnm1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sqrmod_bnm1 -g -O2 -c sqrmod_bnm1.c -o sqrmod_bnm1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo div_qr_1 | sed 's/_$//'`   -g -O2 -c -o div_qr_1.lo div_qr_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_div_qr_1 -g -O2 -c div_qr_1.c -o div_qr_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo div_qr_1n_pi1 | sed 's/_$//'`   -g -O2 -c -o div_qr_1n_pi1.lo div_qr_1n_pi1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_div_qr_1n_pi1 -g -O2 -c div_qr_1n_pi1.c -o div_qr_1n_pi1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo div_qr_2 | sed 's/_$//'`   -g -O2 -c -o div_qr_2.lo div_qr_2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_div_qr_2 -g -O2 -c div_qr_2.c -o div_qr_2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo div_qr_2n_pi1 | sed 's/_$//'`   -g -O2 -c -o div_qr_2n_pi1.lo div_qr_2n_pi1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_div_qr_2n_pi1 -g -O2 -c div_qr_2n_pi1.c -o div_qr_2n_pi1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo div_qr_2u_pi1 | sed 's/_$//'`   -g -O2 -c -o div_qr_2u_pi1.lo div_qr_2u_pi1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_div_qr_2u_pi1 -g -O2 -c div_qr_2u_pi1.c -o div_qr_2u_pi1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sbpi1_div_q | sed 's/_$//'`   -g -O2 -c -o sbpi1_div_q.lo sbpi1_div_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sbpi1_div_q -g -O2 -c sbpi1_div_q.c -o sbpi1_div_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sbpi1_div_qr | sed 's/_$//'`   -g -O2 -c -o sbpi1_div_qr.lo sbpi1_div_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sbpi1_div_qr -g -O2 -c sbpi1_div_qr.c -o sbpi1_div_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sbpi1_divappr_q | sed 's/_$//'`   -g -O2 -c -o sbpi1_divappr_q.lo sbpi1_divappr_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sbpi1_divappr_q -g -O2 -c sbpi1_divappr_q.c -o sbpi1_divappr_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dcpi1_div_q | sed 's/_$//'`   -g -O2 -c -o dcpi1_div_q.lo dcpi1_div_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dcpi1_div_q -g -O2 -c dcpi1_div_q.c -o dcpi1_div_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dcpi1_div_qr | sed 's/_$//'`   -g -O2 -c -o dcpi1_div_qr.lo dcpi1_div_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dcpi1_div_qr -g -O2 -c dcpi1_div_qr.c -o dcpi1_div_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dcpi1_divappr_q | sed 's/_$//'`   -g -O2 -c -o dcpi1_divappr_q.lo dcpi1_divappr_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dcpi1_divappr_q -g -O2 -c dcpi1_divappr_q.c -o dcpi1_divappr_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mu_div_qr | sed 's/_$//'`   -g -O2 -c -o mu_div_qr.lo mu_div_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mu_div_qr -g -O2 -c mu_div_qr.c -o mu_div_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mu_divappr_q | sed 's/_$//'`   -g -O2 -c -o mu_divappr_q.lo mu_divappr_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mu_divappr_q -g -O2 -c mu_divappr_q.c -o mu_divappr_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mu_div_q | sed 's/_$//'`   -g -O2 -c -o mu_div_q.lo mu_div_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mu_div_q -g -O2 -c mu_div_q.c -o mu_div_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo bdiv_q_1 | sed 's/_$//'`   -g -O2 -c -o bdiv_q_1.lo bdiv_q_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_bdiv_q_1 -g -O2 -c bdiv_q_1.c -o bdiv_q_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sbpi1_bdiv_q | sed 's/_$//'`   -g -O2 -c -o sbpi1_bdiv_q.lo sbpi1_bdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sbpi1_bdiv_q -g -O2 -c sbpi1_bdiv_q.c -o sbpi1_bdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sbpi1_bdiv_qr | sed 's/_$//'`   -g -O2 -c -o sbpi1_bdiv_qr.lo sbpi1_bdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sbpi1_bdiv_qr -g -O2 -c sbpi1_bdiv_qr.c -o sbpi1_bdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dcpi1_bdiv_q | sed 's/_$//'`   -g -O2 -c -o dcpi1_bdiv_q.lo dcpi1_bdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dcpi1_bdiv_q -g -O2 -c dcpi1_bdiv_q.c -o dcpi1_bdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo dcpi1_bdiv_qr | sed 's/_$//'`   -g -O2 -c -o dcpi1_bdiv_qr.lo dcpi1_bdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_dcpi1_bdiv_qr -g -O2 -c dcpi1_bdiv_qr.c -o dcpi1_bdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mu_bdiv_q | sed 's/_$//'`   -g -O2 -c -o mu_bdiv_q.lo mu_bdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mu_bdiv_q -g -O2 -c mu_bdiv_q.c -o mu_bdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo mu_bdiv_qr | sed 's/_$//'`   -g -O2 -c -o mu_bdiv_qr.lo mu_bdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_mu_bdiv_qr -g -O2 -c mu_bdiv_qr.c -o mu_bdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo bdiv_q | sed 's/_$//'`   -g -O2 -c -o bdiv_q.lo bdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_bdiv_q -g -O2 -c bdiv_q.c -o bdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo bdiv_qr | sed 's/_$//'`   -g -O2 -c -o bdiv_qr.lo bdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_bdiv_qr -g -O2 -c bdiv_qr.c -o bdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo broot | sed 's/_$//'`   -g -O2 -c -o broot.lo broot.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_broot -g -O2 -c broot.c -o broot.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo brootinv | sed 's/_$//'`   -g -O2 -c -o brootinv.lo brootinv.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_brootinv -g -O2 -c brootinv.c -o brootinv.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo bsqrt | sed 's/_$//'`   -g -O2 -c -o bsqrt.lo bsqrt.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_bsqrt -g -O2 -c bsqrt.c -o bsqrt.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo bsqrtinv | sed 's/_$//'`   -g -O2 -c -o bsqrtinv.lo bsqrtinv.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_bsqrtinv -g -O2 -c bsqrtinv.c -o bsqrtinv.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo divexact | sed 's/_$//'`   -g -O2 -c -o divexact.lo divexact.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_divexact -g -O2 -c divexact.c -o divexact.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo bdiv_dbm1c | sed 's/_$//'`   -g -O2 -c -o bdiv_dbm1c.lo bdiv_dbm1c.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_bdiv_dbm1c -g -O2 -c bdiv_dbm1c.c -o bdiv_dbm1c.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo redc_1 | sed 's/_$//'`   -g -O2 -c -o redc_1.lo redc_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_redc_1 -g -O2 -c redc_1.c -o redc_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo redc_2 | sed 's/_$//'`   -g -O2 -c -o redc_2.lo redc_2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_redc_2 -g -O2 -c redc_2.c -o redc_2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo redc_n | sed 's/_$//'`   -g -O2 -c -o redc_n.lo redc_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_redc_n -g -O2 -c redc_n.c -o redc_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo powm | sed 's/_$//'`   -g -O2 -c -o powm.lo powm.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_powm -g -O2 -c powm.c -o powm.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo powlo | sed 's/_$//'`   -g -O2 -c -o powlo.lo powlo.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_powlo -g -O2 -c powlo.c -o powlo.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_powm | sed 's/_$//'`   -g -O2 -c -o sec_powm.lo sec_powm.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_powm -g -O2 -c sec_powm.c -o sec_powm.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_mul | sed 's/_$//'`   -g -O2 -c -o sec_mul.lo sec_mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_mul -g -O2 -c sec_mul.c -o sec_mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_sqr | sed 's/_$//'`   -g -O2 -c -o sec_sqr.lo sec_sqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_sqr -g -O2 -c sec_sqr.c -o sec_sqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_div_qr | sed 's/_$//'`   -g -O2 -c -o sec_div_qr.lo sec_div_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_div_qr -g -O2 -c sec_div_qr.c -o sec_div_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_div_r | sed 's/_$//'`   -g -O2 -c -o sec_div_r.lo sec_div_r.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_div_r -g -O2 -c sec_div_r.c -o sec_div_r.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_pi1_div_qr | sed 's/_$//'`   -g -O2 -c -o sec_pi1_div_qr.lo sec_pi1_div_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_pi1_div_qr -g -O2 -c sec_pi1_div_qr.c -o sec_pi1_div_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_pi1_div_r | sed 's/_$//'`   -g -O2 -c -o sec_pi1_div_r.lo sec_pi1_div_r.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_pi1_div_r -g -O2 -c sec_pi1_div_r.c -o sec_pi1_div_r.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_add_1 | sed 's/_$//'`   -g -O2 -c -o sec_add_1.lo sec_add_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_add_1 -g -O2 -c sec_add_1.c -o sec_add_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_sub_1 | sed 's/_$//'`   -g -O2 -c -o sec_sub_1.lo sec_sub_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_sub_1 -g -O2 -c sec_sub_1.c -o sec_sub_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_invert | sed 's/_$//'`   -g -O2 -c -o sec_invert.lo sec_invert.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_invert -g -O2 -c sec_invert.c -o sec_invert.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo trialdiv | sed 's/_$//'`   -g -O2 -c -o trialdiv.lo trialdiv.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_trialdiv -g -O2 -c trialdiv.c -o trialdiv.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo remove | sed 's/_$//'`   -g -O2 -c -o remove.lo remove.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_remove -g -O2 -c remove.c -o remove.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo and_n | sed 's/_$//'`   -g -O2 -c -o and_n.lo and_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_and_n -g -O2 -c and_n.c -o and_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo andn_n | sed 's/_$//'`   -g -O2 -c -o andn_n.lo andn_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_andn_n -g -O2 -c andn_n.c -o andn_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo nand_n | sed 's/_$//'`   -g -O2 -c -o nand_n.lo nand_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_nand_n -g -O2 -c nand_n.c -o nand_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo ior_n | sed 's/_$//'`   -g -O2 -c -o ior_n.lo ior_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_ior_n -g -O2 -c ior_n.c -o ior_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo iorn_n | sed 's/_$//'`   -g -O2 -c -o iorn_n.lo iorn_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_iorn_n -g -O2 -c iorn_n.c -o iorn_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo nior_n | sed 's/_$//'`   -g -O2 -c -o nior_n.lo nior_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_nior_n -g -O2 -c nior_n.c -o nior_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo xor_n | sed 's/_$//'`   -g -O2 -c -o xor_n.lo xor_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_xor_n -g -O2 -c xor_n.c -o xor_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo xnor_n | sed 's/_$//'`   -g -O2 -c -o xnor_n.lo xnor_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_xnor_n -g -O2 -c xnor_n.c -o xnor_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo copyi | sed 's/_$//'`   -g -O2 -c -o copyi.lo copyi.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_copyi -g -O2 -c copyi.c -o copyi.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo copyd | sed 's/_$//'`   -g -O2 -c -o copyd.lo copyd.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_copyd -g -O2 -c copyd.c -o copyd.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo zero | sed 's/_$//'`   -g -O2 -c -o zero.lo zero.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_zero -g -O2 -c zero.c -o zero.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo sec_tabselect | sed 's/_$//'`   -g -O2 -c -o sec_tabselect.lo sec_tabselect.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_sec_tabselect -g -O2 -c sec_tabselect.c -o sec_tabselect.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo comb_tables | sed 's/_$//'`   -g -O2 -c -o comb_tables.lo comb_tables.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_comb_tables -g -O2 -c comb_tables.c -o comb_tables.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_`echo add_n_sub_n | sed 's/_$//'`   -g -O2 -c -o add_n_sub_n.lo add_n_sub_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpn -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -DOPERATION_add_n_sub_n -g -O2 -c add_n_sub_n.c -o add_n_sub_n.o

gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o libmpn.la  fib_table.lo mp_bases.lo add.lo add_1.lo add_n.lo sub.lo sub_1.lo sub_n.lo cnd_add_n.lo cnd_sub_n.lo cnd_swap.lo neg.lo com.lo mul_1.lo addmul_1.lo submul_1.lo add_err1_n.lo add_err2_n.lo add_err3_n.lo sub_err1_n.lo sub_err2_n.lo sub_err3_n.lo lshift.lo rshift.lo dive_1.lo diveby3.lo divis.lo divrem.lo divrem_1.lo divrem_2.lo fib2_ui.lo mod_1.lo mod_34lsub1.lo mode1o.lo pre_divrem_1.lo pre_mod_1.lo dump.lo mod_1_1.lo mod_1_2.lo mod_1_3.lo mod_1_4.lo lshiftc.lo mul.lo mul_fft.lo mul_n.lo sqr.lo mul_basecase.lo sqr_basecase.lo nussbaumer_mul.lo mulmid_basecase.lo toom42_mulmid.lo mulmid_n.lo mulmid.lo random.lo random2.lo pow_1.lo rootrem.lo sqrtrem.lo sizeinbase.lo get_str.lo set_str.lo scan0.lo scan1.lo popcount.lo hamdist.lo cmp.lo zero_p.lo perfsqr.lo perfpow.lo gcd_1.lo gcd.lo gcdext_1.lo gcdext.lo gcd_subdiv_step.lo gcdext_lehmer.lo div_q.lo tdiv_qr.lo jacbase.lo jacobi_2.lo jacobi.lo get_d.lo matrix22_mul.lo matrix22_mul1_inverse_vector.lo hgcd_matrix.lo hgcd2.lo hgcd_step.lo hgcd_reduce.lo hgcd.lo hgcd_appr.lo hgcd2_jacobi.lo hgcd_jacobi.lo mullo_n.lo mullo_basecase.lo sqrlo.lo sqrlo_basecase.lo toom22_mul.lo toom32_mul.lo toom42_mul.lo toom52_mul.lo toom62_mul.lo toom33_mul.lo toom43_mul.lo toom53_mul.lo toom54_mul.lo toom63_mul.lo toom44_mul.lo toom6h_mul.lo toom6_sqr.lo toom8h_mul.lo toom8_sqr.lo toom_couple_handling.lo toom2_sqr.lo toom3_sqr.lo toom4_sqr.lo toom_eval_dgr3_pm1.lo toom_eval_dgr3_pm2.lo toom_eval_pm1.lo toom_eval_pm2.lo toom_eval_pm2exp.lo toom_eval_pm2rexp.lo toom_interpolate_5pts.lo toom_interpolate_6pts.lo toom_interpolate_7pts.lo toom_interpolate_8pts.lo toom_interpolate_12pts.lo toom_interpolate_16pts.lo invertappr.lo invert.lo binvert.lo mulmod_bnm1.lo sqrmod_bnm1.lo div_qr_1.lo div_qr_1n_pi1.lo div_qr_2.lo div_qr_2n_pi1.lo div_qr_2u_pi1.lo sbpi1_div_q.lo sbpi1_div_qr.lo sbpi1_divappr_q.lo dcpi1_div_q.lo dcpi1_div_qr.lo dcpi1_divappr_q.lo mu_div_qr.lo mu_divappr_q.lo mu_div_q.lo bdiv_q_1.lo sbpi1_bdiv_q.lo sbpi1_bdiv_qr.lo dcpi1_bdiv_q.lo dcpi1_bdiv_qr.lo mu_bdiv_q.lo mu_bdiv_qr.lo bdiv_q.lo bdiv_qr.lo broot.lo brootinv.lo bsqrt.lo bsqrtinv.lo divexact.lo bdiv_dbm1c.lo redc_1.lo redc_2.lo redc_n.lo powm.lo powlo.lo sec_powm.lo sec_mul.lo sec_sqr.lo sec_div_qr.lo sec_div_r.lo sec_pi1_div_qr.lo sec_pi1_div_r.lo sec_add_1.lo sec_sub_1.lo sec_invert.lo trialdiv.lo remove.lo and_n.lo andn_n.lo nand_n.lo ior_n.lo iorn_n.lo nior_n.lo xor_n.lo xnor_n.lo copyi.lo copyd.lo zero.lo sec_tabselect.lo comb_tables.lo add_n_sub_n.lo 
ar rc libmpn.a  fib_table.o mp_bases.o add.o add_1.o add_n.o sub.o sub_1.o sub_n.o cnd_add_n.o cnd_sub_n.o cnd_swap.o neg.o com.o mul_1.o addmul_1.o submul_1.o add_err1_n.o add_err2_n.o add_err3_n.o sub_err1_n.o sub_err2_n.o sub_err3_n.o lshift.o rshift.o dive_1.o diveby3.o divis.o divrem.o divrem_1.o divrem_2.o fib2_ui.o mod_1.o mod_34lsub1.o mode1o.o pre_divrem_1.o pre_mod_1.o dump.o mod_1_1.o mod_1_2.o mod_1_3.o mod_1_4.o lshiftc.o mul.o mul_fft.o mul_n.o sqr.o mul_basecase.o sqr_basecase.o nussbaumer_mul.o mulmid_basecase.o toom42_mulmid.o mulmid_n.o mulmid.o random.o random2.o pow_1.o rootrem.o sqrtrem.o sizeinbase.o get_str.o set_str.o scan0.o scan1.o popcount.o hamdist.o cmp.o zero_p.o perfsqr.o perfpow.o gcd_1.o gcd.o gcdext_1.o gcdext.o gcd_subdiv_step.o gcdext_lehmer.o div_q.o tdiv_qr.o jacbase.o jacobi_2.o jacobi.o get_d.o matrix22_mul.o matrix22_mul1_inverse_vector.o hgcd_matrix.o hgcd2.o hgcd_step.o hgcd_reduce.o hgcd.o hgcd_appr.o hgcd2_jacobi.o hgcd_jacobi.o mullo_n.o mullo_basecase.o sqrlo.o sqrlo_basecase.o toom22_mul.o toom32_mul.o toom42_mul.o toom52_mul.o toom62_mul.o toom33_mul.o toom43_mul.o toom53_mul.o toom54_mul.o toom63_mul.o toom44_mul.o toom6h_mul.o toom6_sqr.o toom8h_mul.o toom8_sqr.o toom_couple_handling.o toom2_sqr.o toom3_sqr.o toom4_sqr.o toom_eval_dgr3_pm1.o toom_eval_dgr3_pm2.o toom_eval_pm1.o toom_eval_pm2.o toom_eval_pm2exp.o toom_eval_pm2rexp.o toom_interpolate_5pts.o toom_interpolate_6pts.o toom_interpolate_7pts.o toom_interpolate_8pts.o toom_interpolate_12pts.o toom_interpolate_16pts.o invertappr.o invert.o binvert.o mulmod_bnm1.o sqrmod_bnm1.o div_qr_1.o div_qr_1n_pi1.o div_qr_2.o div_qr_2n_pi1.o div_qr_2u_pi1.o sbpi1_div_q.o sbpi1_div_qr.o sbpi1_divappr_q.o dcpi1_div_q.o dcpi1_div_qr.o dcpi1_divappr_q.o mu_div_qr.o mu_divappr_q.o mu_div_q.o bdiv_q_1.o sbpi1_bdiv_q.o sbpi1_bdiv_qr.o dcpi1_bdiv_q.o dcpi1_bdiv_qr.o mu_bdiv_q.o mu_bdiv_qr.o bdiv_q.o bdiv_qr.o broot.o brootinv.o bsqrt.o bsqrtinv.o divexact.o bdiv_dbm1c.o redc_1.o redc_2.o redc_n.o powm.o powlo.o sec_powm.o sec_mul.o sec_sqr.o sec_div_qr.o sec_div_r.o sec_pi1_div_qr.o sec_pi1_div_r.o sec_add_1.o sec_sub_1.o sec_invert.o trialdiv.o remove.o and_n.o andn_n.o nand_n.o ior_n.o iorn_n.o nior_n.o xor_n.o xnor_n.o copyi.o copyd.o zero.o sec_tabselect.o comb_tables.o add_n_sub_n.o
ranlib libmpn.a
#libtool: link: ( cd ".libs" && rm -f "libmpn.la" && ln -s "../libmpn.la" "libmpn.la" )
#make[2]: Leaving directory `/android/build/gmp/mpn'
#zhouweiguo
#make[2]: Entering directory `/android/build/gmp/mpz'
cd ..
cd mpz
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o 2fac_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/2fac_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/2fac_ui.c -o 2fac_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o add.lo /android/gcc/gcc-6.4.0/gmp/mpz/add.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/add.c -o add.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o add_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/add_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/add_ui.c -o add_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o abs.lo /android/gcc/gcc-6.4.0/gmp/mpz/abs.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/abs.c -o abs.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o aorsmul.lo /android/gcc/gcc-6.4.0/gmp/mpz/aorsmul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/aorsmul.c -o aorsmul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o aorsmul_i.lo /android/gcc/gcc-6.4.0/gmp/mpz/aorsmul_i.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/aorsmul_i.c -o aorsmul_i.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o and.lo /android/gcc/gcc-6.4.0/gmp/mpz/and.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/and.c -o and.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o array_init.lo /android/gcc/gcc-6.4.0/gmp/mpz/array_init.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/array_init.c -o array_init.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o bin_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/bin_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/bin_ui.c -o bin_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o bin_uiui.lo /android/gcc/gcc-6.4.0/gmp/mpz/bin_uiui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/bin_uiui.c -o bin_uiui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_q.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_q.c -o cdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_q_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_q_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_q_ui.c -o cdiv_q_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_qr.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_qr.c -o cdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_qr_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_qr_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_qr_ui.c -o cdiv_qr_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_r.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_r.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_r.c -o cdiv_r.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_r_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_r_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_r_ui.c -o cdiv_r_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cdiv_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cdiv_ui.c -o cdiv_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cfdiv_q_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/cfdiv_q_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cfdiv_q_2exp.c -o cfdiv_q_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cfdiv_r_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/cfdiv_r_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cfdiv_r_2exp.c -o cfdiv_r_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clear.lo /android/gcc/gcc-6.4.0/gmp/mpz/clear.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/clear.c -o clear.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clears.lo /android/gcc/gcc-6.4.0/gmp/mpz/clears.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/clears.c -o clears.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clrbit.lo /android/gcc/gcc-6.4.0/gmp/mpz/clrbit.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/clrbit.c -o clrbit.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmp.c -o cmp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_d.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmp_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmp_d.c -o cmp_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_si.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmp_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmp_si.c -o cmp_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmp_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmp_ui.c -o cmp_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmpabs.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmpabs.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmpabs.c -o cmpabs.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmpabs_d.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmpabs_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmpabs_d.c -o cmpabs_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmpabs_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cmpabs_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cmpabs_ui.c -o cmpabs_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o com.lo /android/gcc/gcc-6.4.0/gmp/mpz/com.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/com.c -o com.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o combit.lo /android/gcc/gcc-6.4.0/gmp/mpz/combit.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/combit.c -o combit.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cong.lo /android/gcc/gcc-6.4.0/gmp/mpz/cong.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cong.c -o cong.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cong_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/cong_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cong_2exp.c -o cong_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cong_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/cong_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/cong_ui.c -o cong_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o divexact.lo /android/gcc/gcc-6.4.0/gmp/mpz/divexact.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/divexact.c -o divexact.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o divegcd.lo /android/gcc/gcc-6.4.0/gmp/mpz/divegcd.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/divegcd.c -o divegcd.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o dive_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/dive_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/dive_ui.c -o dive_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o divis.lo /android/gcc/gcc-6.4.0/gmp/mpz/divis.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/divis.c -o divis.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o divis_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/divis_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/divis_ui.c -o divis_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o divis_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/divis_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/divis_2exp.c -o divis_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o dump.lo /android/gcc/gcc-6.4.0/gmp/mpz/dump.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/dump.c -o dump.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o export.lo /android/gcc/gcc-6.4.0/gmp/mpz/export.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/export.c -o export.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fac_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fac_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fac_ui.c -o fac_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_q.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_q.c -o fdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_q_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_q_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_q_ui.c -o fdiv_q_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_qr.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_qr.c -o fdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_qr_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_qr_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_qr_ui.c -o fdiv_qr_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_r.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_r.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_r.c -o fdiv_r.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_r_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_r_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_r_ui.c -o fdiv_r_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fdiv_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fdiv_ui.c -o fdiv_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fib_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fib_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fib_ui.c -o fib_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fib2_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/fib2_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fib2_ui.c -o fib2_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_sint.lo /android/gcc/gcc-6.4.0/gmp/mpz/fits_sint.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fits_sint.c -o fits_sint.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_slong.lo /android/gcc/gcc-6.4.0/gmp/mpz/fits_slong.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fits_slong.c -o fits_slong.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_sshort.lo /android/gcc/gcc-6.4.0/gmp/mpz/fits_sshort.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fits_sshort.c -o fits_sshort.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_uint.lo /android/gcc/gcc-6.4.0/gmp/mpz/fits_uint.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fits_uint.c -o fits_uint.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_ulong.lo /android/gcc/gcc-6.4.0/gmp/mpz/fits_ulong.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fits_ulong.c -o fits_ulong.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_ushort.lo /android/gcc/gcc-6.4.0/gmp/mpz/fits_ushort.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/fits_ushort.c -o fits_ushort.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o gcd.lo /android/gcc/gcc-6.4.0/gmp/mpz/gcd.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/gcd.c -o gcd.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o gcd_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/gcd_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/gcd_ui.c -o gcd_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o gcdext.lo /android/gcc/gcc-6.4.0/gmp/mpz/gcdext.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/gcdext.c -o gcdext.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_d.lo /android/gcc/gcc-6.4.0/gmp/mpz/get_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/get_d.c -o get_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_d_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/get_d_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/get_d_2exp.c -o get_d_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_si.lo /android/gcc/gcc-6.4.0/gmp/mpz/get_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/get_si.c -o get_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_str.lo /android/gcc/gcc-6.4.0/gmp/mpz/get_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/get_str.c -o get_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/get_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/get_ui.c -o get_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o getlimbn.lo /android/gcc/gcc-6.4.0/gmp/mpz/getlimbn.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/getlimbn.c -o getlimbn.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o hamdist.lo /android/gcc/gcc-6.4.0/gmp/mpz/hamdist.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/hamdist.c -o hamdist.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o import.lo /android/gcc/gcc-6.4.0/gmp/mpz/import.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/import.c -o import.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o init.lo /android/gcc/gcc-6.4.0/gmp/mpz/init.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/init.c -o init.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o init2.lo /android/gcc/gcc-6.4.0/gmp/mpz/init2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/init2.c -o init2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inits.lo /android/gcc/gcc-6.4.0/gmp/mpz/inits.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/inits.c -o inits.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inp_raw.lo /android/gcc/gcc-6.4.0/gmp/mpz/inp_raw.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/inp_raw.c -o inp_raw.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inp_str.lo /android/gcc/gcc-6.4.0/gmp/mpz/inp_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/inp_str.c -o inp_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o invert.lo /android/gcc/gcc-6.4.0/gmp/mpz/invert.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/invert.c -o invert.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o ior.lo /android/gcc/gcc-6.4.0/gmp/mpz/ior.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/ior.c -o ior.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset.lo /android/gcc/gcc-6.4.0/gmp/mpz/iset.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/iset.c -o iset.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_d.lo /android/gcc/gcc-6.4.0/gmp/mpz/iset_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/iset_d.c -o iset_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_si.lo /android/gcc/gcc-6.4.0/gmp/mpz/iset_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/iset_si.c -o iset_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_str.lo /android/gcc/gcc-6.4.0/gmp/mpz/iset_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/iset_str.c -o iset_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/iset_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/iset_ui.c -o iset_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o jacobi.lo /android/gcc/gcc-6.4.0/gmp/mpz/jacobi.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/jacobi.c -o jacobi.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o kronsz.lo /android/gcc/gcc-6.4.0/gmp/mpz/kronsz.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/kronsz.c -o kronsz.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o kronuz.lo /android/gcc/gcc-6.4.0/gmp/mpz/kronuz.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/kronuz.c -o kronuz.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o kronzs.lo /android/gcc/gcc-6.4.0/gmp/mpz/kronzs.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/kronzs.c -o kronzs.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o kronzu.lo /android/gcc/gcc-6.4.0/gmp/mpz/kronzu.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/kronzu.c -o kronzu.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o lcm.lo /android/gcc/gcc-6.4.0/gmp/mpz/lcm.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/lcm.c -o lcm.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o lcm_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/lcm_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/lcm_ui.c -o lcm_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o limbs_read.lo /android/gcc/gcc-6.4.0/gmp/mpz/limbs_read.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/limbs_read.c -o limbs_read.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o limbs_write.lo /android/gcc/gcc-6.4.0/gmp/mpz/limbs_write.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/limbs_write.c -o limbs_write.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o limbs_modify.lo /android/gcc/gcc-6.4.0/gmp/mpz/limbs_modify.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/limbs_modify.c -o limbs_modify.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o limbs_finish.lo /android/gcc/gcc-6.4.0/gmp/mpz/limbs_finish.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/limbs_finish.c -o limbs_finish.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o lucnum_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/lucnum_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/lucnum_ui.c -o lucnum_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o lucnum2_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/lucnum2_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/lucnum2_ui.c -o lucnum2_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mfac_uiui.lo /android/gcc/gcc-6.4.0/gmp/mpz/mfac_uiui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/mfac_uiui.c -o mfac_uiui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o millerrabin.lo /android/gcc/gcc-6.4.0/gmp/mpz/millerrabin.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/millerrabin.c -o millerrabin.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mod.lo /android/gcc/gcc-6.4.0/gmp/mpz/mod.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/mod.c -o mod.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul.lo /android/gcc/gcc-6.4.0/gmp/mpz/mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/mul.c -o mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/mul_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/mul_2exp.c -o mul_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul_si.lo /android/gcc/gcc-6.4.0/gmp/mpz/mul_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/mul_si.c -o mul_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/mul_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/mul_ui.c -o mul_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o n_pow_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/n_pow_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/n_pow_ui.c -o n_pow_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o neg.lo /android/gcc/gcc-6.4.0/gmp/mpz/neg.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/neg.c -o neg.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o nextprime.lo /android/gcc/gcc-6.4.0/gmp/mpz/nextprime.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/nextprime.c -o nextprime.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o oddfac_1.lo /android/gcc/gcc-6.4.0/gmp/mpz/oddfac_1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/oddfac_1.c -o oddfac_1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o out_raw.lo /android/gcc/gcc-6.4.0/gmp/mpz/out_raw.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/out_raw.c -o out_raw.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o out_str.lo /android/gcc/gcc-6.4.0/gmp/mpz/out_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/out_str.c -o out_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o perfpow.lo /android/gcc/gcc-6.4.0/gmp/mpz/perfpow.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/perfpow.c -o perfpow.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o perfsqr.lo /android/gcc/gcc-6.4.0/gmp/mpz/perfsqr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/perfsqr.c -o perfsqr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o popcount.lo /android/gcc/gcc-6.4.0/gmp/mpz/popcount.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/popcount.c -o popcount.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o pow_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/pow_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/pow_ui.c -o pow_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o powm.lo /android/gcc/gcc-6.4.0/gmp/mpz/powm.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/powm.c -o powm.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o powm_sec.lo /android/gcc/gcc-6.4.0/gmp/mpz/powm_sec.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/powm_sec.c -o powm_sec.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o powm_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/powm_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/powm_ui.c -o powm_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o pprime_p.lo /android/gcc/gcc-6.4.0/gmp/mpz/pprime_p.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/pprime_p.c -o pprime_p.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o prodlimbs.lo /android/gcc/gcc-6.4.0/gmp/mpz/prodlimbs.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/prodlimbs.c -o prodlimbs.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o primorial_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/primorial_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/primorial_ui.c -o primorial_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o random.lo /android/gcc/gcc-6.4.0/gmp/mpz/random.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/random.c -o random.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o random2.lo /android/gcc/gcc-6.4.0/gmp/mpz/random2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/random2.c -o random2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o realloc.lo /android/gcc/gcc-6.4.0/gmp/mpz/realloc.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/realloc.c -o realloc.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o realloc2.lo /android/gcc/gcc-6.4.0/gmp/mpz/realloc2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/realloc2.c -o realloc2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o remove.lo /android/gcc/gcc-6.4.0/gmp/mpz/remove.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/remove.c -o remove.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o roinit_n.lo /android/gcc/gcc-6.4.0/gmp/mpz/roinit_n.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/roinit_n.c -o roinit_n.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o root.lo /android/gcc/gcc-6.4.0/gmp/mpz/root.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/root.c -o root.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o rootrem.lo /android/gcc/gcc-6.4.0/gmp/mpz/rootrem.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/rootrem.c -o rootrem.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o rrandomb.lo /android/gcc/gcc-6.4.0/gmp/mpz/rrandomb.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/rrandomb.c -o rrandomb.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o scan0.lo /android/gcc/gcc-6.4.0/gmp/mpz/scan0.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/scan0.c -o scan0.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o scan1.lo /android/gcc/gcc-6.4.0/gmp/mpz/scan1.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/scan1.c -o scan1.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set.lo /android/gcc/gcc-6.4.0/gmp/mpz/set.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set.c -o set.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_d.lo /android/gcc/gcc-6.4.0/gmp/mpz/set_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set_d.c -o set_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_f.lo /android/gcc/gcc-6.4.0/gmp/mpz/set_f.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set_f.c -o set_f.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_q.lo /android/gcc/gcc-6.4.0/gmp/mpz/set_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set_q.c -o set_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_si.lo /android/gcc/gcc-6.4.0/gmp/mpz/set_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set_si.c -o set_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_str.lo /android/gcc/gcc-6.4.0/gmp/mpz/set_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set_str.c -o set_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/set_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/set_ui.c -o set_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o setbit.lo /android/gcc/gcc-6.4.0/gmp/mpz/setbit.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/setbit.c -o setbit.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o size.lo /android/gcc/gcc-6.4.0/gmp/mpz/size.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/size.c -o size.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sizeinbase.lo /android/gcc/gcc-6.4.0/gmp/mpz/sizeinbase.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/sizeinbase.c -o sizeinbase.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sqrt.lo /android/gcc/gcc-6.4.0/gmp/mpz/sqrt.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/sqrt.c -o sqrt.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sqrtrem.lo /android/gcc/gcc-6.4.0/gmp/mpz/sqrtrem.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/sqrtrem.c -o sqrtrem.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sub.lo /android/gcc/gcc-6.4.0/gmp/mpz/sub.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/sub.c -o sub.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sub_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/sub_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/sub_ui.c -o sub_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o swap.lo /android/gcc/gcc-6.4.0/gmp/mpz/swap.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/swap.c -o swap.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_ui.c -o tdiv_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_q.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_q.c -o tdiv_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_q_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_q_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_q_2exp.c -o tdiv_q_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_q_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_q_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_q_ui.c -o tdiv_q_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_qr.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_qr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_qr.c -o tdiv_qr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_qr_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_qr_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_qr_ui.c -o tdiv_qr_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_r.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_r.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_r.c -o tdiv_r.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_r_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_r_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_r_2exp.c -o tdiv_r_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tdiv_r_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_r_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tdiv_r_ui.c -o tdiv_r_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o tstbit.lo /android/gcc/gcc-6.4.0/gmp/mpz/tstbit.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/tstbit.c -o tstbit.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o ui_pow_ui.lo /android/gcc/gcc-6.4.0/gmp/mpz/ui_pow_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/ui_pow_ui.c -o ui_pow_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o ui_sub.lo /android/gcc/gcc-6.4.0/gmp/mpz/ui_sub.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/ui_sub.c -o ui_sub.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o urandomb.lo /android/gcc/gcc-6.4.0/gmp/mpz/urandomb.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/urandomb.c -o urandomb.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o urandomm.lo /android/gcc/gcc-6.4.0/gmp/mpz/urandomm.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/urandomm.c -o urandomm.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o xor.lo /android/gcc/gcc-6.4.0/gmp/mpz/xor.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpz -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpz/xor.c -o xor.o
 gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o libmpz.la  2fac_ui.lo add.lo add_ui.lo abs.lo aorsmul.lo aorsmul_i.lo and.lo array_init.lo bin_ui.lo bin_uiui.lo cdiv_q.lo cdiv_q_ui.lo cdiv_qr.lo cdiv_qr_ui.lo cdiv_r.lo cdiv_r_ui.lo cdiv_ui.lo cfdiv_q_2exp.lo cfdiv_r_2exp.lo clear.lo clears.lo clrbit.lo cmp.lo cmp_d.lo cmp_si.lo cmp_ui.lo cmpabs.lo cmpabs_d.lo cmpabs_ui.lo com.lo combit.lo cong.lo cong_2exp.lo cong_ui.lo divexact.lo divegcd.lo dive_ui.lo divis.lo divis_ui.lo divis_2exp.lo dump.lo export.lo fac_ui.lo fdiv_q.lo fdiv_q_ui.lo fdiv_qr.lo fdiv_qr_ui.lo fdiv_r.lo fdiv_r_ui.lo fdiv_ui.lo fib_ui.lo fib2_ui.lo fits_sint.lo fits_slong.lo fits_sshort.lo fits_uint.lo fits_ulong.lo fits_ushort.lo gcd.lo gcd_ui.lo gcdext.lo get_d.lo get_d_2exp.lo get_si.lo get_str.lo get_ui.lo getlimbn.lo hamdist.lo import.lo init.lo init2.lo inits.lo inp_raw.lo inp_str.lo invert.lo ior.lo iset.lo iset_d.lo iset_si.lo iset_str.lo iset_ui.lo jacobi.lo kronsz.lo kronuz.lo kronzs.lo kronzu.lo lcm.lo lcm_ui.lo limbs_read.lo limbs_write.lo limbs_modify.lo limbs_finish.lo lucnum_ui.lo lucnum2_ui.lo mfac_uiui.lo millerrabin.lo mod.lo mul.lo mul_2exp.lo mul_si.lo mul_ui.lo n_pow_ui.lo neg.lo nextprime.lo oddfac_1.lo out_raw.lo out_str.lo perfpow.lo perfsqr.lo popcount.lo pow_ui.lo powm.lo powm_sec.lo powm_ui.lo pprime_p.lo prodlimbs.lo primorial_ui.lo random.lo random2.lo realloc.lo realloc2.lo remove.lo roinit_n.lo root.lo rootrem.lo rrandomb.lo scan0.lo scan1.lo set.lo set_d.lo set_f.lo set_q.lo set_si.lo set_str.lo set_ui.lo setbit.lo size.lo sizeinbase.lo sqrt.lo sqrtrem.lo sub.lo sub_ui.lo swap.lo tdiv_ui.lo tdiv_q.lo tdiv_q_2exp.lo tdiv_q_ui.lo tdiv_qr.lo tdiv_qr_ui.lo tdiv_r.lo tdiv_r_2exp.lo tdiv_r_ui.lo tstbit.lo ui_pow_ui.lo ui_sub.lo urandomb.lo urandomm.lo xor.lo  
ar rc libmpz.a  2fac_ui.o add.o add_ui.o abs.o aorsmul.o aorsmul_i.o and.o array_init.o bin_ui.o bin_uiui.o cdiv_q.o cdiv_q_ui.o cdiv_qr.o cdiv_qr_ui.o cdiv_r.o cdiv_r_ui.o cdiv_ui.o cfdiv_q_2exp.o cfdiv_r_2exp.o clear.o clears.o clrbit.o cmp.o cmp_d.o cmp_si.o cmp_ui.o cmpabs.o cmpabs_d.o cmpabs_ui.o com.o combit.o cong.o cong_2exp.o cong_ui.o divexact.o divegcd.o dive_ui.o divis.o divis_ui.o divis_2exp.o dump.o export.o fac_ui.o fdiv_q.o fdiv_q_ui.o fdiv_qr.o fdiv_qr_ui.o fdiv_r.o fdiv_r_ui.o fdiv_ui.o fib_ui.o fib2_ui.o fits_sint.o fits_slong.o fits_sshort.o fits_uint.o fits_ulong.o fits_ushort.o gcd.o gcd_ui.o gcdext.o get_d.o get_d_2exp.o get_si.o get_str.o get_ui.o getlimbn.o hamdist.o import.o init.o init2.o inits.o inp_raw.o inp_str.o invert.o ior.o iset.o iset_d.o iset_si.o iset_str.o iset_ui.o jacobi.o kronsz.o kronuz.o kronzs.o kronzu.o lcm.o lcm_ui.o limbs_read.o limbs_write.o limbs_modify.o limbs_finish.o lucnum_ui.o lucnum2_ui.o mfac_uiui.o millerrabin.o mod.o mul.o mul_2exp.o mul_si.o mul_ui.o n_pow_ui.o neg.o nextprime.o oddfac_1.o out_raw.o out_str.o perfpow.o perfsqr.o popcount.o pow_ui.o powm.o powm_sec.o powm_ui.o pprime_p.o prodlimbs.o primorial_ui.o random.o random2.o realloc.o realloc2.o remove.o roinit_n.o root.o rootrem.o rrandomb.o scan0.o scan1.o set.o set_d.o set_f.o set_q.o set_si.o set_str.o set_ui.o setbit.o size.o sizeinbase.o sqrt.o sqrtrem.o sub.o sub_ui.o swap.o tdiv_ui.o tdiv_q.o tdiv_q_2exp.o tdiv_q_ui.o tdiv_qr.o tdiv_qr_ui.o tdiv_r.o tdiv_r_2exp.o tdiv_r_ui.o tstbit.o ui_pow_ui.o ui_sub.o urandomb.o urandomm.o xor.o
ranlib libmpz.a
#libtool: link: ( cd ".libs" && rm -f "libmpz.la" && ln -s "../libmpz.la" "libmpz.la" )
#make[2]: Leaving directory `/android/build/gmp/mpz'
#make[2]: Entering directory `/android/build/gmp/mpq'
#zhouweiguo
cd ..
cd mpq
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o abs.lo /android/gcc/gcc-6.4.0/gmp/mpq/abs.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/abs.c -o abs.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o aors.lo /android/gcc/gcc-6.4.0/gmp/mpq/aors.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/aors.c -o aors.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o canonicalize.lo /android/gcc/gcc-6.4.0/gmp/mpq/canonicalize.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/canonicalize.c -o canonicalize.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clear.lo /android/gcc/gcc-6.4.0/gmp/mpq/clear.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/clear.c -o clear.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clears.lo /android/gcc/gcc-6.4.0/gmp/mpq/clears.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/clears.c -o clears.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp.lo /android/gcc/gcc-6.4.0/gmp/mpq/cmp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/cmp.c -o cmp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_si.lo /android/gcc/gcc-6.4.0/gmp/mpq/cmp_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/cmp_si.c -o cmp_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_ui.lo /android/gcc/gcc-6.4.0/gmp/mpq/cmp_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/cmp_ui.c -o cmp_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o div.lo /android/gcc/gcc-6.4.0/gmp/mpq/div.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/div.c -o div.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o equal.lo /android/gcc/gcc-6.4.0/gmp/mpq/equal.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/equal.c -o equal.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_d.lo /android/gcc/gcc-6.4.0/gmp/mpq/get_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/get_d.c -o get_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_den.lo /android/gcc/gcc-6.4.0/gmp/mpq/get_den.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/get_den.c -o get_den.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_num.lo /android/gcc/gcc-6.4.0/gmp/mpq/get_num.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/get_num.c -o get_num.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_str.lo /android/gcc/gcc-6.4.0/gmp/mpq/get_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/get_str.c -o get_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o init.lo /android/gcc/gcc-6.4.0/gmp/mpq/init.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/init.c -o init.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inits.lo /android/gcc/gcc-6.4.0/gmp/mpq/inits.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/inits.c -o inits.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inp_str.lo /android/gcc/gcc-6.4.0/gmp/mpq/inp_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/inp_str.c -o inp_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inv.lo /android/gcc/gcc-6.4.0/gmp/mpq/inv.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/inv.c -o inv.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o md_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpq/md_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/md_2exp.c -o md_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul.lo /android/gcc/gcc-6.4.0/gmp/mpq/mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/mul.c -o mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o neg.lo /android/gcc/gcc-6.4.0/gmp/mpq/neg.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/neg.c -o neg.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o out_str.lo /android/gcc/gcc-6.4.0/gmp/mpq/out_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/out_str.c -o out_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set.lo /android/gcc/gcc-6.4.0/gmp/mpq/set.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set.c -o set.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_den.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_den.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_den.c -o set_den.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_num.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_num.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_num.c -o set_num.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_si.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_si.c -o set_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_str.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_str.c -o set_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_ui.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_ui.c -o set_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_z.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_z.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_z.c -o set_z.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_d.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_d.c -o set_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_f.lo /android/gcc/gcc-6.4.0/gmp/mpq/set_f.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/set_f.c -o set_f.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o swap.lo /android/gcc/gcc-6.4.0/gmp/mpq/swap.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpq -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpq/swap.c -o swap.o
gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o libmpq.la  abs.lo aors.lo canonicalize.lo clear.lo clears.lo cmp.lo cmp_si.lo cmp_ui.lo div.lo equal.lo get_d.lo get_den.lo get_num.lo get_str.lo init.lo inits.lo inp_str.lo inv.lo md_2exp.lo mul.lo neg.lo out_str.lo set.lo set_den.lo set_num.lo set_si.lo set_str.lo set_ui.lo set_z.lo set_d.lo set_f.lo swap.lo  
ar rc libmpq.a  abs.o aors.o canonicalize.o clear.o clears.o cmp.o cmp_si.o cmp_ui.o div.o equal.o get_d.o get_den.o get_num.o get_str.o init.o inits.o inp_str.o inv.o md_2exp.o mul.o neg.o out_str.o set.o set_den.o set_num.o set_si.o set_str.o set_ui.o set_z.o set_d.o set_f.o swap.o
ranlib libmpq.a
#libtool: link: ( cd ".libs" && rm -f "libmpq.la" && ln -s "../libmpq.la" "libmpq.la" )
#make[2]: Leaving directory `/android/build/gmp/mpq'
#make[2]: Entering directory `/android/build/gmp/mpf'
cd ..
cd mpf
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o init.lo /android/gcc/gcc-6.4.0/gmp/mpf/init.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/init.c -o init.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o init2.lo /android/gcc/gcc-6.4.0/gmp/mpf/init2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/init2.c -o init2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inits.lo /android/gcc/gcc-6.4.0/gmp/mpf/inits.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/inits.c -o inits.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set.lo /android/gcc/gcc-6.4.0/gmp/mpf/set.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set.c -o set.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_ui.c -o set_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_si.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_si.c -o set_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_str.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_str.c -o set_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_d.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_d.c -o set_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_z.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_z.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_z.c -o set_z.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_q.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_q.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_q.c -o set_q.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset.lo /android/gcc/gcc-6.4.0/gmp/mpf/iset.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/iset.c -o iset.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/iset_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/iset_ui.c -o iset_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_si.lo /android/gcc/gcc-6.4.0/gmp/mpf/iset_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/iset_si.c -o iset_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_str.lo /android/gcc/gcc-6.4.0/gmp/mpf/iset_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/iset_str.c -o iset_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o iset_d.lo /android/gcc/gcc-6.4.0/gmp/mpf/iset_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/iset_d.c -o iset_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clear.lo /android/gcc/gcc-6.4.0/gmp/mpf/clear.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/clear.c -o clear.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o clears.lo /android/gcc/gcc-6.4.0/gmp/mpf/clears.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/clears.c -o clears.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_str.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_str.c -o get_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o dump.lo /android/gcc/gcc-6.4.0/gmp/mpf/dump.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/dump.c -o dump.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o size.lo /android/gcc/gcc-6.4.0/gmp/mpf/size.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/size.c -o size.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o eq.lo /android/gcc/gcc-6.4.0/gmp/mpf/eq.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/eq.c -o eq.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o reldiff.lo /android/gcc/gcc-6.4.0/gmp/mpf/reldiff.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/reldiff.c -o reldiff.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sqrt.lo /android/gcc/gcc-6.4.0/gmp/mpf/sqrt.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/sqrt.c -o sqrt.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o random2.lo /android/gcc/gcc-6.4.0/gmp/mpf/random2.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/random2.c -o random2.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o inp_str.lo /android/gcc/gcc-6.4.0/gmp/mpf/inp_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/inp_str.c -o inp_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o out_str.lo /android/gcc/gcc-6.4.0/gmp/mpf/out_str.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/out_str.c -o out_str.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o add.lo /android/gcc/gcc-6.4.0/gmp/mpf/add.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/add.c -o add.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o add_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/add_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/add_ui.c -o add_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sub.lo /android/gcc/gcc-6.4.0/gmp/mpf/sub.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/sub.c -o sub.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sub_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/sub_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/sub_ui.c -o sub_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o ui_sub.lo /android/gcc/gcc-6.4.0/gmp/mpf/ui_sub.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/ui_sub.c -o ui_sub.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul.lo /android/gcc/gcc-6.4.0/gmp/mpf/mul.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/mul.c -o mul.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/mul_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/mul_ui.c -o mul_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o div.lo /android/gcc/gcc-6.4.0/gmp/mpf/div.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/div.c -o div.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o div_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/div_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/div_ui.c -o div_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp.lo /android/gcc/gcc-6.4.0/gmp/mpf/cmp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/cmp.c -o cmp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_d.lo /android/gcc/gcc-6.4.0/gmp/mpf/cmp_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/cmp_d.c -o cmp_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_z.lo /android/gcc/gcc-6.4.0/gmp/mpf/cmp_z.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/cmp_z.c -o cmp_z.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_si.lo /android/gcc/gcc-6.4.0/gmp/mpf/cmp_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/cmp_si.c -o cmp_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o cmp_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/cmp_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/cmp_ui.c -o cmp_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o mul_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpf/mul_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/mul_2exp.c -o mul_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o div_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpf/div_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/div_2exp.c -o div_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o abs.lo /android/gcc/gcc-6.4.0/gmp/mpf/abs.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/abs.c -o abs.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o neg.lo /android/gcc/gcc-6.4.0/gmp/mpf/neg.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/neg.c -o neg.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_d.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_d.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_d.c -o get_d.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_d_2exp.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_d_2exp.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_d_2exp.c -o get_d_2exp.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_dfl_prec.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_dfl_prec.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_dfl_prec.c -o set_dfl_prec.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_prc.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_prc.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_prc.c -o set_prc.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o set_prc_raw.lo /android/gcc/gcc-6.4.0/gmp/mpf/set_prc_raw.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/set_prc_raw.c -o set_prc_raw.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_dfl_prec.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_dfl_prec.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_dfl_prec.c -o get_dfl_prec.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_prc.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_prc.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_prc.c -o get_prc.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o ui_div.lo /android/gcc/gcc-6.4.0/gmp/mpf/ui_div.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/ui_div.c -o ui_div.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sqrt_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/sqrt_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/sqrt_ui.c -o sqrt_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o pow_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/pow_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/pow_ui.c -o pow_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o urandomb.lo /android/gcc/gcc-6.4.0/gmp/mpf/urandomb.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/urandomb.c -o urandomb.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o swap.lo /android/gcc/gcc-6.4.0/gmp/mpf/swap.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/swap.c -o swap.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_si.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_si.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_si.c -o get_si.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o get_ui.lo /android/gcc/gcc-6.4.0/gmp/mpf/get_ui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/get_ui.c -o get_ui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o int_p.lo /android/gcc/gcc-6.4.0/gmp/mpf/int_p.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/int_p.c -o int_p.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o ceilfloor.lo /android/gcc/gcc-6.4.0/gmp/mpf/ceilfloor.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/ceilfloor.c -o ceilfloor.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o trunc.lo /android/gcc/gcc-6.4.0/gmp/mpf/trunc.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/trunc.c -o trunc.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_sint.lo /android/gcc/gcc-6.4.0/gmp/mpf/fits_sint.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/fits_sint.c -o fits_sint.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_slong.lo /android/gcc/gcc-6.4.0/gmp/mpf/fits_slong.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/fits_slong.c -o fits_slong.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_sshort.lo /android/gcc/gcc-6.4.0/gmp/mpf/fits_sshort.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/fits_sshort.c -o fits_sshort.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_uint.lo /android/gcc/gcc-6.4.0/gmp/mpf/fits_uint.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/fits_uint.c -o fits_uint.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_ulong.lo /android/gcc/gcc-6.4.0/gmp/mpf/fits_ulong.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/fits_ulong.c -o fits_ulong.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fits_ushort.lo /android/gcc/gcc-6.4.0/gmp/mpf/fits_ushort.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/mpf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mpf/fits_ushort.c -o fits_ushort.o
     gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o libmpf.la  init.lo init2.lo inits.lo set.lo set_ui.lo set_si.lo set_str.lo set_d.lo set_z.lo set_q.lo iset.lo iset_ui.lo iset_si.lo iset_str.lo iset_d.lo clear.lo clears.lo get_str.lo dump.lo size.lo eq.lo reldiff.lo sqrt.lo random2.lo inp_str.lo out_str.lo add.lo add_ui.lo sub.lo sub_ui.lo ui_sub.lo mul.lo mul_ui.lo div.lo div_ui.lo cmp.lo cmp_d.lo cmp_z.lo cmp_si.lo cmp_ui.lo mul_2exp.lo div_2exp.lo abs.lo neg.lo get_d.lo get_d_2exp.lo set_dfl_prec.lo set_prc.lo set_prc_raw.lo get_dfl_prec.lo get_prc.lo ui_div.lo sqrt_ui.lo pow_ui.lo urandomb.lo swap.lo get_si.lo get_ui.lo int_p.lo ceilfloor.lo trunc.lo fits_sint.lo fits_slong.lo fits_sshort.lo fits_uint.lo fits_ulong.lo fits_ushort.lo  
ar rc libmpf.a  init.o init2.o inits.o set.o set_ui.o set_si.o set_str.o set_d.o set_z.o set_q.o iset.o iset_ui.o iset_si.o iset_str.o iset_d.o clear.o clears.o get_str.o dump.o size.o eq.o reldiff.o sqrt.o random2.o inp_str.o out_str.o add.o add_ui.o sub.o sub_ui.o ui_sub.o mul.o mul_ui.o div.o div_ui.o cmp.o cmp_d.o cmp_z.o cmp_si.o cmp_ui.o mul_2exp.o div_2exp.o abs.o neg.o get_d.o get_d_2exp.o set_dfl_prec.o set_prc.o set_prc_raw.o get_dfl_prec.o get_prc.o ui_div.o sqrt_ui.o pow_ui.o urandomb.o swap.o get_si.o get_ui.o int_p.o ceilfloor.o trunc.o fits_sint.o fits_slong.o fits_sshort.o fits_uint.o fits_ulong.o fits_ushort.o
ranlib libmpf.a
#libtool: link: ( cd ".libs" && rm -f "libmpf.la" && ln -s "../libmpf.la" "libmpf.la" )
#make[2]: Leaving directory `/android/build/gmp/mpf'
cd ..
cd printf
#make[2]: Entering directory `/android/build/gmp/printf'
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o asprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/asprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/asprintf.c -o asprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o asprntffuns.lo /android/gcc/gcc-6.4.0/gmp/printf/asprntffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/asprntffuns.c -o asprntffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o doprnt.lo /android/gcc/gcc-6.4.0/gmp/printf/doprnt.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/doprnt.c -o doprnt.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o doprntf.lo /android/gcc/gcc-6.4.0/gmp/printf/doprntf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/doprntf.c -o doprntf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o doprnti.lo /android/gcc/gcc-6.4.0/gmp/printf/doprnti.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/doprnti.c -o doprnti.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/fprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/fprintf.c -o fprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o obprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/obprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/obprintf.c -o obprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o obvprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/obvprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/obvprintf.c -o obvprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o obprntffuns.lo /android/gcc/gcc-6.4.0/gmp/printf/obprntffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/obprntffuns.c -o obprntffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o printf.lo /android/gcc/gcc-6.4.0/gmp/printf/printf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/printf.c -o printf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o printffuns.lo /android/gcc/gcc-6.4.0/gmp/printf/printffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/printffuns.c -o printffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o snprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/snprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/snprintf.c -o snprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o snprntffuns.lo /android/gcc/gcc-6.4.0/gmp/printf/snprntffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/snprntffuns.c -o snprntffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/sprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/sprintf.c -o sprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sprintffuns.lo /android/gcc/gcc-6.4.0/gmp/printf/sprintffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/sprintffuns.c -o sprintffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vasprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/vasprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/vasprintf.c -o vasprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vfprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/vfprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/vfprintf.c -o vfprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/vprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/vprintf.c -o vprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vsnprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/vsnprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/vsnprintf.c -o vsnprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vsprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/vsprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/vsprintf.c -o vsprintf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o repl-vsnprintf.lo /android/gcc/gcc-6.4.0/gmp/printf/repl-vsnprintf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/printf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/printf/repl-vsnprintf.c -o repl-vsnprintf.o
     gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o libprintf.la  asprintf.lo asprntffuns.lo doprnt.lo doprntf.lo doprnti.lo fprintf.lo obprintf.lo obvprintf.lo obprntffuns.lo printf.lo printffuns.lo snprintf.lo snprntffuns.lo sprintf.lo sprintffuns.lo vasprintf.lo vfprintf.lo vprintf.lo vsnprintf.lo vsprintf.lo repl-vsnprintf.lo  
ar rc libprintf.a  asprintf.o asprntffuns.o doprnt.o doprntf.o doprnti.o fprintf.o obprintf.o obvprintf.o obprntffuns.o printf.o printffuns.o snprintf.o snprntffuns.o sprintf.o sprintffuns.o vasprintf.o vfprintf.o vprintf.o vsnprintf.o vsprintf.o repl-vsnprintf.o
ranlib libprintf.a
#libtool: link: ( cd ".libs" && rm -f "libprintf.la" && ln -s "../libprintf.la" "libprintf.la" )
#make[2]: Leaving directory `/android/build/gmp/printf'
#zhouweiguo
#Making all in scanf
cd ..
cd scanf
#make[2]: Entering directory `/android/build/gmp/scanf'
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o doscan.lo /android/gcc/gcc-6.4.0/gmp/scanf/doscan.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/doscan.c -o doscan.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fscanf.lo /android/gcc/gcc-6.4.0/gmp/scanf/fscanf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/fscanf.c -o fscanf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o fscanffuns.lo /android/gcc/gcc-6.4.0/gmp/scanf/fscanffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/fscanffuns.c -o fscanffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o scanf.lo /android/gcc/gcc-6.4.0/gmp/scanf/scanf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/scanf.c -o scanf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sscanf.lo /android/gcc/gcc-6.4.0/gmp/scanf/sscanf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/sscanf.c -o sscanf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o sscanffuns.lo /android/gcc/gcc-6.4.0/gmp/scanf/sscanffuns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/sscanffuns.c -o sscanffuns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vfscanf.lo /android/gcc/gcc-6.4.0/gmp/scanf/vfscanf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/vfscanf.c -o vfscanf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vscanf.lo /android/gcc/gcc-6.4.0/gmp/scanf/vscanf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/vscanf.c -o vscanf.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o vsscanf.lo /android/gcc/gcc-6.4.0/gmp/scanf/vsscanf.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/scanf -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/scanf/vsscanf.c -o vsscanf.o
gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o libscanf.la  doscan.lo fscanf.lo fscanffuns.lo scanf.lo sscanf.lo sscanffuns.lo vfscanf.lo vscanf.lo vsscanf.lo  
ar rc libscanf.a  doscan.o fscanf.o fscanffuns.o scanf.o sscanf.o sscanffuns.o vfscanf.o vscanf.o vsscanf.o
ranlib libscanf.a
#libtool: link: ( cd ".libs" && rm -f "libscanf.la" && ln -s "../libscanf.la" "libscanf.la" )
#make[2]: Leaving directory `/android/build/gmp/scanf'
#zhouweiguo
#Making all in rand
#make[2]: Entering directory `/android/build/gmp/rand'
cd ..
cd rand
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o rand.lo /android/gcc/gcc-6.4.0/gmp/rand/rand.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/rand.c -o rand.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randclr.lo /android/gcc/gcc-6.4.0/gmp/rand/randclr.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randclr.c -o randclr.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randdef.lo /android/gcc/gcc-6.4.0/gmp/rand/randdef.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randdef.c -o randdef.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randiset.lo /android/gcc/gcc-6.4.0/gmp/rand/randiset.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randiset.c -o randiset.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randlc2s.lo /android/gcc/gcc-6.4.0/gmp/rand/randlc2s.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randlc2s.c -o randlc2s.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randlc2x.lo /android/gcc/gcc-6.4.0/gmp/rand/randlc2x.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randlc2x.c -o randlc2x.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randmt.lo /android/gcc/gcc-6.4.0/gmp/rand/randmt.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randmt.c -o randmt.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randmts.lo /android/gcc/gcc-6.4.0/gmp/rand/randmts.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randmts.c -o randmts.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o rands.lo /android/gcc/gcc-6.4.0/gmp/rand/rands.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/rands.c -o rands.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randsd.lo /android/gcc/gcc-6.4.0/gmp/rand/randsd.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randsd.c -o randsd.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randsdui.lo /android/gcc/gcc-6.4.0/gmp/rand/randsdui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randsdui.c -o randsdui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randbui.lo /android/gcc/gcc-6.4.0/gmp/rand/randbui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randbui.c -o randbui.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I..  -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp   -g -O2 -c -o randmui.lo /android/gcc/gcc-6.4.0/gmp/rand/randmui.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp/rand -I.. -D__GMP_WITHIN_GMP -I/android/gcc/gcc-6.4.0/gmp -g -O2 -c /android/gcc/gcc-6.4.0/gmp/rand/randmui.c -o randmui.o
      gcc -std=gnu99  -g -O2  -static-libstdc++ -static-libgcc  -o librandom.la  rand.lo randclr.lo randdef.lo randiset.lo randlc2s.lo randlc2x.lo randmt.lo randmts.lo rands.lo randsd.lo randsdui.lo randbui.lo randmui.lo  
ar rc librandom.a  rand.o randclr.o randdef.o randiset.o randlc2s.o randlc2x.o randmt.o randmts.o rands.o randsd.o randsdui.o randbui.o randmui.o
ranlib librandom.a
#libtool: link: ( cd ".libs" && rm -f "librandom.la" && ln -s "../librandom.la" "librandom.la" )
#zhouweiguo
#make[2]: Leaving directory `/android/build/gmp/rand'
cd ..
cd gmp
#make[2]: Entering directory `/android/build/gmp'
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o assert.lo /android/gcc/gcc-6.4.0/gmp/assert.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/assert.c -o assert.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o compat.lo /android/gcc/gcc-6.4.0/gmp/compat.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/compat.c -o compat.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o errno.lo /android/gcc/gcc-6.4.0/gmp/errno.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/errno.c -o errno.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o extract-dbl.lo /android/gcc/gcc-6.4.0/gmp/extract-dbl.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/extract-dbl.c -o extract-dbl.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o invalid.lo /android/gcc/gcc-6.4.0/gmp/invalid.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/invalid.c -o invalid.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o memory.lo /android/gcc/gcc-6.4.0/gmp/memory.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/memory.c -o memory.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o mp_bpl.lo /android/gcc/gcc-6.4.0/gmp/mp_bpl.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mp_bpl.c -o mp_bpl.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o mp_clz_tab.lo /android/gcc/gcc-6.4.0/gmp/mp_clz_tab.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mp_clz_tab.c -o mp_clz_tab.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o mp_dv_tab.lo /android/gcc/gcc-6.4.0/gmp/mp_dv_tab.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mp_dv_tab.c -o mp_dv_tab.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o mp_minv_tab.lo /android/gcc/gcc-6.4.0/gmp/mp_minv_tab.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mp_minv_tab.c -o mp_minv_tab.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o mp_get_fns.lo /android/gcc/gcc-6.4.0/gmp/mp_get_fns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mp_get_fns.c -o mp_get_fns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o mp_set_fns.lo /android/gcc/gcc-6.4.0/gmp/mp_set_fns.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/mp_set_fns.c -o mp_set_fns.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o version.lo /android/gcc/gcc-6.4.0/gmp/version.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/version.c -o version.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o nextprime.lo /android/gcc/gcc-6.4.0/gmp/nextprime.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/nextprime.c -o nextprime.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o primesieve.lo /android/gcc/gcc-6.4.0/gmp/primesieve.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/primesieve.c -o primesieve.o
       gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp  -D__GMP_WITHIN_GMP   -g -O2 -c -o tal-reent.lo /android/gcc/gcc-6.4.0/gmp/tal-reent.c
  gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I/android/gcc/gcc-6.4.0/gmp -D__GMP_WITHIN_GMP -g -O2 -c /android/gcc/gcc-6.4.0/gmp/tal-reent.c -o tal-reent.o
  #zhouweiguo
gcc -std=gnu99  -g -O2   -version-info 13:2:3 -static-libstdc++ -static-libgcc  -o libgmp.la -rpath /tmp/toolchain/prefix/lib assert.lo compat.lo errno.lo extract-dbl.lo invalid.lo memory.lo mp_bpl.lo mp_clz_tab.lo mp_dv_tab.lo mp_minv_tab.lo mp_get_fns.lo mp_set_fns.lo version.lo nextprime.lo primesieve.lo tal-reent.lo mpf/init.lo mpf/init2.lo mpf/inits.lo mpf/set.lo mpf/set_ui.lo mpf/set_si.lo mpf/set_str.lo mpf/set_d.lo mpf/set_z.lo mpf/iset.lo mpf/iset_ui.lo mpf/iset_si.lo mpf/iset_str.lo mpf/iset_d.lo mpf/clear.lo mpf/clears.lo mpf/get_str.lo mpf/dump.lo mpf/size.lo mpf/eq.lo mpf/reldiff.lo mpf/sqrt.lo mpf/random2.lo mpf/inp_str.lo mpf/out_str.lo mpf/add.lo mpf/add_ui.lo mpf/sub.lo mpf/sub_ui.lo mpf/ui_sub.lo mpf/mul.lo mpf/mul_ui.lo mpf/div.lo mpf/div_ui.lo mpf/cmp_z.lo mpf/cmp.lo mpf/cmp_d.lo mpf/cmp_ui.lo mpf/cmp_si.lo mpf/mul_2exp.lo mpf/div_2exp.lo mpf/abs.lo mpf/neg.lo mpf/set_q.lo mpf/get_d.lo mpf/get_d_2exp.lo mpf/set_dfl_prec.lo mpf/set_prc.lo mpf/set_prc_raw.lo mpf/get_dfl_prec.lo mpf/get_prc.lo mpf/ui_div.lo mpf/sqrt_ui.lo mpf/ceilfloor.lo mpf/trunc.lo mpf/pow_ui.lo mpf/urandomb.lo mpf/swap.lo mpf/fits_sint.lo mpf/fits_slong.lo mpf/fits_sshort.lo mpf/fits_uint.lo mpf/fits_ulong.lo mpf/fits_ushort.lo mpf/get_si.lo mpf/get_ui.lo mpf/int_p.lo mpz/abs.lo mpz/add.lo mpz/add_ui.lo mpz/aorsmul.lo mpz/aorsmul_i.lo mpz/and.lo mpz/array_init.lo mpz/bin_ui.lo mpz/bin_uiui.lo mpz/cdiv_q.lo mpz/cdiv_q_ui.lo mpz/cdiv_qr.lo mpz/cdiv_qr_ui.lo mpz/cdiv_r.lo mpz/cdiv_r_ui.lo mpz/cdiv_ui.lo mpz/cfdiv_q_2exp.lo mpz/cfdiv_r_2exp.lo mpz/clear.lo mpz/clears.lo mpz/clrbit.lo mpz/cmp.lo mpz/cmp_d.lo mpz/cmp_si.lo mpz/cmp_ui.lo mpz/cmpabs.lo mpz/cmpabs_d.lo mpz/cmpabs_ui.lo mpz/com.lo mpz/combit.lo mpz/cong.lo mpz/cong_2exp.lo mpz/cong_ui.lo mpz/divexact.lo mpz/divegcd.lo mpz/dive_ui.lo mpz/divis.lo mpz/divis_ui.lo mpz/divis_2exp.lo mpz/dump.lo mpz/export.lo mpz/mfac_uiui.lo mpz/2fac_ui.lo mpz/fac_ui.lo mpz/oddfac_1.lo mpz/prodlimbs.lo mpz/fdiv_q_ui.lo mpz/fdiv_qr.lo mpz/fdiv_qr_ui.lo mpz/fdiv_r.lo mpz/fdiv_r_ui.lo mpz/fdiv_q.lo mpz/fdiv_ui.lo mpz/fib_ui.lo mpz/fib2_ui.lo mpz/fits_sint.lo mpz/fits_slong.lo mpz/fits_sshort.lo mpz/fits_uint.lo mpz/fits_ulong.lo mpz/fits_ushort.lo mpz/gcd.lo mpz/gcd_ui.lo mpz/gcdext.lo mpz/get_d.lo mpz/get_d_2exp.lo mpz/get_si.lo mpz/get_str.lo mpz/get_ui.lo mpz/getlimbn.lo mpz/hamdist.lo mpz/import.lo mpz/init.lo mpz/init2.lo mpz/inits.lo mpz/inp_raw.lo mpz/inp_str.lo mpz/invert.lo mpz/ior.lo mpz/iset.lo mpz/iset_d.lo mpz/iset_si.lo mpz/iset_str.lo mpz/iset_ui.lo mpz/jacobi.lo mpz/kronsz.lo mpz/kronuz.lo mpz/kronzs.lo mpz/kronzu.lo mpz/lcm.lo mpz/lcm_ui.lo mpz/limbs_finish.lo mpz/limbs_modify.lo mpz/limbs_read.lo mpz/limbs_write.lo mpz/lucnum_ui.lo mpz/lucnum2_ui.lo mpz/millerrabin.lo mpz/mod.lo mpz/mul.lo mpz/mul_2exp.lo mpz/mul_si.lo mpz/mul_ui.lo mpz/n_pow_ui.lo mpz/neg.lo mpz/nextprime.lo mpz/out_raw.lo mpz/out_str.lo mpz/perfpow.lo mpz/perfsqr.lo mpz/popcount.lo mpz/pow_ui.lo mpz/powm.lo mpz/powm_sec.lo mpz/powm_ui.lo mpz/primorial_ui.lo mpz/pprime_p.lo mpz/random.lo mpz/random2.lo mpz/realloc.lo mpz/realloc2.lo mpz/remove.lo mpz/roinit_n.lo mpz/root.lo mpz/rootrem.lo mpz/rrandomb.lo mpz/scan0.lo mpz/scan1.lo mpz/set.lo mpz/set_d.lo mpz/set_f.lo mpz/set_q.lo mpz/set_si.lo mpz/set_str.lo mpz/set_ui.lo mpz/setbit.lo mpz/size.lo mpz/sizeinbase.lo mpz/sqrt.lo mpz/sqrtrem.lo mpz/sub.lo mpz/sub_ui.lo mpz/swap.lo mpz/tdiv_ui.lo mpz/tdiv_q.lo mpz/tdiv_q_2exp.lo mpz/tdiv_q_ui.lo mpz/tdiv_qr.lo mpz/tdiv_qr_ui.lo mpz/tdiv_r.lo mpz/tdiv_r_2exp.lo mpz/tdiv_r_ui.lo mpz/tstbit.lo mpz/ui_pow_ui.lo mpz/ui_sub.lo mpz/urandomb.lo mpz/urandomm.lo mpz/xor.lo mpq/abs.lo mpq/aors.lo mpq/canonicalize.lo mpq/clear.lo mpq/clears.lo mpq/cmp.lo mpq/cmp_si.lo mpq/cmp_ui.lo mpq/div.lo mpq/get_d.lo mpq/get_den.lo mpq/get_num.lo mpq/get_str.lo mpq/init.lo mpq/inits.lo mpq/inp_str.lo mpq/inv.lo mpq/md_2exp.lo mpq/mul.lo mpq/neg.lo mpq/out_str.lo mpq/set.lo mpq/set_den.lo mpq/set_num.lo mpq/set_si.lo mpq/set_str.lo mpq/set_ui.lo mpq/equal.lo mpq/set_z.lo mpq/set_d.lo mpq/set_f.lo mpq/swap.lo mpn/fib_table.lo mpn/mp_bases.lo  mpn/add.lo mpn/add_1.lo mpn/add_n.lo mpn/sub.lo mpn/sub_1.lo mpn/sub_n.lo mpn/cnd_add_n.lo mpn/cnd_sub_n.lo mpn/cnd_swap.lo mpn/neg.lo mpn/com.lo mpn/mul_1.lo mpn/addmul_1.lo mpn/submul_1.lo mpn/add_err1_n.lo mpn/add_err2_n.lo mpn/add_err3_n.lo mpn/sub_err1_n.lo mpn/sub_err2_n.lo mpn/sub_err3_n.lo mpn/lshift.lo mpn/rshift.lo mpn/dive_1.lo mpn/diveby3.lo mpn/divis.lo mpn/divrem.lo mpn/divrem_1.lo mpn/divrem_2.lo mpn/fib2_ui.lo mpn/mod_1.lo mpn/mod_34lsub1.lo mpn/mode1o.lo mpn/pre_divrem_1.lo mpn/pre_mod_1.lo mpn/dump.lo mpn/mod_1_1.lo mpn/mod_1_2.lo mpn/mod_1_3.lo mpn/mod_1_4.lo mpn/lshiftc.lo mpn/mul.lo mpn/mul_fft.lo mpn/mul_n.lo mpn/sqr.lo mpn/mul_basecase.lo mpn/sqr_basecase.lo mpn/nussbaumer_mul.lo mpn/mulmid_basecase.lo mpn/toom42_mulmid.lo mpn/mulmid_n.lo mpn/mulmid.lo mpn/random.lo mpn/random2.lo mpn/pow_1.lo mpn/rootrem.lo mpn/sqrtrem.lo mpn/sizeinbase.lo mpn/get_str.lo mpn/set_str.lo mpn/scan0.lo mpn/scan1.lo mpn/popcount.lo mpn/hamdist.lo mpn/cmp.lo mpn/zero_p.lo mpn/perfsqr.lo mpn/perfpow.lo mpn/gcd_1.lo mpn/gcd.lo mpn/gcdext_1.lo mpn/gcdext.lo mpn/gcd_subdiv_step.lo mpn/gcdext_lehmer.lo mpn/div_q.lo mpn/tdiv_qr.lo mpn/jacbase.lo mpn/jacobi_2.lo mpn/jacobi.lo mpn/get_d.lo mpn/matrix22_mul.lo mpn/matrix22_mul1_inverse_vector.lo mpn/hgcd_matrix.lo mpn/hgcd2.lo mpn/hgcd_step.lo mpn/hgcd_reduce.lo mpn/hgcd.lo mpn/hgcd_appr.lo mpn/hgcd2_jacobi.lo mpn/hgcd_jacobi.lo mpn/mullo_n.lo mpn/mullo_basecase.lo mpn/sqrlo.lo mpn/sqrlo_basecase.lo mpn/toom22_mul.lo mpn/toom32_mul.lo mpn/toom42_mul.lo mpn/toom52_mul.lo mpn/toom62_mul.lo mpn/toom33_mul.lo mpn/toom43_mul.lo mpn/toom53_mul.lo mpn/toom54_mul.lo mpn/toom63_mul.lo mpn/toom44_mul.lo mpn/toom6h_mul.lo mpn/toom6_sqr.lo mpn/toom8h_mul.lo mpn/toom8_sqr.lo mpn/toom_couple_handling.lo mpn/toom2_sqr.lo mpn/toom3_sqr.lo mpn/toom4_sqr.lo mpn/toom_eval_dgr3_pm1.lo mpn/toom_eval_dgr3_pm2.lo mpn/toom_eval_pm1.lo mpn/toom_eval_pm2.lo mpn/toom_eval_pm2exp.lo mpn/toom_eval_pm2rexp.lo mpn/toom_interpolate_5pts.lo mpn/toom_interpolate_6pts.lo mpn/toom_interpolate_7pts.lo mpn/toom_interpolate_8pts.lo mpn/toom_interpolate_12pts.lo mpn/toom_interpolate_16pts.lo mpn/invertappr.lo mpn/invert.lo mpn/binvert.lo mpn/mulmod_bnm1.lo mpn/sqrmod_bnm1.lo mpn/div_qr_1.lo mpn/div_qr_1n_pi1.lo mpn/div_qr_2.lo mpn/div_qr_2n_pi1.lo mpn/div_qr_2u_pi1.lo mpn/sbpi1_div_q.lo mpn/sbpi1_div_qr.lo mpn/sbpi1_divappr_q.lo mpn/dcpi1_div_q.lo mpn/dcpi1_div_qr.lo mpn/dcpi1_divappr_q.lo mpn/mu_div_qr.lo mpn/mu_divappr_q.lo mpn/mu_div_q.lo mpn/bdiv_q_1.lo mpn/sbpi1_bdiv_q.lo mpn/sbpi1_bdiv_qr.lo mpn/dcpi1_bdiv_q.lo mpn/dcpi1_bdiv_qr.lo mpn/mu_bdiv_q.lo mpn/mu_bdiv_qr.lo mpn/bdiv_q.lo mpn/bdiv_qr.lo mpn/broot.lo mpn/brootinv.lo mpn/bsqrt.lo mpn/bsqrtinv.lo mpn/divexact.lo mpn/bdiv_dbm1c.lo mpn/redc_1.lo mpn/redc_2.lo mpn/redc_n.lo mpn/powm.lo mpn/powlo.lo mpn/sec_powm.lo mpn/sec_mul.lo mpn/sec_sqr.lo mpn/sec_div_qr.lo mpn/sec_div_r.lo mpn/sec_pi1_div_qr.lo mpn/sec_pi1_div_r.lo mpn/sec_add_1.lo mpn/sec_sub_1.lo mpn/sec_invert.lo mpn/trialdiv.lo mpn/remove.lo mpn/and_n.lo mpn/andn_n.lo mpn/nand_n.lo mpn/ior_n.lo mpn/iorn_n.lo mpn/nior_n.lo mpn/xor_n.lo mpn/xnor_n.lo mpn/copyi.lo mpn/copyd.lo mpn/zero.lo mpn/sec_tabselect.lo mpn/comb_tables.lo mpn/add_n_sub_n.lo printf/asprintf.lo printf/asprntffuns.lo printf/doprnt.lo printf/doprntf.lo printf/doprnti.lo printf/fprintf.lo printf/obprintf.lo printf/obvprintf.lo printf/obprntffuns.lo printf/printf.lo printf/printffuns.lo printf/snprintf.lo printf/snprntffuns.lo printf/sprintf.lo printf/sprintffuns.lo printf/vasprintf.lo printf/vfprintf.lo printf/vprintf.lo printf/vsnprintf.lo printf/vsprintf.lo printf/repl-vsnprintf.lo  scanf/doscan.lo scanf/fscanf.lo scanf/fscanffuns.lo scanf/scanf.lo scanf/sscanf.lo scanf/sscanffuns.lo scanf/vfscanf.lo scanf/vscanf.lo scanf/vsscanf.lo rand/rand.lo rand/randclr.lo rand/randdef.lo rand/randiset.lo rand/randlc2s.lo rand/randlc2x.lo rand/randmt.lo rand/randmts.lo rand/rands.lo rand/randsd.lo rand/randsdui.lo rand/randbui.lo rand/randmui.lo 
#copying selected object files to avoid basename conflicts...
echo "copying selected object files to avoid basename conflicts..."
cd /android/weiguo/gcc-6.4.0/gmp 
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
ar rc libgmp.a assert.o compat.o errno.o extract-dbl.o invalid.o memory.o mp_bpl.o mp_clz_tab.o mp_dv_tab.o mp_minv_tab.o mp_get_fns.o mp_set_fns.o version.o nextprime.o primesieve.o tal-reent.o mpf/init.o mpf/init2.o mpf/inits.o mpf/set.o mpf/set_ui.o mpf/set_si.o mpf/set_str.o mpf/set_d.o mpf/set_z.o mpf/iset.o mpf/iset_ui.o mpf/iset_si.o mpf/iset_str.o mpf/iset_d.o mpf/clear.o mpf/clears.o mpf/get_str.o mpf/dump.o mpf/size.o mpf/eq.o mpf/reldiff.o mpf/sqrt.o mpf/random2.o mpf/inp_str.o mpf/out_str.o mpf/add.o mpf/add_ui.o mpf/sub.o mpf/sub_ui.o mpf/ui_sub.o mpf/mul.o mpf/mul_ui.o mpf/div.o mpf/div_ui.o mpf/cmp_z.o mpf/cmp.o mpf/cmp_d.o mpf/cmp_ui.o mpf/cmp_si.o mpf/mul_2exp.o mpf/div_2exp.o mpf/abs.o mpf/neg.o mpf/set_q.o mpf/get_d.o mpf/get_d_2exp.o mpf/set_dfl_prec.o mpf/set_prc.o mpf/set_prc_raw.o mpf/get_dfl_prec.o mpf/get_prc.o mpf/ui_div.o mpf/sqrt_ui.o mpf/ceilfloor.o mpf/trunc.o mpf/pow_ui.o mpf/urandomb.o mpf/swap.o mpf/fits_sint.o mpf/fits_slong.o mpf/fits_sshort.o mpf/fits_uint.o mpf/fits_ulong.o mpf/fits_ushort.o mpf/get_si.o mpf/get_ui.o mpf/int_p.o .libs/libgmp.lax/lt1-abs.o .libs/libgmp.lax/lt2-add.o .libs/libgmp.lax/lt3-add_ui.o mpz/aorsmul.o mpz/aorsmul_i.o mpz/and.o mpz/array_init.o mpz/bin_ui.o mpz/bin_uiui.o mpz/cdiv_q.o mpz/cdiv_q_ui.o mpz/cdiv_qr.o mpz/cdiv_qr_ui.o mpz/cdiv_r.o mpz/cdiv_r_ui.o mpz/cdiv_ui.o mpz/cfdiv_q_2exp.o mpz/cfdiv_r_2exp.o .libs/libgmp.lax/lt4-clear.o .libs/libgmp.lax/lt5-clears.o mpz/clrbit.o .libs/libgmp.lax/lt6-cmp.o .libs/libgmp.lax/lt7-cmp_d.o .libs/libgmp.lax/lt8-cmp_si.o .libs/libgmp.lax/lt9-cmp_ui.o mpz/cmpabs.o mpz/cmpabs_d.o mpz/cmpabs_ui.o mpz/com.o mpz/combit.o mpz/cong.o mpz/cong_2exp.o mpz/cong_ui.o mpz/divexact.o mpz/divegcd.o mpz/dive_ui.o mpz/divis.o mpz/divis_ui.o mpz/divis_2exp.o .libs/libgmp.lax/lt10-dump.o mpz/export.o mpz/mfac_uiui.o mpz/2fac_ui.o mpz/fac_ui.o mpz/oddfac_1.o mpz/prodlimbs.o mpz/fdiv_q_ui.o mpz/fdiv_qr.o mpz/fdiv_qr_ui.o mpz/fdiv_r.o mpz/fdiv_r_ui.o mpz/fdiv_q.o mpz/fdiv_ui.o mpz/fib_ui.o mpz/fib2_ui.o .libs/libgmp.lax/lt11-fits_sint.o .libs/libgmp.lax/lt12-fits_slong.o .libs/libgmp.lax/lt13-fits_sshort.o .libs/libgmp.lax/lt14-fits_uint.o .libs/libgmp.lax/lt15-fits_ulong.o .libs/libgmp.lax/lt16-fits_ushort.o mpz/gcd.o mpz/gcd_ui.o mpz/gcdext.o .libs/libgmp.lax/lt17-get_d.o .libs/libgmp.lax/lt18-get_d_2exp.o .libs/libgmp.lax/lt19-get_si.o .libs/libgmp.lax/lt20-get_str.o .libs/libgmp.lax/lt21-get_ui.o mpz/getlimbn.o mpz/hamdist.o mpz/import.o .libs/libgmp.lax/lt22-init.o .libs/libgmp.lax/lt23-init2.o .libs/libgmp.lax/lt24-inits.o mpz/inp_raw.o .libs/libgmp.lax/lt25-inp_str.o mpz/invert.o mpz/ior.o .libs/libgmp.lax/lt26-iset.o .libs/libgmp.lax/lt27-iset_d.o .libs/libgmp.lax/lt28-iset_si.o .libs/libgmp.lax/lt29-iset_str.o .libs/libgmp.lax/lt30-iset_ui.o mpz/jacobi.o mpz/kronsz.o mpz/kronuz.o mpz/kronzs.o mpz/kronzu.o mpz/lcm.o mpz/lcm_ui.o mpz/limbs_finish.o mpz/limbs_modify.o mpz/limbs_read.o mpz/limbs_write.o mpz/lucnum_ui.o mpz/lucnum2_ui.o mpz/millerrabin.o mpz/mod.o .libs/libgmp.lax/lt31-mul.o .libs/libgmp.lax/lt32-mul_2exp.o mpz/mul_si.o .libs/libgmp.lax/lt33-mul_ui.o mpz/n_pow_ui.o .libs/libgmp.lax/lt34-neg.o .libs/libgmp.lax/lt35-nextprime.o mpz/out_raw.o .libs/libgmp.lax/lt36-out_str.o mpz/perfpow.o mpz/perfsqr.o mpz/popcount.o .libs/libgmp.lax/lt37-pow_ui.o mpz/powm.o mpz/powm_sec.o mpz/powm_ui.o mpz/primorial_ui.o mpz/pprime_p.o mpz/random.o .libs/libgmp.lax/lt38-random2.o mpz/realloc.o mpz/realloc2.o mpz/remove.o mpz/roinit_n.o mpz/root.o mpz/rootrem.o mpz/rrandomb.o mpz/scan0.o mpz/scan1.o .libs/libgmp.lax/lt39-set.o .libs/libgmp.lax/lt40-set_d.o mpz/set_f.o .libs/libgmp.lax/lt41-set_q.o .libs/libgmp.lax/lt42-set_si.o .libs/libgmp.lax/lt43-set_str.o .libs/libgmp.lax/lt44-set_ui.o mpz/setbit.o .libs/libgmp.lax/lt45-size.o mpz/sizeinbase.o .libs/libgmp.lax/lt46-sqrt.o mpz/sqrtrem.o .libs/libgmp.lax/lt47-sub.o .libs/libgmp.lax/lt48-sub_ui.o .libs/libgmp.lax/lt49-swap.o mpz/tdiv_ui.o mpz/tdiv_q.o mpz/tdiv_q_2exp.o mpz/tdiv_q_ui.o mpz/tdiv_qr.o mpz/tdiv_qr_ui.o mpz/tdiv_r.o mpz/tdiv_r_2exp.o mpz/tdiv_r_ui.o mpz/tstbit.o mpz/ui_pow_ui.o .libs/libgmp.lax/lt50-ui_sub.o .libs/libgmp.lax/lt51-urandomb.o mpz/urandomm.o mpz/xor.o .libs/libgmp.lax/lt52-abs.o mpq/aors.o mpq/canonicalize.o .libs/libgmp.lax/lt53-clear.o .libs/libgmp.lax/lt54-clears.o .libs/libgmp.lax/lt55-cmp.o .libs/libgmp.lax/lt56-cmp_si.o .libs/libgmp.lax/lt57-cmp_ui.o .libs/libgmp.lax/lt58-div.o .libs/libgmp.lax/lt59-get_d.o mpq/get_den.o mpq/get_num.o .libs/libgmp.lax/lt60-get_str.o .libs/libgmp.lax/lt61-init.o .libs/libgmp.lax/lt62-inits.o .libs/libgmp.lax/lt63-inp_str.o mpq/inv.o mpq/md_2exp.o .libs/libgmp.lax/lt64-mul.o .libs/libgmp.lax/lt65-neg.o .libs/libgmp.lax/lt66-out_str.o .libs/libgmp.lax/lt67-set.o mpq/set_den.o mpq/set_num.o .libs/libgmp.lax/lt68-set_si.o .libs/libgmp.lax/lt69-set_str.o .libs/libgmp.lax/lt70-set_ui.o mpq/equal.o .libs/libgmp.lax/lt71-set_z.o .libs/libgmp.lax/lt72-set_d.o .libs/libgmp.lax/lt73-set_f.o .libs/libgmp.lax/lt74-swap.o mpn/fib_table.o mpn/mp_bases.o .libs/libgmp.lax/lt75-add.o mpn/add_1.o mpn/add_n.o .libs/libgmp.lax/lt76-sub.o mpn/sub_1.o mpn/sub_n.o mpn/cnd_add_n.o mpn/cnd_sub_n.o mpn/cnd_swap.o .libs/libgmp.lax/lt77-neg.o .libs/libgmp.lax/lt78-com.o mpn/mul_1.o mpn/addmul_1.o mpn/submul_1.o mpn/add_err1_n.o mpn/add_err2_n.o mpn/add_err3_n.o mpn/sub_err1_n.o mpn/sub_err2_n.o mpn/sub_err3_n.o mpn/lshift.o mpn/rshift.o mpn/dive_1.o mpn/diveby3.o .libs/libgmp.lax/lt79-divis.o mpn/divrem.o mpn/divrem_1.o mpn/divrem_2.o .libs/libgmp.lax/lt80-fib2_ui.o mpn/mod_1.o mpn/mod_34lsub1.o mpn/mode1o.o mpn/pre_divrem_1.o mpn/pre_mod_1.o .libs/libgmp.lax/lt81-dump.o mpn/mod_1_1.o mpn/mod_1_2.o mpn/mod_1_3.o mpn/mod_1_4.o mpn/lshiftc.o .libs/libgmp.lax/lt82-mul.o mpn/mul_fft.o mpn/mul_n.o mpn/sqr.o mpn/mul_basecase.o mpn/sqr_basecase.o mpn/nussbaumer_mul.o mpn/mulmid_basecase.o mpn/toom42_mulmid.o mpn/mulmid_n.o mpn/mulmid.o .libs/libgmp.lax/lt83-random.o .libs/libgmp.lax/lt84-random2.o mpn/pow_1.o .libs/libgmp.lax/lt85-rootrem.o .libs/libgmp.lax/lt86-sqrtrem.o .libs/libgmp.lax/lt87-sizeinbase.o .libs/libgmp.lax/lt88-get_str.o .libs/libgmp.lax/lt89-set_str.o .libs/libgmp.lax/lt90-scan0.o .libs/libgmp.lax/lt91-scan1.o .libs/libgmp.lax/lt92-popcount.o .libs/libgmp.lax/lt93-hamdist.o .libs/libgmp.lax/lt94-cmp.o mpn/zero_p.o .libs/libgmp.lax/lt95-perfsqr.o .libs/libgmp.lax/lt96-perfpow.o mpn/gcd_1.o .libs/libgmp.lax/lt97-gcd.o mpn/gcdext_1.o .libs/libgmp.lax/lt98-gcdext.o mpn/gcd_subdiv_step.o mpn/gcdext_lehmer.o mpn/div_q.o .libs/libgmp.lax/lt99-tdiv_qr.o mpn/jacbase.o mpn/jacobi_2.o .libs/libgmp.lax/lt100-jacobi.o .libs/libgmp.lax/lt101-get_d.o mpn/matrix22_mul.o mpn/matrix22_mul1_inverse_vector.o mpn/hgcd_matrix.o mpn/hgcd2.o mpn/hgcd_step.o mpn/hgcd_reduce.o mpn/hgcd.o mpn/hgcd_appr.o mpn/hgcd2_jacobi.o mpn/hgcd_jacobi.o mpn/mullo_n.o mpn/mullo_basecase.o mpn/sqrlo.o mpn/sqrlo_basecase.o mpn/toom22_mul.o mpn/toom32_mul.o mpn/toom42_mul.o mpn/toom52_mul.o mpn/toom62_mul.o mpn/toom33_mul.o mpn/toom43_mul.o mpn/toom53_mul.o mpn/toom54_mul.o mpn/toom63_mul.o mpn/toom44_mul.o mpn/toom6h_mul.o mpn/toom6_sqr.o mpn/toom8h_mul.o mpn/toom8_sqr.o mpn/toom_couple_handling.o mpn/toom2_sqr.o mpn/toom3_sqr.o mpn/toom4_sqr.o mpn/toom_eval_dgr3_pm1.o mpn/toom_eval_dgr3_pm2.o mpn/toom_eval_pm1.o mpn/toom_eval_pm2.o mpn/toom_eval_pm2exp.o mpn/toom_eval_pm2rexp.o mpn/toom_interpolate_5pts.o mpn/toom_interpolate_6pts.o mpn/toom_interpolate_7pts.o mpn/toom_interpolate_8pts.o mpn/toom_interpolate_12pts.o mpn/toom_interpolate_16pts.o mpn/invertappr.o .libs/libgmp.lax/lt102-invert.o mpn/binvert.o mpn/mulmod_bnm1.o mpn/sqrmod_bnm1.o mpn/div_qr_1.o mpn/div_qr_1n_pi1.o mpn/div_qr_2.o mpn/div_qr_2n_pi1.o mpn/div_qr_2u_pi1.o mpn/sbpi1_div_q.o mpn/sbpi1_div_qr.o mpn/sbpi1_divappr_q.o mpn/dcpi1_div_q.o mpn/dcpi1_div_qr.o mpn/dcpi1_divappr_q.o mpn/mu_div_qr.o mpn/mu_divappr_q.o mpn/mu_div_q.o mpn/bdiv_q_1.o mpn/sbpi1_bdiv_q.o mpn/sbpi1_bdiv_qr.o mpn/dcpi1_bdiv_q.o mpn/dcpi1_bdiv_qr.o mpn/mu_bdiv_q.o mpn/mu_bdiv_qr.o mpn/bdiv_q.o mpn/bdiv_qr.o mpn/broot.o mpn/brootinv.o mpn/bsqrt.o mpn/bsqrtinv.o .libs/libgmp.lax/lt103-divexact.o mpn/bdiv_dbm1c.o mpn/redc_1.o mpn/redc_2.o mpn/redc_n.o .libs/libgmp.lax/lt104-powm.o mpn/powlo.o mpn/sec_powm.o mpn/sec_mul.o mpn/sec_sqr.o mpn/sec_div_qr.o mpn/sec_div_r.o mpn/sec_pi1_div_qr.o mpn/sec_pi1_div_r.o mpn/sec_add_1.o mpn/sec_sub_1.o mpn/sec_invert.o mpn/trialdiv.o .libs/libgmp.lax/lt105-remove.o mpn/and_n.o mpn/andn_n.o mpn/nand_n.o mpn/ior_n.o mpn/iorn_n.o mpn/nior_n.o mpn/xor_n.o mpn/xnor_n.o mpn/copyi.o mpn/copyd.o mpn/zero.o mpn/sec_tabselect.o mpn/comb_tables.o mpn/add_n_sub_n.o printf/asprintf.o printf/asprntffuns.o printf/doprnt.o printf/doprntf.o printf/doprnti.o printf/fprintf.o printf/obprintf.o printf/obvprintf.o printf/obprntffuns.o printf/printf.o printf/printffuns.o printf/snprintf.o printf/snprntffuns.o printf/sprintf.o printf/sprintffuns.o printf/vasprintf.o printf/vfprintf.o printf/vprintf.o printf/vsnprintf.o printf/vsprintf.o printf/repl-vsnprintf.o scanf/doscan.o scanf/fscanf.o scanf/fscanffuns.o scanf/scanf.o scanf/sscanf.o scanf/sscanffuns.o scanf/vfscanf.o scanf/vscanf.o scanf/vsscanf.o rand/rand.o rand/randclr.o rand/randdef.o rand/randiset.o rand/randlc2s.o rand/randlc2x.o rand/randmt.o rand/randmts.o rand/rands.o rand/randsd.o rand/randsdui.o rand/randbui.o rand/randmui.o
ranlib libgmp.a
#libtool: link: rm -fr .libs/libgmp.lax
#libtool: link: ( cd ".libs" && rm -f "libgmp.la" && ln -s "../libgmp.la" "libgmp.la" )
#make[2]: Leaving directory `/android/build/gmp'
#make[1]: Leaving directory `/android/build/gmp'
