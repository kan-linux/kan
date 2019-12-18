(define_conditions [
  (-1 "TARGET_MMX && ix86_binary_operator_ok (AND, V4HImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4DImode == V16SFmode
							      || V4DImode == V8DFmode
							      || V4DImode == V8DImode
							      || V4DImode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "Pmode == DImode")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V4SImode == V16SFmode
									      || V4SImode == V8DFmode
									      || V4SImode == V8DImode
									      || V4SImode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (ASHIFTRT, SImode, operands)")
  (-1 "(TARGET_AVOID_VECTOR_DECODE
   && SSE_FLOAT_MODE_P (SFmode)
   && optimize_insn_for_speed_p ()) && (TARGET_64BIT)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "((optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& (TARGET_SHIFT1
	    || (TARGET_DOUBLE_WITH_ADD && REG_P (operands[0])))))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512VBMI)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "(TARGET_AVX512IFMA) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_MINUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_SSE2) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (AND, V16HImode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_AVX && 1")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX)")
  (-1 "(TARGET_SSE_MATH) && (TARGET_AVX)")
  (-1 "SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH")
  (-1 "(!(fixed_regs[AX_REG] || fixed_regs[CX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "TARGET_64BIT
   && TARGET_CMOVE && !(MEM_P (operands[2]) && MEM_P (operands[3]))")
  (-1 "(TARGET_AVX512BW) && (TARGET_AVX512VL)")
  (-1 "(!TARGET_X32) && (word_mode == DImode)")
  (-1 "!(TARGET_PUSH_MEMORY || optimize_insn_for_size_p ())
   && !RTX_FRAME_RELATED_P (peep2_next_insn (0))")
  (-1 "TARGET_80387 && TARGET_SAHF && !TARGET_CMOVE
   && (TARGET_USE_SIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (IOR, V4DFmode, operands)) && (TARGET_AVX))")
  (-1 "ix86_binary_operator_ok (MINUS, HImode, operands)")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[AX_REG] || fixed_regs[CX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V32QImode)
       == GET_MODE_NUNITS (V32QImode))")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
       && !flag_trapping_math)")
  (-1 "TARGET_64BIT
   && exact_log2 (INTVAL (operands[2])) >= 0
   && REGNO (operands[0]) == REGNO (operands[1])
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && ((((TARGET_AVX512VL) && (Pmode == SImode)) && (Pmode == SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512VL)")
  (-1 "(TARGET_SSE
   && 1 && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ix86_binary_operator_ok (MULT, V4HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMAX, V16SFmode, operands)
   && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V8DImode, operands))")
  (-1 "(TARGET_64BIT && TARGET_XSAVE) && (TARGET_XSAVEOPT)")
  (-1 "TARGET_FMA || TARGET_AVX512F")
  (-1 "ix86_binary_operator_ok (ROTATERT, SImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1")
  (-1 "TARGET_64BIT && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_80387 || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)) && (TARGET_64BIT)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DFmode)
       == GET_MODE_NUNITS (V32HImode))) && (TARGET_AVX512BW)")
  (-1 "(TARGET_80387 && TARGET_SAHF && !TARGET_CMOVE) && ( reload_completed)")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V32QImode)
       == GET_MODE_NUNITS (V4DFmode))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V2DImode)
       == GET_MODE_NUNITS (V4SImode))")
  (-1 "(TARGET_LZCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "TARGET_AVX512VL && TARGET_AVX512F")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (LSHIFTRT, SImode, operands)")
  (-1 "(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
   || (TARGET_SSE && (DFmode == TFmode))")
  (-1 "(TARGET_XOP) && (TARGET_AVX512F)")
  (-1 "TARGET_SSE && 1")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V8HImode)
       == GET_MODE_NUNITS (V16QImode))")
  (-1 "(INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V2DImode, operands))")
  (-1 "TARGET_TBM")
  (-1 "(TARGET_64BIT && TARGET_SSE) && ( reload_completed)")
  (-1 "ix86_unary_operator_ok (NEG, HImode, operands)")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || DImode != DImode))
	&& TARGET_SSE_MATH)
   && can_create_pseudo_p ()")
  (-1 "TARGET_ROUND && !flag_trapping_math")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (IOR, V16QImode, operands))")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V4SImode, operands)")
  (-1 "TARGET_USE_FANCY_MATH_387
   && can_create_pseudo_p ()")
  (-1 "TARGET_SSE2
   && ((unsigned) exact_log2 (INTVAL (operands[3]))
       < GET_MODE_NUNITS (V8HImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (AND, V2DImode, operands))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V8SFmode, operands)) && (TARGET_AVX)")
  (-1 "(!(MEM_P (operands[1]) && MEM_P (operands[2]))) && (TARGET_HIMODE_MATH)")
  (-1 "(TARGET_AVX512BW && 1) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE
   && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (32 == 64 || TARGET_AVX512VL)
   && avx_vpermilp_parallel (operands[2], V4DFmode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V2DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (XOR, V8HImode, operands))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V8HImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& (TARGET_SHIFT1
	    || (TARGET_DOUBLE_WITH_ADD && REG_P (operands[0])))))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFT, QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_MINUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V2DFmode, operands) && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "((TARGET_DOUBLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "TARGET_64BIT")
  (-1 "TARGET_SSSE3 && 1 && 1")
  (-1 "(TARGET_SSE2
   && 1 && 1) && (TARGET_AVX2)")
  (-1 "(TARGET_SSE2 && (V16SFmode == V4SFmode || TARGET_AVX2)) && (TARGET_AVX512F)")
  (-1 "(((TARGET_BMI || TARGET_GENERIC)
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)) && ( reload_completed)")
  (-1 "(!(fixed_regs[AX_REG] || fixed_regs[CX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "TARGET_AVX512DQ
   && (INTVAL (operands[2]) % 2 == 0)
   && (INTVAL (operands[2]) == INTVAL (operands[3]) - 1)
   && rtx_equal_p (operands[4], operands[0])")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V8SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V4SFmode, operands)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MINUS, V4DFmode, operands) && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (XOR, V4SImode, operands))")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V4DImode)
       == GET_MODE_NUNITS (V4DFmode))")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V2SImode == V1DImode))
   && ix86_binary_operator_ok (MINUS, V2SImode, operands)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (PLUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "optimize_insn_for_speed_p ()
   && ((TARGET_NOT_UNPAIRABLE
	&& (!MEM_P (operands[0])
	    || !memory_displacement_operand (operands[0], QImode)))
       || (TARGET_NOT_VECTORMODE
	   && long_memory_operand (operands[0], QImode)))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V32HImode)
       == GET_MODE_NUNITS (V64QImode))) && (TARGET_AVX512BW)")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (LSHIFTRT, QImode, operands)")
  (-1 "(TARGET_SSP_TLS_GUARD) && (ptr_mode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V16QImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (AND, V16SImode, operands)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ( reload_completed)")
  (-1 "TARGET_AVX512F
   && 1
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V32HImode)
       == GET_MODE_NUNITS (V16SImode))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(!TARGET_64BIT && TARGET_XSAVE) && (TARGET_XSAVEOPT)")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (MULT, V8HImode, operands)
   && 1 && 1")
  (-1 "(TARGET_64BIT && TARGET_SSE) && (TARGET_SSE2)")
  (-1 "(ix86_binary_operator_ok (ASHIFT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && TARGET_64BIT)")
  (-1 "TARGET_80387 && TARGET_CMOVE
   && !(MEM_P (operands[2]) && MEM_P (operands[3]))")
  (-1 "TARGET_64BIT
   && (optimize_function_for_size_p (cfun)
       || !TARGET_PARTIAL_FLAG_REG_STALL
       || (operands[2] == const1_rtx
	   && TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (LSHIFTRT, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V16SFmode, operands) && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (EQ, V8QImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (IOR, V2DImode, operands))")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (DFmode, SImode)
   && !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
   && (TARGET_USE_SIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (IOR, V16QImode, operands)")
  (-1 "TARGET_80387 && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (SMAX, V4SImode, operands)")
  (-1 "((TARGET_SINGLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "TARGET_AVOID_VECTOR_DECODE
   && SSE_FLOAT_MODE_P (DFmode)
   && optimize_insn_for_speed_p ()")
  (-1 "((TARGET_DOUBLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -2*GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && (((((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[1] == const1_rtx
	&& (TARGET_SHIFT1
	    || (TARGET_DOUBLE_WITH_ADD && REG_P (operands[0])))))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V16HImode, operands)) && (TARGET_AVX512VL)")
  (-1 "!(MEM_P (operands[0]) && MEM_P (operands[1]))
   && (lra_in_progress || reload_completed
       || (ix86_cmodel == CM_MEDIUM || ix86_cmodel == CM_LARGE)
       || !CONST_DOUBLE_P (operands[1])
       || (optimize_function_for_size_p (cfun)
	   && ((!TARGET_SSE_MATH
		&& standard_80387_constant_p (operands[1]) > 0)
	       || (TARGET_SSE_MATH
		   && standard_sse_constant_p (operands[1]))))
       || memory_operand (operands[0], SFmode)
       || !TARGET_HARD_SF_REGS)")
  (-1 "TARGET_FMA4")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512F && (V8DImode == V16SFmode
									      || V8DImode == V8DFmode
									      || V8DImode == V8DImode
									      || V8DImode == V16SImode)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE
   && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "((TARGET_SINGLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && ((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(ix86_unary_operator_ok (NEG, TImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_AVX512VL && TARGET_AVX512F
   && rtx_equal_p (operands[2], operands[0])")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ix86_binary_operator_ok (PLUS, V4HImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE)")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (PLUS, HImode, operands)")
  (-1 "TARGET_80387 && !TARGET_CMOVE
   && reload_completed")
  (-1 "(TARGET_USE_FANCY_MATH_387
   && flag_unsafe_math_optimizations
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V4DFmode)
       == GET_MODE_NUNITS (V4DFmode))")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (AND, DImode, operands)")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A) && (Pmode == DImode)")
  (-1 "ix86_unary_operator_ok (NEG, SImode, operands)
   && mode_signbit_p (SImode, operands[2])")
  (-1 "TARGET_64BIT
   && (optimize_function_for_size_p (cfun)
       || !TARGET_PARTIAL_FLAG_REG_STALL
       || (operands[2] == const1_rtx
	   && (TARGET_SHIFT1
	       || TARGET_DOUBLE_WITH_ADD)))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFT, SImode, operands)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DImode)
       == GET_MODE_NUNITS (V8SImode))")
  (-1 "((TARGET_DOUBLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -2*GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && (((((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || SImode != DImode))
	&& TARGET_SSE_MATH)
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "reload_completed
   && true_regnum (operands[0]) != true_regnum (operands[1])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (AND, V4DImode, operands)) && (TARGET_AVX))")
  (-1 "optimize_insn_for_speed_p ()
   && ((HImode == HImode
       && TARGET_LCP_STALL)
       || (TARGET_SPLIT_LONG_MOVES
          && get_attr_length (insn) >= ix86_cur_cost ()->large_insn))")
  (-1 "TARGET_PCLMUL")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (INTVAL (operands[2]) == INTVAL (operands[3]) - 1))")
  (-1 "REGNO (operands[0]) != REGNO (operands[1])
   && ((MMX_REGNO_P (REGNO (operands[0]))
        && MMX_REGNO_P (REGNO (operands[1]))) 
       || (SSE_REGNO_P (REGNO (operands[0]))
           && SSE_REGNO_P (REGNO (operands[1]))))")
  (-1 "(TARGET_TBM) && (TARGET_64BIT)")
  (-1 "(TARGET_SSSE3 && 1 && 1
   && ix86_binary_operator_ok (MULT, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V8SFmode, operands) && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "((optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (LSHIFTRT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2)")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (ASHIFT, SImode, operands)")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (PLUS, V16HImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || DImode != DImode))
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "(TARGET_SSE2 && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_ROUND) && (TARGET_AVX512F)")
  (-1 "(TARGET_SSE2 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V8HImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V8SImode, operands)) && (TARGET_AVX2)")
  (-1 "!TARGET_64BIT && TARGET_GNU_TLS")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE
   && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512F))")
  (-1 "TARGET_SSE3 && reload_completed")
  (-1 "ix86_binary_operator_ok (AND, SImode, operands)")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V8SFmode)
       == GET_MODE_NUNITS (V4DFmode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512BW) && (TARGET_AVX512VL))")
  (-1 "!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && ix86_binary_operator_ok (IOR, DImode, operands)")
  (-1 "(TARGET_AVX && 1
   && avx_vpermilp_parallel (operands[2], V16SFmode)) && (TARGET_AVX512F)")
  (-1 "(TARGET_SSP_TLS_GUARD) && (ptr_mode == DImode)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (XOR, QImode, operands)")
  (-1 "(optimize_insn_for_size_p ()
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "((GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
   && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && (GET_MODE (operands[0]) == GET_MODE (operands[3])
       || GET_MODE (operands[3]) == VOIDmode)) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX512BW))")
  (-1 "TARGET_80387 && TARGET_CMOVE")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V8SImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512BW && TARGET_AVX512VL) && (TARGET_AVX2)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (DFmode, DImode)")
  (-1 "(TARGET_LZCNT) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V16SImode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || SImode != DImode))
   && can_create_pseudo_p ()")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V4SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V8SImode, operands)) && (TARGET_AVX)")
  (-1 "TARGET_SSE && reload_completed")
  (-1 "(DFmode != DFmode || TARGET_64BIT)
   && TARGET_80387 && TARGET_CMOVE
   && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && optimize_insn_for_speed_p ()")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DImode)
       == GET_MODE_NUNITS (V8DFmode))")
  (-1 "TARGET_3DNOW || TARGET_PREFETCH_SSE || TARGET_PRFCHW || TARGET_PREFETCHWT1")
  (-1 "(TARGET_64BIT && TARGET_XSAVE) && (TARGET_XSAVEC)")
  (0 "(TARGET_AVX512F) && (TARGET_SSE
   && 1 && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode))")
  (-1 "(SFmode != DFmode || TARGET_64BIT)
   && TARGET_80387 && TARGET_CMOVE
   && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && optimize_insn_for_speed_p ()")
  (-1 "reload_completed && ix86_avoid_lea_for_addr (insn, operands)")
  (-1 "optimize_insn_for_speed_p () && ix86_match_ccmode (insn, CCNOmode)")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V4SImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_64BIT || TARGET_SSE)
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))
   && (lra_in_progress || reload_completed
       || (ix86_cmodel == CM_MEDIUM || ix86_cmodel == CM_LARGE)
       || !CONST_DOUBLE_P (operands[1])
       || (optimize_function_for_size_p (cfun)
	   && standard_sse_constant_p (operands[1])
	   && !memory_operand (operands[0], TFmode))
       || (!TARGET_MEMORY_MISMATCH_STALL
	   && memory_operand (operands[0], TFmode)))")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (MULT, V4SFmode, operands) && 1 && 1")
  (-1 "TARGET_MMX")
  (-1 "!TARGET_64BIT && (TARGET_80387 || TARGET_SSE)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_PLUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512VL && TARGET_AVX512F)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
       && HImode != HImode 
       && ((HImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V8SFmode, operands)) && (TARGET_AVX)")
  (-1 "!TARGET_64BIT && TARGET_SSE2 && TARGET_SSE_MATH")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[5]) == (INTVAL (operands[6]) - 1)
       && INTVAL (operands[7]) == (INTVAL (operands[8]) - 1)
       && INTVAL (operands[9]) == (INTVAL (operands[10]) - 1)))")
  (-1 "TARGET_AVX2
   && 1
   && INTVAL (operands[2]) + 4 == INTVAL (operands[6])
   && INTVAL (operands[3]) + 4 == INTVAL (operands[7])
   && INTVAL (operands[4]) + 4 == INTVAL (operands[8])
   && INTVAL (operands[5]) + 4 == INTVAL (operands[9])")
  (-1 "TARGET_SSE && 1 && 1")
  (-1 "TARGET_64BIT && TARGET_SSE_MATH")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (IOR, V8QImode, operands)")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (IOR, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE4_1 && ix86_binary_operator_ok (MULT, V8SImode, operands) && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX2))")
  (-1 "TARGET_ROUND")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V2DImode == V16SFmode
									      || V2DImode == V8DFmode
									      || V2DImode == V8DImode
									      || V2DImode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "(!TARGET_64BIT
   && TARGET_80387 && X87_ENABLE_FLOAT (DFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC) && ( reload_completed)")
  (-1 "(TARGET_STV && TARGET_SSE2) || TARGET_64BIT")
  (-1 "(!(fixed_regs[AX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "(TARGET_SSE4_1) && (TARGET_SSE2)")
  (-1 "! TARGET_PARTIAL_REG_STALL && reload_completed
   && optimize_insn_for_speed_p ()
   && ((GET_MODE (operands[1]) == HImode && ! TARGET_FAST_PREFIX)
       || (GET_MODE (operands[1]) == QImode && TARGET_PROMOTE_QImode))
   /* Ensure that the operand will remain sign-extended immediate.  */
   && ix86_match_ccmode (insn, INTVAL (operands[4]) >= 0 ? CCNOmode : CCZmode)")
  (-1 "TARGET_80387 || (TARGET_64BIT && SSE_FLOAT_MODE_P (DFmode))")
  (-1 "(TARGET_AVX512F && 1) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX2 && 1) && (TARGET_AVX512VL)")
  (-1 "SSE_FLOAT_MODE_P (DFmode)
   && (!TARGET_FISTTP || TARGET_SSE_MATH)")
  (-1 "(!TARGET_64BIT
   && TARGET_80387 && X87_ENABLE_FLOAT (XFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (MULT, V16SImode, operands))")
  (-1 "TARGET_BMI2 && reload_completed")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && 1 && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX && !(MEM_P (operands[0]) && MEM_P (operands[1]))) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (PLUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (EQ, V64QImode, operands)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (XOR, V16SFmode, operands)")
  (-1 "(reload_completed
   && true_regnum (operands[0]) != true_regnum (operands[1])) && (TARGET_64BIT)")
  (-1 "(ix86_binary_operator_ok (IOR, DImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (IOR, V4HImode, operands)")
  (-1 "((TARGET_SINGLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && ((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V4DImode == V16SFmode
									      || V4DImode == V8DFmode
									      || V4DImode == V8DImode
									      || V4DImode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V64QImode)
       == GET_MODE_NUNITS (V16SFmode))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DFmode)
       == GET_MODE_NUNITS (V16SFmode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_FMA) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V4DFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V8SFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (IOR, V8SImode, operands)) && (TARGET_AVX))")
  (-1 "(TARGET_SSE) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (PLUS, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX && 1
   && avx_vpermilp_parallel (operands[2], V8DFmode)) && (TARGET_AVX512F)")
  (1 "!TARGET_PARTIAL_REG_STALL
   || SImode == SImode
   || optimize_function_for_size_p (cfun)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V16QImode)
       == GET_MODE_NUNITS (V8HImode))")
  (-1 "(TARGET_SSSE3 || TARGET_AVX || TARGET_XOP) && (TARGET_AVX512VBMI)")
  (-1 "TARGET_SSE4A")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SImode)
       == GET_MODE_NUNITS (V4DImode))")
  (-1 "(SIBLING_CALL_P (insn)) && (word_mode == SImode)")
  (-1 "TARGET_64BIT
   && ix86_match_ccmode (insn, CCGCmode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSSE3 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (MULT, V8HImode, operands))")
  (-1 "(TARGET_SSE2) && (TARGET_AVX512BW)")
  (-1 "reload_completed
   && !SSE_REG_P (operands[0]) && !SSE_REG_P (operands[1])")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SImode)
       == GET_MODE_NUNITS (V8DFmode))")
  (-1 "TARGET_64BIT && ((optimize > 0 && flag_peephole2)
		    ? epilogue_completed : reload_completed)
   && !symbolic_operand (operands[1], DImode)
   && !x86_64_immediate_operand (operands[1], DImode)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V4DImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_XADD) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (IOR, V4SImode, operands))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (MULT, V4SFmode, operands) && 1 && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode))")
  (-1 "!TARGET_64BIT && TARGET_XSAVE")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_BMI || TARGET_GENERIC)
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (AND, V16SFmode, operands)")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (MINUS, V32QImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_64BIT && reload_completed && ix86_lea_for_add_ok (insn, operands)")
  (-1 "(((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && can_create_pseudo_p ()) && (TARGET_64BIT)) && ( 1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V16SImode, operands)) && (TARGET_AVX512F))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && 1 && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V4DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
   && !COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "!TARGET_64BIT
   && SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V2DImode)
       == GET_MODE_NUNITS (V2DFmode))) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V16SImode, operands)) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (EQ, V8SImode, operands)")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V8HImode)
       == GET_MODE_NUNITS (V2DFmode))) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V8SFmode, operands) && 1 && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "ptr_mode == DImode")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V4SImode, operands)) && (TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (AND, V32HImode, operands)) && (TARGET_AVX512F)")
  (-1 "(GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
   && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && GET_MODE (operands[0]) == GET_MODE (operands[3])")
  (-1 "((!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && reload_completed) && (TARGET_64BIT)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (IOR, V16SFmode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512F && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)))")
  (-1 "TARGET_80387 || (TARGET_SSE2 && TARGET_SSE_MATH)")
  (-1 "(TARGET_SSE && 1 && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V16SFmode, operands) && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(TARGET_CLZERO) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && 1 && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode))")
  (-1 "ix86_match_ccmode (insn, CCNOmode)")
  (-1 "TARGET_F16C || TARGET_AVX512VL")
  (-1 "(reload_completed) && (!TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V8DImode, operands)) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V32QImode)
       == GET_MODE_NUNITS (V8SImode))")
  (-1 "(ix86_match_ccmode (insn, CCmode)) && (TARGET_64BIT)")
  (-1 "TARGET_QIMODE_MATH")
  (-1 "(TARGET_SSE2
   && (GET_MODE_NUNITS (V2DFmode)
       == GET_MODE_NUNITS (V4SImode))) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512BW && (64 == 64 || TARGET_AVX512VL))")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (SFmode, SImode)")
  (-1 "TARGET_SSE2
   && 1 && 1")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V4DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(!TARGET_64BIT && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2 && TARGET_AVX512BW && TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode))")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (MINUS, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "((TARGET_BMI || TARGET_GENERIC)
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX
   && TARGET_AVX512VL && TARGET_AVX512DQ
   && !(MEM_P (operands[0]) && MEM_P (operands[1])))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (IOR, V32HImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE
   && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "(TARGET_AVX512F) && (TARGET_XOP || (TARGET_AVX512BW && TARGET_AVX512VL))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMIN, V16SFmode, operands)
   && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(optimize_insn_for_size_p ()
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun)) && ( reload_completed && GENERAL_REG_P (operands[0]))")
  (-1 "(TARGET_AVX2) && (TARGET_AVX512BW)")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V4DImode)
       == GET_MODE_NUNITS (V8SFmode))")
  (-1 "TARGET_LP64")
  (-1 "TARGET_80387 || reload_completed")
  (-1 "ix86_binary_operator_ok (PLUS, QImode, operands)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SFmode)
       == GET_MODE_NUNITS (V16HImode))")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (MINUS, SImode, operands)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V4SImode)
       == GET_MODE_NUNITS (V4SImode))")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "(!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && !(TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun))) && ( reload_completed && GENERAL_REG_P (operands[0]))")
  (-1 "(TARGET_SSSE3 || TARGET_AVX || TARGET_XOP) && (TARGET_AVX512BW)")
  (-1 "ix86_binary_operator_ok (ROTATE, SImode, operands)")
  (-1 "ix86_binary_operator_ok (MINUS, SImode, operands)")
  (-1 "(!TARGET_64BIT && (TARGET_80387 || TARGET_SSE)) && ( reload_completed)")
  (-1 "SSE_FLOAT_MODE_P (SFmode)
   && (!TARGET_FISTTP || TARGET_SSE_MATH)")
  (-1 "(TARGET_CMOVE && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && optimize_insn_for_speed_p ()) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ix86_binary_operator_ok (UMAX, V8QImode, operands)")
  (-1 "(ix86_match_ccmode (insn, CCGOCmode)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))) && (TARGET_64BIT)")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V1TImode)
       || register_operand (operands[1], V1TImode))")
  (-1 "(TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1
   && can_create_pseudo_p ()")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V64QImode)
       == GET_MODE_NUNITS (V8DImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSSE3 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX512BW))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V32QImode)
       == GET_MODE_NUNITS (V16HImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX && (32 == 64 || TARGET_AVX512VL))")
  (-1 "((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1
   && can_create_pseudo_p ()) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (PLUS, V8DFmode, operands) && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[AX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "(!TARGET_PARTIAL_REG_STALL
   && TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "(TARGET_SSE2 && 1) && (TARGET_AVX2)")
  (-1 "(TARGET_ROUND) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && 1)")
  (-1 "TARGET_SSE2 && ix86_binary_operator_ok (MULT, V2SImode, operands)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V16SImode, operands)) && (TARGET_AVX512F)")
  (-1 "ix86_unary_operator_ok (NEG, QImode, operands)
   && mode_signbit_p (QImode, operands[2])")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && 1) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512BW && (16 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DImode)
       == GET_MODE_NUNITS (V16HImode))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DFmode)
       == GET_MODE_NUNITS (V8DFmode))")
  (-1 "ix86_binary_operator_ok (MINUS, QImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "TARGET_USE_FANCY_MATH_387
   && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)
   && flag_unsafe_math_optimizations
   && standard_80387_constant_p (operands[3]) == 2")
  (-1 "(INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "TARGET_AVX512VL && TARGET_AVX512BW")
  (-1 "(TARGET_CMPXCHG8B) && (!TARGET_64BIT)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V2DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_PLUS, V16QImode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (IOR, V32QImode, operands)) && (TARGET_AVX))")
  (-1 "!TARGET_64BIT && TARGET_GNU2_TLS")
  (-1 "TARGET_SSE && !TARGET_64BIT
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MINUS, V16SFmode, operands) && 1 && 1) && (TARGET_AVX512F)")
  (-1 "TARGET_64BIT
   && TARGET_CMOVE && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && optimize_insn_for_speed_p ()")
  (-1 "TARGET_MWAITX")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (SMAX, V32QImode, operands)")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V4SImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512VL
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[5]) == (INTVAL (operands[6]) - 1)))")
  (-1 "(TARGET_BMI) && (TARGET_64BIT)")
  (-1 "TARGET_AVX
   && avx_vperm2f128_parallel (operands[3], V8SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512VL
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[5]) - 2)
       && INTVAL (operands[3]) == (INTVAL (operands[6]) - 3)
       && INTVAL (operands[7]) == (INTVAL (operands[8]) - 1)
       && INTVAL (operands[7]) == (INTVAL (operands[9]) - 2)
       && INTVAL (operands[7]) == (INTVAL (operands[10]) - 3)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V4DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V4DFmode, operands) && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (IOR, V8DFmode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V16SFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_AVX512BW && 1) && (TARGET_AVX512BW)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V2DImode, operands)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (XOR, V4HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V4DFmode, operands) && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V4DImode == V16SFmode
									      || V4DImode == V8DFmode
									      || V4DImode == V8DImode
									      || V4DImode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (SFmode, SImode)
   && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
   && (TARGET_USE_SIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
   && COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V8SFmode, operands) && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512BW && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512BW))")
  (-1 "TARGET_64BIT
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_SSE4_1) && (TARGET_AVX2)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_PLUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_CMPXCHG16B) && (TARGET_64BIT)")
  (-1 "TARGET_USE_8BIT_IDIV
   && TARGET_QIMODE_MATH
   && can_create_pseudo_p ()
   && !optimize_insn_for_size_p ()")
  (-1 "TARGET_SSE2 && ix86_binary_operator_ok (UMAX, V16QImode, operands)")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[AX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "optimize_insn_for_speed_p ()
   && ((SImode == HImode
       && TARGET_LCP_STALL)
       || (!TARGET_USE_MOV0
          && TARGET_SPLIT_LONG_MOVES
          && get_attr_length (insn) >= ix86_cur_cost ()->large_insn))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_PLUS, V8HImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V4SImode, operands))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V4DImode, operands)) && (TARGET_AVX)")
  (-1 "TARGET_64BIT && !TARGET_OPT_AGU
   && REGNO (operands[0]) == REGNO (operands[2])
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V8DFmode, operands) && 1 && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(ix86_unary_operator_ok (NEG, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V2DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(ix86_match_ccmode (insn, CCGOCmode)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX && 1
   && avx_vpermilp_parallel (operands[2], V2DFmode)) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V4SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "!TARGET_64BIT && reload_completed
   && !(MMX_REG_P (operands[0])
	|| SSE_REG_P (operands[0])
	|| MASK_REG_P (operands[0]))
   && !(MMX_REG_P (operands[1])
	|| SSE_REG_P (operands[1])
	|| MASK_REG_P (operands[1]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V16SFmode, operands) && 1 && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V4DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_LWP) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V16QImode, operands))")
  (-1 "TARGET_80387 && TARGET_SAHF && !TARGET_CMOVE
   && (TARGET_USE_HIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SFmode)
       == GET_MODE_NUNITS (V16SImode))")
  (-1 "TARGET_80387 && X87_ENABLE_ARITH (DFmode)
   && !(TARGET_SSE2 && TARGET_SSE_MATH)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512DQ) && (TARGET_AVX512VL))")
  (-1 "(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
   && !flag_trapping_math) && (TARGET_64BIT)")
  (-1 "(!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && reload_completed")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW)")
  (-1 "(ix86_match_ccmode (insn, CCNOmode)
   && ix86_unary_operator_ok (NOT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SFmode)
       == GET_MODE_NUNITS (V4DImode))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V16HImode)
       == GET_MODE_NUNITS (V32QImode))")
  (-1 "ix86_binary_operator_ok (XOR, HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512CD) && (TARGET_AVX512VL))")
  (-1 "(!TARGET_X32) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V4DFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "!TARGET_64BIT && TARGET_STV && TARGET_SSE2")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DFmode)
       == GET_MODE_NUNITS (V16SImode))")
  (-1 "(TARGET_AVX && 1) && (TARGET_AVX512F)")
  (-1 "TARGET_64BIT && !TARGET_PARTIAL_REG_STALL")
  (-1 "TARGET_SSE4_1
   && ((unsigned) exact_log2 (INTVAL (operands[3]))
       < GET_MODE_NUNITS (V4SFmode))")
  (-1 "peep2_reg_dead_p (4, operands[7]) && peep2_reg_dead_p (4, operands[8])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V8SFmode, operands) && 1 && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !SSE_FLOAT_MODE_P (GET_MODE (operands[1]))")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MULT, V16HImode, operands)
   && 1 && 1) && (TARGET_AVX2)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SFmode)
       == GET_MODE_NUNITS (V8SImode))")
  (-1 "TARGET_AVX512IFMA")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE
   && 1 && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V4SFmode, operands)")
  (-1 "(TARGET_RDRND) && (TARGET_64BIT)")
  (-1 "TARGET_AVX2 && 1")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (MINUS, V2DImode, operands)) && (TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE2 && 1 && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (PLUS, V2DImode, operands)) && (TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE
   && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX || (TARGET_AVX512VL && TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (XOR, V32HImode, operands)) && (TARGET_AVX512F))")
  (-1 "(!SIBLING_CALL_P (insn)) && (word_mode == SImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (64 == 64 || TARGET_AVX512VL)
   && avx_vpermilp_parallel (operands[2], V8DFmode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512VBMI) && (TARGET_AVX512VL)")
  (-1 "optimize_insn_for_speed_p ()
   && (!TARGET_PARTIAL_REG_STALL || SImode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_FMA || TARGET_AVX512F)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V2DImode)
       == GET_MODE_NUNITS (V16QImode))")
  (-1 "TARGET_USE_FANCY_MATH_387
   && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)
   && flag_unsafe_math_optimizations
   && standard_80387_constant_p (operands[3]) == 2")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1 && TARGET_AVX512VL)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V8DImode, operands)) && (TARGET_AVX512F)")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (ROTATE, SImode, operands)")
  (-1 "TARGET_AVX512BW && ix86_binary_operator_ok (MINUS, V32HImode, operands)")
  (-1 "TARGET_64BIT && reload_completed
   && true_regnum (operands[0]) != true_regnum (operands[1])")
  (-1 "TARGET_AVX && !(MEM_P (operands[0]) && MEM_P (operands[1]))
  && reload_completed")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V4DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_64BIT && TARGET_MMX")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (XOR, HImode, operands)")
  (-1 "(TARGET_MWAITX) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (SMIN, V4SFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "TARGET_SSSE3 && 1 && 1
   && ix86_binary_operator_ok (MULT, V8HImode, operands)")
  (-1 "(TARGET_80387 && TARGET_CMOVE)
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512ER) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL))")
  (-1 "(TARGET_FMA || TARGET_FMA4) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V16SImode, operands))")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V8DImode)
       || register_operand (operands[1], V8DImode))) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SImode)
       == GET_MODE_NUNITS (V8SImode))")
  (-1 "TARGET_SSE_MATH && (TARGET_FMA || TARGET_FMA4 || TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MULT, V8SFmode, operands) && 1 && 1) && (TARGET_AVX)")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (MINUS, SImode, operands)")
  (-1 "TARGET_AVX && 1
   && avx_vpermilp_parallel (operands[2], V4SFmode)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_PLUS, V16QImode, operands)")
  (-1 "(TARGET_80387 && TARGET_SAHF && !TARGET_CMOVE
   && (TARGET_USE_HIMODE_FIOP
       || optimize_function_for_size_p (cfun))) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_MINUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(TARGET_SSE && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_POPCNT) && (TARGET_64BIT)")
  (-1 "((optimize && flag_peephole2) ? epilogue_completed : reload_completed) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (EQ, V64QImode, operands))")
  (-1 "TARGET_SSE
   && (GET_MODE_NUNITS (V4SImode)
       == GET_MODE_NUNITS (V4SFmode))")
  (-1 "(TARGET_AVX && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && (SSE_FLOAT_MODE_P (DFmode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (SMIN, V16QImode, operands))")
  (-1 "((TARGET_FAST_PREFIX && !TARGET_PARTIAL_REG_STALL)
    || optimize_function_for_size_p (cfun)) && (TARGET_64BIT)")
  (-1 "TARGET_AVX && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "TARGET_AVX512F
   && (INTVAL (operands[2]) == (INTVAL (operands[3]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[4]) == (INTVAL (operands[5]) - 1))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (IOR, V16HImode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_CMOVE && !(MEM_P (operands[2]) && MEM_P (operands[3]))) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (64 == 64 || TARGET_AVX512VL)
   && avx_vpermilp_parallel (operands[2], V16SFmode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512BW && (16 == 64 || TARGET_AVX512VL))")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (SMIN, V16HImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (64 == 64 || TARGET_AVX512VL))")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	&& (TARGET_64BIT || HImode != DImode))
	&& TARGET_SSE_MATH)")
  (-1 "TARGET_SSE && TARGET_64BIT")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V16SFmode, operands) && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_SSE4_2) && (TARGET_AVX512F)")
  (-1 "(TARGET_SSSE3) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW)")
  (-1 "(TARGET_AVX2) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (XOR, V8DImode, operands)) && (TARGET_AVX512F))")
  (-1 "(! TARGET_POPCNT) && ( reload_completed)")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || HImode != DImode))
	&& TARGET_SSE_MATH)
   && can_create_pseudo_p ()")
  (-1 "(((!TARGET_FUSE_CMP_AND_BRANCH || optimize_insn_for_size_p ())
     && incdec_operand (operands[3], GET_MODE (operands[3])))
    || (!TARGET_FUSE_CMP_AND_BRANCH
	&& INTVAL (operands[3]) == 128))
   && ix86_match_ccmode (insn, CCGCmode)
   && peep2_reg_dead_p (1, operands[2])")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(ix86_binary_operator_ok (ASHIFT, DImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (SMAX, V4SFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)))")
  (-1 "((unsigned HOST_WIDE_INT) INTVAL (operands[1])
   == -(unsigned HOST_WIDE_INT) INTVAL (operands[2])) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE) && ( reload_completed)")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (AND, V16QImode, operands)")
  (-1 "(TARGET_FMA || TARGET_FMA4 || TARGET_AVX512F) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE2) && (TARGET_SSE4_1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V16SFmode, operands) && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V8SFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "TARGET_SSE4_2 || TARGET_CRC32")
  (-1 "ix86_binary_operator_ok (ROTATERT, HImode, operands)")
  (-1 "ix86_binary_operator_ok (LSHIFTRT, HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V4DFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "(TARGET_AVX512F) && (TARGET_XOP || TARGET_AVX512VL)")
  (-1 "(TARGET_SSE4_1 && ix86_binary_operator_ok (MULT, V8SImode, operands) && 1) && (TARGET_AVX2)")
  (-1 "(TARGET_BMI2 && INTVAL (operands[4]) == 8 * BITS_PER_UNIT
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE2) && ((TARGET_64BIT) && (TARGET_SSE4_1))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V16SFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE
   && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "TARGET_64BIT && TARGET_SSE4_1")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_PLUS, V16QImode, operands))")
  (-1 "/* cltd is shorter than sarl $31, %eax */
   !optimize_function_for_size_p (cfun)
   && true_regnum (operands[1]) == AX_REG
   && true_regnum (operands[2]) == DX_REG
   && peep2_reg_dead_p (2, operands[1])
   && peep2_reg_dead_p (3, operands[2])
   && !reg_mentioned_p (operands[2], operands[3])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_PLUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (XOR, V16HImode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX && (16 == 64 || TARGET_AVX512VL)
   && avx_vpermilp_parallel (operands[2], V4SFmode))")
  (-1 "ix86_binary_operator_ok (ASHIFTRT, HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_PLUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (UMAX, V8SImode, operands)")
  (-1 "(TARGET_AVX512F) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V8DImode, operands))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_MINUS, V16QImode, operands))")
  (-1 "((TARGET_POPCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)) && ( reload_completed)")
  (-1 "TARGET_SSE2 && ix86_binary_operator_ok (MULT, V8HImode, operands)")
  (-1 "TARGET_SSE
   && (GET_MODE_NUNITS (V4SFmode)
       == GET_MODE_NUNITS (V4SFmode))")
  (-1 "(TARGET_SSE) && (TARGET_AVX)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V4SFmode)
       == GET_MODE_NUNITS (V16QImode))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V4DFmode, operands)) && (TARGET_AVX)")
  (-1 "TARGET_64BIT || TARGET_SSE")
  (-1 "(TARGET_SSE && !(MEM_P (operands[0]) && MEM_P (operands[1]))) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE3) && (TARGET_AVX)")
  (-1 "(ix86_binary_operator_ok (ASHIFTRT, DImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1) && (TARGET_64BIT)")
  (-1 "TARGET_64BIT && INTVAL (operands[2]) == 63
   && (TARGET_USE_CLTD || optimize_function_for_size_p (cfun))
   && ix86_binary_operator_ok (ASHIFTRT, DImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V2DFmode, operands)
   && 1 && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "TARGET_XOP || (TARGET_AVX512BW && TARGET_AVX512VL)")
  (-1 "TARGET_80387 || SSE_FLOAT_MODE_P (SFmode)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MULT, V32HImode, operands)
   && 1 && 1) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V4SFmode)
       == GET_MODE_NUNITS (V8HImode))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (IOR, V8DFmode, operands)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (US_MINUS, V8QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V4SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE4_1 && 1 && 1) && (TARGET_AVX2)")
  (-1 "TARGET_80387 || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && ((TARGET_FMA || TARGET_AVX512F) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (16 == 64 || TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V4DImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX
   && TARGET_AVX512VL
   && (INTVAL (operands[3]) == (INTVAL (operands[7]) - 4)
       && INTVAL (operands[4]) == (INTVAL (operands[8]) - 4)
       && INTVAL (operands[5]) == (INTVAL (operands[9]) - 4)
       && INTVAL (operands[6]) == (INTVAL (operands[10]) - 4)))")
  (-1 "TARGET_AVX512DQ && TARGET_AVX512VL")
  (-1 "ix86_target_stack_probe ()")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_SSE && 1) && (TARGET_AVX)")
  (-1 "(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && peep2_reg_dead_p (4, operands[0])
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && !reg_overlap_mentioned_p (operands[0], operands[2])
   && (SImode != QImode
       || immediate_operand (operands[2], QImode)
       || any_QIreg_operand (operands[2], QImode))
   && ix86_match_ccmode (peep2_next_insn (3),
			 (GET_CODE (operands[3]) == PLUS
			  || GET_CODE (operands[3]) == MINUS)
			 ? CCGOCmode : CCNOmode)")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V8SImode)
       == GET_MODE_NUNITS (V4DFmode))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && TARGET_AVX512VL)")
  (-1 "TARGET_PARTIAL_REG_STALL")
  (-1 "TARGET_F16C")
  (-1 "(TARGET_RDSEED) && (TARGET_64BIT)")
  (-1 "TARGET_USE_XCHGB || optimize_function_for_size_p (cfun)")
  (-1 "(!(fixed_regs[CX_REG] || fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (0 "(TARGET_AVX512F) && (TARGET_AVX512F && 1 && (SFmode == V16SFmode
							      || SFmode == V8DFmode
							      || SFmode == V8DImode
							      || SFmode == V16SImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && 1 && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode))")
  (-1 "TARGET_AVX512CD")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V8HImode, operands))")
  (-1 "TARGET_LWP")
  (-1 "TARGET_64BIT && (TARGET_SSE4_2 || TARGET_CRC32)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4SFmode == V8SFmode)) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_MPX) && (TARGET_64BIT)")
  (-1 "TARGET_SSE2 && ix86_binary_operator_ok (SMIN, V8HImode, operands)")
  (-1 "TARGET_80387
   && !(TARGET_SSE2 && TARGET_SSE_MATH)
   && !TARGET_MIX_SSE_I387")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V8DImode, operands)) && (TARGET_AVX512F)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (AND, V8QImode, operands)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (XFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC
   && !TARGET_64BIT && optimize_function_for_speed_p (cfun)")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V1DImode == V1DImode))
   && ix86_binary_operator_ok (MINUS, V1DImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "(TARGET_SSE4_1) && ( reload_completed && SSE_REG_P (operands[0]))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (UMAX, V16HImode, operands)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (AND, SImode, operands)")
  (-1 "TARGET_AVX512F
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[5]) - 2)
       && INTVAL (operands[3]) == (INTVAL (operands[6]) - 3)
       && INTVAL (operands[7]) == (INTVAL (operands[8]) - 1)
       && INTVAL (operands[7]) == (INTVAL (operands[9]) - 2)
       && INTVAL (operands[7]) == (INTVAL (operands[10]) - 3)
       && INTVAL (operands[11]) == (INTVAL (operands[12]) - 1)
       && INTVAL (operands[11]) == (INTVAL (operands[13]) - 2)
       && INTVAL (operands[11]) == (INTVAL (operands[14]) - 3)
       && INTVAL (operands[15]) == (INTVAL (operands[16]) - 1)
       && INTVAL (operands[15]) == (INTVAL (operands[17]) - 2)
       && INTVAL (operands[15]) == (INTVAL (operands[18]) - 3))")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (AND, V8HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V8DFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	&& (TARGET_64BIT || DImode != DImode))
	&& TARGET_SSE_MATH)")
  (-1 "TARGET_SSE4_1 && 1
   && ix86_binary_operator_ok (MULT, V4SImode, operands)")
  (-1 "(!(MEM_P (operands[1]) && MEM_P (operands[2]))) && (TARGET_64BIT)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V16SImode, operands)")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (UNKNOWN, V4SFmode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (IOR, V16SFmode, operands))")
  (-1 "TARGET_80387 && TARGET_SAHF && !TARGET_CMOVE")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_MINUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX2 && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V8SFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (0 "TARGET_64BIT && TARGET_SUN_TLS")
  (-1 "(TARGET_SSSE3) && (TARGET_AVX2)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && TARGET_AVX512VL)")
  (-1 "ix86_binary_operator_ok (MINUS, HImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "TARGET_BMI2")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_MINUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (SS_PLUS, V8QImode, operands)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_PLUS, V16HImode, operands)) && (TARGET_AVX2)")
  (0 "(TARGET_AVX512F) && (TARGET_SSE && 1 && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V8SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_MINUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX2 && (16 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "reload_completed
    && GET_MODE (operands[2]) != QImode
    && ((ix86_match_ccmode (insn, CCZmode)
    	 && !(INTVAL (operands[3]) & ~(255 << 8)))
	|| (ix86_match_ccmode (insn, CCNOmode)
	    && !(INTVAL (operands[3]) & ~(127 << 8))))")
  (-1 "TARGET_AVX2
   && 1 && 1
   && INTVAL (operands[2]) + 8 == INTVAL (operands[6])
   && INTVAL (operands[3]) + 8 == INTVAL (operands[7])
   && INTVAL (operands[4]) + 8 == INTVAL (operands[8])
   && INTVAL (operands[5]) + 8 == INTVAL (operands[9])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V4DFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "((TARGET_DOUBLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -2*GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && (((((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "TARGET_80387 && TARGET_CMOVE
   && !(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (PLUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "(!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (2))
   && !reg_mentioned_p (operands[0],
			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))) && (word_mode == DImode)")
  (-1 "!TARGET_64BIT && TARGET_SSE2 && TARGET_SSE_MATH
   && optimize_function_for_speed_p (cfun)")
  (-1 "!TARGET_64BIT
   && ((TARGET_80387 && X87_ENABLE_FLOAT (SFmode, DImode)
	&& TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC)
       || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2 && TARGET_AVX512VL
   && ix86_binary_operator_ok (MULT, V8SImode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512ER) && (TARGET_SSE2)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
       && SImode != HImode 
       && ((SImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "ix86_can_use_return_insn_p ()")
  (-1 "(TARGET_BMI2 && INTVAL (operands[3]) == 8 * BITS_PER_UNIT) && (TARGET_64BIT)")
  (-1 "!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && !(TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode))")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
       && SImode != HImode 
       && ((SImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "ix86_binary_operator_ok (ASHIFTRT, QImode, operands)")
  (-1 "TARGET_64BIT && ix86_cmodel == CM_LARGE_PIC && !TARGET_PECOFF
   && GET_CODE (operands[2]) == CONST
   && GET_CODE (XEXP (operands[2], 0)) == UNSPEC
   && XINT (XEXP (operands[2], 0), 1) == UNSPEC_PLTOFF")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V8HImode)
       || register_operand (operands[1], V8HImode))")
  (-1 "ix86_binary_operator_ok (IOR, QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (SMAX, V16QImode, operands)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SImode)
       == GET_MODE_NUNITS (V16HImode))")
  (-1 "ix86_binary_operator_ok (IOR, HImode, operands)")
  (-1 "TARGET_SSSE3 || TARGET_AVX || TARGET_XOP")
  (-1 "(TARGET_MPX) && (!TARGET_LP64)")
  (-1 "((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2
   && TARGET_AVX512BW && TARGET_AVX512VL
   && INTVAL (operands[2]) + 8 == INTVAL (operands[6])
   && INTVAL (operands[3]) + 8 == INTVAL (operands[7])
   && INTVAL (operands[4]) + 8 == INTVAL (operands[8])
   && INTVAL (operands[5]) + 8 == INTVAL (operands[9]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V8DFmode, operands) && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V4SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_SSE
   && ix86_binary_operator_ok (IOR, TFmode, operands)")
  (-1 "TARGET_USE_FANCY_MATH_387
   && flag_finite_math_only")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (SMAX, V4SFmode, operands)
   && 1 && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode))")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_unary_operator_ok (NOT, HImode, operands)")
  (-1 "TARGET_MMX
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
   && !flag_trapping_math) && (TARGET_64BIT)")
  (-1 "TARGET_SSE2 && TARGET_SSE_UNALIGNED_LOAD_OPTIMAL
   && ix86_operands_ok_for_move_multiple (operands, true, DFmode)")
  (-1 "TARGET_AVX512ER")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (PLUS, SImode, operands)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_MINUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (EQ, V32HImode, operands))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V8SFmode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_PLUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V8HImode)
       == GET_MODE_NUNITS (V8HImode))")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (IOR, HImode, operands)")
  (-1 "TARGET_CMOVE && !(MEM_P (operands[2]) && MEM_P (operands[3]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V4DFmode, operands) && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (1))
   && !reg_mentioned_p (operands[0],
			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))) && (word_mode == SImode)")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V2DFmode)
       == GET_MODE_NUNITS (V4SFmode))) && (TARGET_SSE2)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "word_mode == DImode")
  (-1 "(!(MEM_P (operands[1]) && MEM_P (operands[2]))) && (!TARGET_64BIT)")
  (-1 "(TARGET_MMX && !(MEM_P (operands[0]) && MEM_P (operands[1]))) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (XOR, V16HImode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_AVX512VBMI")
  (-1 "!TARGET_64BIT && reload_completed
   && !(MMX_REG_P (operands[0]) || SSE_REG_P (operands[0]))
   && !(MMX_REG_P (operands[1]) || SSE_REG_P (operands[1]))")
  (-1 "(ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (IOR, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_FMA || TARGET_AVX512F) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (PLUS, V2DFmode, operands) && 1 && 1) && (TARGET_SSE2)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DImode)
       == GET_MODE_NUNITS (V8DImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (XOR, V4SFmode, operands))")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V8DImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DImode)
       == GET_MODE_NUNITS (V32HImode))) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX && TARGET_AVX512VL && TARGET_AVX512DQ)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (US_PLUS, V8QImode, operands)")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V4SFmode)
       || register_operand (operands[1], V4SFmode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DFmode)
       == GET_MODE_NUNITS (V64QImode))) && (TARGET_AVX512BW)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (DFmode, HImode)
   && !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
   && (TARGET_USE_HIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_AVOID_VECTOR_DECODE
   && SSE_FLOAT_MODE_P (DFmode)
   && optimize_insn_for_speed_p ()) && (TARGET_64BIT)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (SFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC
   && !TARGET_64BIT && optimize_function_for_speed_p (cfun)
   && reload_completed")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DFmode)
       == GET_MODE_NUNITS (V32QImode))")
  (-1 "TARGET_AVX512BW && TARGET_AVX512VL")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V2DFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "!TARGET_64BIT && SIBLING_CALL_P (peep2_next_insn (1))
   && !reg_mentioned_p (operands[0],
			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (EQ, V32HImode, operands)")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "TARGET_64BIT && !TARGET_USE_BT")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V16SImode, operands))")
  (-1 "TARGET_SSE
   && (GET_MODE_NUNITS (V8HImode)
       == GET_MODE_NUNITS (V4SFmode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V16SFmode, operands) && 1 && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX2 || TARGET_XOP")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V16QImode)
       || register_operand (operands[1], V16QImode))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V8DImode, operands)) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX2
   /* Disable this splitter if avx512vl_vec_dup_gprv*[qhs]i insn is
      available, because then we can broadcast from GPRs directly.
      For V*[QH]I modes it requires both -mavx512vl and -mavx512bw,
      for V*SI mode it requires just -mavx512vl.  */
   && !(TARGET_AVX512VL
	&& (TARGET_AVX512BW || SImode == SImode))
   && reload_completed && GENERAL_REG_P (operands[1])")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MULT, V2DFmode, operands) && 1 && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE3
   && can_create_pseudo_p ()
   && ((rtx_equal_p (operands[1], operands[3])
	&& rtx_equal_p (operands[2], operands[4]))
       || (rtx_equal_p (operands[1], operands[4])
	   && rtx_equal_p (operands[2], operands[3])))) && (TARGET_SSE2)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SFmode)
       == GET_MODE_NUNITS (V8DImode))")
  (-1 "(TARGET_ROUND) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (PLUS, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V4SFmode)
       == GET_MODE_NUNITS (V4SImode))")
  (-1 "TARGET_80387 && X87_ENABLE_ARITH (DFmode)
   && !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
   && !COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "TARGET_MMX || (TARGET_SSE2 && V1DImode == V1DImode)")
  (-1 "TARGET_AVX512F
   && INTVAL (operands[2]) + 4 == INTVAL (operands[6])
   && INTVAL (operands[3]) + 4 == INTVAL (operands[7])
   && INTVAL (operands[4]) + 4 == INTVAL (operands[8])
   && INTVAL (operands[5]) + 4 == INTVAL (operands[9])
   && INTVAL (operands[2]) + 8 == INTVAL (operands[10])
   && INTVAL (operands[3]) + 8 == INTVAL (operands[11])
   && INTVAL (operands[4]) + 8 == INTVAL (operands[12])
   && INTVAL (operands[5]) + 8 == INTVAL (operands[13])
   && INTVAL (operands[2]) + 12 == INTVAL (operands[14])
   && INTVAL (operands[3]) + 12 == INTVAL (operands[15])
   && INTVAL (operands[4]) + 12 == INTVAL (operands[16])
   && INTVAL (operands[5]) + 12 == INTVAL (operands[17])")
  (-1 "TARGET_80387 && X87_ENABLE_ARITH (SFmode)
   && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
   && !COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V2DImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && 1)")
  (-1 "INTVAL (operands[2]) == 31
   && (TARGET_USE_CLTD || optimize_function_for_size_p (cfun))
   && ix86_binary_operator_ok (ASHIFTRT, SImode, operands)")
  (-1 "(TARGET_BMI
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V4DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_3DNOW_A")
  (-1 "(TARGET_AVX512F) && ((((TARGET_AVX512VL) && (Pmode == DImode)) && (Pmode == DImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_USE_FANCY_MATH_387
   && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "TARGET_SSE
   && 1 && 1")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (XOR, V32HImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSSE3 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX2))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE
   && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (MINUS, V4SFmode, operands) && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)))")
  (-1 "(TARGET_AVX512PF) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_PLUS, V8HImode, operands))")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (EQ, V2SImode, operands)")
  (-1 "TARGET_AVX512F && !TARGET_BMI && reload_completed")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (AND, V32QImode, operands)) && (TARGET_AVX)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "optimize_insn_for_speed_p ()
   && ((QImode == HImode
       && TARGET_LCP_STALL)
       || (!TARGET_USE_MOV0
          && TARGET_SPLIT_LONG_MOVES
          && get_attr_length (insn) >= ix86_cur_cost ()->large_insn))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "TARGET_PREFETCH_SSE")
  (-1 "SSE_FLOAT_MODE_P (DFmode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && TARGET_AVX512VL && TARGET_AVX512BW) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSSE3 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (MULT, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(TARGET_64BIT && TARGET_MMX) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512VBMI && (16 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_PLUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "!TARGET_64BIT && !SIBLING_CALL_P (insn)")
  (-1 "(INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V2DFmode)
       == GET_MODE_NUNITS (V2DFmode))) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX2) && (TARGET_AVX)")
  (-1 "TARGET_80387")
  (-1 "(reload_completed) && (Pmode == SImode)")
  (-1 "TARGET_80387
   && (TARGET_USE_HIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (XOR, SImode, operands)")
  (-1 "TARGET_SSE2 && !TARGET_XOP
   && ix86_binary_operator_ok (EQ, V8HImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (EQ, V8DImode, operands))")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "(TARGET_SSE2
   && (GET_MODE_NUNITS (V2DFmode)
       == GET_MODE_NUNITS (V16QImode))) && (TARGET_SSE2)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (EQ, V16HImode, operands)")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (AND, SImode, operands)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V4TImode)
       || register_operand (operands[1], V4TImode))) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2 && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V8DImode, operands)")
  (-1 "!TARGET_OPT_AGU
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "((TARGET_SSE) && (TARGET_SSE2)) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (MINUS, V16HImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_USE_FANCY_MATH_387
   && (!TARGET_SSE_MATH || TARGET_MIX_SSE_I387)
   && flag_unsafe_math_optimizations")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (AND, V16HImode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH
       && DImode != HImode 
       && ((DImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "(TARGET_FMA || TARGET_FMA4) && (TARGET_SSE2)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ((TARGET_64BIT && GET_MODE (operands[0]) == DImode)
       || GET_MODE (operands[0]) == SImode
       || GET_MODE (operands[0]) == HImode
       || GET_MODE (operands[0]) == QImode)
   /* Ensure that resulting mask is zero or sign extended operand.  */
   && INTVAL (operands[2]) >= 0
   && ((INTVAL (operands[1]) > 0
	&& INTVAL (operands[1]) + INTVAL (operands[2]) <= 32)
       || (HImode == DImode
	   && INTVAL (operands[1]) > 32
	   && INTVAL (operands[1]) + INTVAL (operands[2]) == 64))")
  (-1 "(TARGET_CLZERO) && (Pmode == SImode)")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (MINUS, SImode, operands)")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || DImode != DImode))
   && can_create_pseudo_p ()")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (EQ, V8DImode, operands)")
  (-1 "ix86_binary_operator_ok (ASHIFT, SImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1")
  (-1 "TARGET_SSE4_1 && 1")
  (-1 "(TARGET_SSSE3) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (MULT, V4SFmode, operands) && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (IOR, V2SImode, operands)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMAX, V4DFmode, operands)
   && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_SSE4_1 && 1 && 1) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_PLUS, V8HImode, operands)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V4DFmode, operands)) && (TARGET_AVX)")
  (-1 "ix86_binary_operator_ok (ASHIFTRT, SImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (PLUS, V4SFmode, operands) && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V8SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_3DNOW")
  (-1 "(TARGET_80387 && X87_ENABLE_ARITH (DFmode))
    || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (AND, V4SFmode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V8SFmode, operands)
   && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (0 "(TARGET_AVX512F) && (TARGET_SSE2 && 1 && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V8DImode, operands)")
  (-1 "reload_completed
   && !(ANY_FP_REG_P (operands[0]) || ANY_FP_REG_P (operands[1]))")
  (-1 "(TARGET_SSE || TARGET_3DNOW)
   && ix86_binary_operator_ok (PLUS, V8QImode, operands)")
  (-1 "TARGET_CMPXCHG")
  (-1 "TARGET_64BIT && !symbolic_operand (operands[1], DImode)
   && !x86_64_immediate_operand (operands[1], DImode) && 1")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V8SFmode, operands)
   && 1 && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "!(MEM_P (operands[0]) && MEM_P (operands[1])) && TARGET_AVX512F")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_SSE && !(MEM_P (operands[0]) && MEM_P (operands[1]))) && ( reload_completed)")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (MINUS, HImode, operands)")
  (-1 "!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun)")
  (-1 "ix86_match_ccmode (insn, CCGCmode)")
  (-1 "TARGET_SSE4_1 && ix86_binary_operator_ok (EQ, V2DImode, operands)")
  (-1 "(ix86_match_ccmode (insn, CCmode)
   && ix86_binary_operator_ok (MINUS, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512DQ))")
  (-1 "TARGET_80387 && TARGET_CMOVE
   && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX2 && 1) && (TARGET_AVX512F)")
  (-1 "ix86_unary_operator_ok (NOT, QImode, operands)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && TARGET_AVX512DQ)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512VL)")
  (-1 "(!(fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (V8DImode == V16SFmode
							      || V8DImode == V8DFmode
							      || V8DImode == V8DImode
							      || V8DImode == V16SImode))")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_unary_operator_ok (NOT, QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V8DFmode, operands) && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "TARGET_SSE && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "TARGET_3DNOW || TARGET_PRFCHW || TARGET_PREFETCHWT1")
  (-1 "TARGET_AVX512BW && (16 == 64 || TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1 && TARGET_AVX512VL
   && ix86_binary_operator_ok (MULT, V4SImode, operands))")
  (-1 "reload_completed
   && (GET_MODE (operands[0]) == TFmode
       || GET_MODE (operands[0]) == XFmode
       || GET_MODE (operands[0]) == DFmode)
   && !ANY_FP_REG_P (operands[1])")
  (-1 "TARGET_SSE2 && TARGET_SSE_MATH")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V2DImode, operands)")
  (-1 "TARGET_AVX512F && ix86_match_ccmode (insn, CCZmode)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DImode)
       == GET_MODE_NUNITS (V4DImode))")
  (-1 "((((GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
      && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun)))
    || GET_MODE (operands[0]) == SImode
    || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && ((unsigned HOST_WIDE_INT) INTVAL (operands[2])) - 1 < 3
   && ((unsigned HOST_WIDE_INT) INTVAL (operands[3])
       < (HOST_WIDE_INT_1U << INTVAL (operands[2])))) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2 && TARGET_AVX512VL && TARGET_AVX512BW)")
  (-1 "TARGET_80387
   && (TARGET_USE_HIMODE_FIOP || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_MINUS, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "reload_completed
   && (standard_80387_constant_p (operands[1]) == 8
       || standard_80387_constant_p (operands[1]) == 9)")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V4SImode, operands)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V32QImode)
       == GET_MODE_NUNITS (V4DImode))")
  (-1 "TARGET_AVX && 1 && 1")
  (-1 "ix86_binary_operator_ok (LSHIFTRT, SImode, operands)")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || DImode != DImode))
	&& TARGET_SSE_MATH)")
  (-1 "(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && peep2_reg_dead_p (4, operands[0])
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && !reg_overlap_mentioned_p (operands[0], operands[2])
   && (HImode != QImode
       || immediate_operand (operands[2], QImode)
       || any_QIreg_operand (operands[2], QImode))
   && ix86_match_ccmode (peep2_next_insn (3),
			 (GET_CODE (operands[3]) == PLUS
			  || GET_CODE (operands[3]) == MINUS)
			 ? CCGOCmode : CCNOmode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (SMAX, V4SFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V2DImode)
       || register_operand (operands[1], V2DImode))")
  (-1 "ix86_match_ccmode (insn, CCZmode)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
   && !flag_trapping_math")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (DFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC
   && !TARGET_64BIT && optimize_function_for_speed_p (cfun)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_MINUS, V16QImode, operands)")
  (-1 "(TARGET_AVX512DQ && 1) && (TARGET_AVX)")
  (-1 "TARGET_SSE
   && (!(MEM_P (operands[1]) && MEM_P (operands[2]))
       || (TARGET_SSE3 && rtx_equal_p (operands[1], operands[2])))")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCmode)
   && ix86_binary_operator_ok (MINUS, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V4DFmode, operands) && 1 && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (XOR, V2DImode, operands))")
  (-1 "TARGET_USE_FANCY_MATH_387
   && flag_unsafe_math_optimizations
   && standard_80387_constant_p (operands[3]) == 2")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V4DImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V2DFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "TARGET_AVX && !(MEM_P (operands[0]) && MEM_P (operands[1])) && reload_completed")
  (-1 "TARGET_80387
   && (TARGET_USE_SIMODE_FIOP || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_CMPXCHG) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (V8SFmode == V8SFmode))")
  (-1 "(SSE_FLOAT_MODE_P (SFmode)
   && (!TARGET_FISTTP || TARGET_SSE_MATH)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (XOR, V4DFmode, operands)) && (TARGET_AVX))")
  (-1 "!(TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode))")
  (-1 "TARGET_AVX2")
  (-1 "(ix86_binary_operator_ok (XOR, DImode, operands)) && (TARGET_64BIT)")
  (-1 "((SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
    || (TARGET_SSE && (DFmode == TFmode)))
   && reload_completed")
  (-1 "ix86_match_ccmode (insn, CCmode)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V64QImode)
       == GET_MODE_NUNITS (V32HImode))) && (TARGET_AVX512BW)")
  (-1 "reload_completed
    && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
    && !(INTVAL (operands[2]) & ~255)
    && (INTVAL (operands[2]) & 128)
    && GET_MODE (operands[0]) != QImode")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V8DFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "ix86_binary_operator_ok (MINUS, QImode, operands)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (SMAX, V8SImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_F16C || TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (MINUS, V8HImode, operands)) && (TARGET_AVX512VL)")
  (-1 "SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
   && !flag_trapping_math")
  (-1 "(TARGET_FMA4) && (TARGET_SSE2)")
  (-1 "GET_MODE (operands[0]) == GET_MODE (operands[1])
   && reload_completed
   && true_regnum (operands[0]) != true_regnum (operands[1])")
  (-1 "TARGET_80387
   && !(SSE_FLOAT_MODE_P (DFmode) && (!TARGET_FISTTP || TARGET_SSE_MATH))")
  (-1 "! TARGET_PARTIAL_REG_STALL && reload_completed
   && (GET_MODE (operands[0]) == HImode
       || (GET_MODE (operands[0]) == QImode
	   && (TARGET_PROMOTE_QImode
	       || optimize_insn_for_size_p ())))")
  (-1 "TARGET_3DNOW && ix86_binary_operator_ok (SMIN, V2SFmode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (XOR, V64QImode, operands)) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX512F && !(MEM_P (operands[0]) && MEM_P (operands[1]))
  && reload_completed
  && (TARGET_AVX512VL || (REG_P (operands[0]) && !EXT_REX_SSE_REG_P (operands[1])))")
  (-1 "(TARGET_AVX) && ( reload_completed && (V4DFmode != V4DFmode || !TARGET_AVX2))")
  (-1 "!TARGET_MACHO && !TARGET_64BIT && SIBLING_CALL_P (insn)")
  (-1 "!(MEM_P (operands[0]) && MEM_P (operands[1]))
    && ix86_match_ccmode (insn,
 			 CONST_INT_P (operands[1])
 			 && INTVAL (operands[1]) >= 0 ? CCNOmode : CCZmode)")
  (-1 "TARGET_BMI
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)")
  (-1 "!TARGET_64BIT
   && SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH")
  (-1 "TARGET_SSE3")
  (-1 "TARGET_AVX512BW && ix86_binary_operator_ok (MINUS, V64QImode, operands)")
  (-1 "TARGET_64BIT && reload_completed
   && !SSE_REG_P (operands[1])")
  (-1 "TARGET_SSE4_1 && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "TARGET_USE_FANCY_MATH_387
   && flag_unsafe_math_optimizations")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (AND, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (AND, V32QImode, operands)) && (TARGET_AVX))")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ix86_binary_operator_ok (SMIN, V4HImode, operands)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (SS_MINUS, V4HImode, operands)")
  (-1 "TARGET_SSE
   && GET_RTX_CLASS (GET_CODE (operands[3])) == RTX_COMM_COMPARE")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (MINUS, V16QImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (XOR, V2DFmode, operands)) && (TARGET_SSE2))")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (SMAX, V4SFmode, operands)
   && 1 && 1")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V2DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_SSSE3 && 1 && 1
   && ix86_binary_operator_ok (MULT, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && 1 && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode))")
  (-1 "TARGET_SSE3
   && INTVAL (operands[3]) != INTVAL (operands[4])
   && INTVAL (operands[5]) != INTVAL (operands[6])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && (((TARGET_AVX512VL) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "((optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& (TARGET_SHIFT1
	    || TARGET_DOUBLE_WITH_ADD)))
   && ix86_match_ccmode (insn, CCGOCmode)) && (TARGET_64BIT)")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (ROTATERT, SImode, operands)")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V8QImode == V1DImode))
   && ix86_binary_operator_ok (PLUS, V8QImode, operands)")
  (-1 "(TARGET_SSE2) && (TARGET_AVX512F)")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512BW))")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& (TARGET_SHIFT1
	    || (TARGET_DOUBLE_WITH_ADD && REG_P (operands[0])))))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFT, HImode, operands)")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V4DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(!TARGET_PARTIAL_REG_STALL
   || DImode == SImode
   || optimize_function_for_size_p (cfun)) && (TARGET_64BIT)")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (PLUS, V4SFmode, operands) && 1 && 1")
  (-1 "((TARGET_BMI
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)) && ( reload_completed)")
  (-1 "((TARGET_DOUBLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V4SImode)
       || register_operand (operands[1], V4SImode))")
  (-1 "TARGET_LZCNT")
  (-1 "!(MEM_P (operands[1]) && MEM_P (operands[2]))
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "!(TARGET_64BIT || TARGET_SSE2)")
  (-1 "TARGET_3DNOW && ix86_binary_operator_ok (SMAX, V2SFmode, operands)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ((TARGET_64BIT && GET_MODE (operands[0]) == DImode)
       || GET_MODE (operands[0]) == SImode
       || GET_MODE (operands[0]) == HImode
       || GET_MODE (operands[0]) == QImode)
   /* Ensure that resulting mask is zero or sign extended operand.  */
   && INTVAL (operands[2]) >= 0
   && ((INTVAL (operands[1]) > 0
	&& INTVAL (operands[1]) + INTVAL (operands[2]) <= 32)
       || (SImode == DImode
	   && INTVAL (operands[1]) > 32
	   && INTVAL (operands[1]) + INTVAL (operands[2]) == 64))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (PLUS, V8SFmode, operands) && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(ix86_binary_operator_ok (LSHIFTRT, DImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1) && (TARGET_64BIT)")
  (-1 "TARGET_SSE
   && ix86_binary_operator_ok (AND, TFmode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V16SFmode, operands)
   && 1 && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX) && ( reload_completed)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SFmode)
       == GET_MODE_NUNITS (V64QImode))) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512DQ && (V8SFmode == V8SFmode)))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V16QImode)
       == GET_MODE_NUNITS (V16QImode))")
  (-1 "(TARGET_SSE) && (TARGET_AVX512F)")
  (-1 "TARGET_SSE2 && TARGET_SSE_UNALIGNED_STORE_OPTIMAL
   && ix86_operands_ok_for_move_multiple (operands, false, DFmode)")
  (-1 "(reload_completed) && (TARGET_HIMODE_MATH)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_MINUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_64BIT && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_FROM_VEC) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V16SFmode, operands) && 1 && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (PLUS, V16QImode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V32QImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V16QImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_FMA || TARGET_FMA4 || TARGET_AVX512F")
  (-1 "ix86_binary_operator_ok (PLUS, SImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (PLUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "TARGET_USE_VECTOR_FP_CONVERTS
   && optimize_insn_for_speed_p ()
   && reload_completed && SSE_REG_P (operands[0])
   && (!EXT_REX_SSE_REG_P (operands[0])
       || TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V8SFmode, operands) && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(TARGET_BSWAP) && (TARGET_64BIT)")
  (-1 "ix86_binary_operator_ok (XOR, QImode, operands)")
  (-1 "TARGET_80387
   && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)")
  (-1 "(TARGET_AVX512CD) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512DQ && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V16SImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_USE_FANCY_MATH_387
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "(TARGET_64BIT && TARGET_FSGSBASE) && (TARGET_64BIT)")
  (-1 "TARGET_FMA || TARGET_FMA4 || TARGET_AVX512VL")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V4DFmode, operands)
   && 1 && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "!TARGET_64BIT
   && TARGET_80387 && X87_ENABLE_FLOAT (SFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC")
  (-1 "(optimize_insn_for_size_p () || TARGET_MOVE_M1_VIA_OR)
   && GENERAL_REGNO_P (REGNO (operands[0]))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(ix86_binary_operator_ok (ROTATE, DImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1) && (TARGET_64BIT)")
  (-1 "(!(MEM_P (operands[1]) && MEM_P (operands[2]))
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_MINUS, V8HImode, operands))")
  (-1 "TARGET_SSE3 && INTVAL (operands[2]) + 2 == INTVAL (operands[3])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V4DFmode, operands) && 1 && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "find_regno_note (insn, REG_UNUSED, REGNO (operands[0]))
   && can_create_pseudo_p ()")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V8DImode, operands)")
  (-1 "(TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && can_create_pseudo_p ()")
  (-1 "(TARGET_AVX512F) && (TARGET_SSSE3 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V16HImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_80387 && !TARGET_CMOVE
   && (TARGET_USE_SIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "TARGET_SSE4_1 && 1 && 1")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE4_1 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX512BW))")
  (-1 "(GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
   && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && (GET_MODE (operands[0]) == GET_MODE (operands[3])
       || GET_MODE (operands[3]) == VOIDmode)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DFmode)
       == GET_MODE_NUNITS (V4DImode))")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V2TImode)
       || register_operand (operands[1], V2TImode))) && (TARGET_AVX)")
  (-1 "!(TARGET_READ_MODIFY || optimize_insn_for_size_p ())")
  (-1 "TARGET_MMX && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V16SImode, operands)")
  (-1 "TARGET_AVX512BW && 1")
  (-1 "((TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && peep2_reg_dead_p (4, operands[0])
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && !reg_overlap_mentioned_p (operands[0], operands[2])
   && (DImode != QImode
       || immediate_operand (operands[2], QImode)
       || any_QIreg_operand (operands[2], QImode))
   && ix86_match_ccmode (peep2_next_insn (3),
			 (GET_CODE (operands[3]) == PLUS
			  || GET_CODE (operands[3]) == MINUS)
			 ? CCGOCmode : CCNOmode)) && (TARGET_64BIT)")
  (-1 "((optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFTRT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (MINUS, V4SFmode, operands) && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "(ix86_binary_operator_ok (MINUS, DImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])) && (TARGET_64BIT)")
  (-1 "find_regno_note (insn, REG_UNUSED, REGNO (operands[1]))
   && can_create_pseudo_p ()")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (IOR, V16SImode, operands)) && (TARGET_AVX512F))")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (AND, HImode, operands)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (UMIN, V32QImode, operands)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V32QImode)
       || register_operand (operands[1], V32QImode))) && (TARGET_AVX)")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (IOR, SImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_FMA)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (IOR, V8SFmode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_LP64 && ix86_check_movabs (insn, 1)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V16SImode, operands)) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (EQ, V16SImode, operands)")
  (-1 "TARGET_64BIT && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_FROM_VEC")
  (-1 "(TARGET_USE_FANCY_MATH_387 && X87_ENABLE_ARITH (SFmode))
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V8SFmode, operands) && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(ix86_binary_operator_ok (LSHIFTRT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V8SImode)
       || register_operand (operands[1], V8SImode))) && (TARGET_AVX)")
  (-1 "reload_completed
  && (TARGET_USE_XCHGB || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (AND, V8SFmode, operands)) && (TARGET_AVX))")
  (-1 "(SSE_FLOAT_MODE_P (DFmode)
   && (!TARGET_FISTTP || TARGET_SSE_MATH)) && (TARGET_64BIT)")
  (-1 "(X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || SImode != DImode))
   && can_create_pseudo_p ()) && ( 1)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V4DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (XOR, V8QImode, operands)")
  (-1 "(TARGET_LWP) && (TARGET_64BIT)")
  (-1 "(TARGET_SSSE3 && 1 && 1) && (TARGET_AVX512BW)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SImode)
       == GET_MODE_NUNITS (V32QImode))")
  (-1 "(TARGET_AVX512BW && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512BW && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "!TARGET_64BIT && reload_completed")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V16SImode)
       || register_operand (operands[1], V16SImode))) && (TARGET_AVX512F)")
  (-1 "TARGET_80387 && !(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)")
  (-1 "reload_completed && ix86_lea_for_add_ok (insn, operands)")
  (-1 "(TARGET_F16C || TARGET_AVX512VL) && 1")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ((unsigned) exact_log2 (INTVAL (operands[3]))
       < GET_MODE_NUNITS (V4HImode))")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	&& (TARGET_64BIT || SImode != DImode))
	&& TARGET_SSE_MATH)")
  (-1 "ix86_binary_operator_ok (AND, QImode, operands)
   && ix86_match_ccmode (insn,
			 CONST_INT_P (operands[2])
			 && INTVAL (operands[2]) >= 0 ? CCNOmode : CCZmode)")
  (-1 "TARGET_AVX2 && 1
   && ix86_binary_operator_ok (MULT, V8SImode, operands)")
  (-1 "TARGET_SSE2 && ix86_vec_interleave_v2df_operator_ok (operands, 1)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (EQ, V4DImode, operands)")
  (-1 "(ix86_match_ccmode (insn, CCNOmode)) && (TARGET_64BIT)")
  (-1 "SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
   && COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(ix86_unary_operator_ok (NEG, DImode, operands)) && (!TARGET_64BIT)")
  (-1 "TARGET_80387 && flag_unsafe_math_optimizations")
  (-1 "((optimize && flag_peephole2) ? epilogue_completed : reload_completed) && (!TARGET_64BIT)")
  (-1 "TARGET_64BIT
   && TARGET_SLOW_IMUL_IMM32_MEM && optimize_insn_for_speed_p ()
   && !satisfies_constraint_K (operands[2])")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX2 && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V2DFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SFmode)
       == GET_MODE_NUNITS (V16SFmode))")
  (-1 "((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (CONST_INT_P (operands[2])
       ? (INTVAL (operands[2]) < GET_MODE_BITSIZE (SImode)
	  && INTVAL (operands[2])
	       >= (optimize_function_for_size_p (cfun) ? 8 : 32))
       : register_operand (operands[2], SImode))
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "ix86_binary_operator_ok (PLUS, QImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "IN_RANGE (INTVAL (operands[3]), 2, HOST_WIDE_INT_UC (0x80000000))
   && (UINTVAL (operands[3]) & (UINTVAL (operands[3]) - 1)) == 0")
  (-1 "TARGET_SSE2 && !TARGET_XOP
   && ix86_binary_operator_ok (EQ, V4SImode, operands)")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCNOmode)
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(!TARGET_X32) && (Pmode == DImode)")
  (-1 "(TARGET_CMOVE) && (TARGET_64BIT)")
  (-1 "(reload_completed && ix86_avoid_lea_for_add (insn, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE4_1) && (TARGET_AVX512F)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MULT, V4DFmode, operands) && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512VL) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1 && TARGET_AVX512BW && TARGET_AVX512VL)")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (XOR, SImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (SMIN, V4SImode, operands))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V8DImode, operands))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCZmode)
   && ix86_binary_operator_ok (PLUS, SImode, operands)")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V4SFmode, operands)")
  (-1 "(TARGET_AVX2) && (Pmode == DImode)")
  (-1 "TARGET_80387 && !TARGET_CMOVE")
  (-1 "(TARGET_SSE4_1) && (TARGET_AVX)")
  (-1 "(TARGET_FMA || TARGET_FMA4 || TARGET_AVX512F) && (TARGET_AVX)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (IOR, V32QImode, operands)) && (TARGET_AVX)")
  (-1 "ix86_binary_operator_ok (AND, HImode, operands)")
  (-1 "(TARGET_AVX && 1 && 1) && (TARGET_AVX512F)")
  (-1 "TARGET_USE_FANCY_MATH_387
   && ix86_libc_has_function (function_c99_misc)
   && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && TARGET_AVX512BW && TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V4SFmode == V4SFmode))")
  (-1 "(exact_log2 (INTVAL (operands[1])) >= 0
   && peep2_regno_dead_p (0, FLAGS_REG)) && (TARGET_64BIT)")
  (-1 "((TARGET_SSE) && (TARGET_AVX512F)) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512DQ && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512VL) && (TARGET_AVX512BW))")
  (-1 "(TARGET_80387 && TARGET_SAHF && !TARGET_CMOVE
   && (TARGET_USE_SIMODE_FIOP
       || optimize_function_for_size_p (cfun))) && ( reload_completed)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (UMAX, V32QImode, operands)")
  (-1 "TARGET_SSE_MATH")
  (-1 "!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && ix86_binary_operator_ok (AND, DImode, operands)")
  (0 "(TARGET_AVX512F) && (TARGET_SSE && 1 && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode))")
  (-1 "TARGET_PREFETCHWT1")
  (-1 "TARGET_XADD")
  (-1 "! TARGET_PARTIAL_REG_STALL && reload_completed
   && ! TARGET_FAST_PREFIX
   && optimize_insn_for_speed_p ()
   /* Ensure that the operand will remain sign-extended immediate.  */
   && ix86_match_ccmode (insn, INTVAL (operands[3]) >= 0 ? CCNOmode : CCZmode)")
  (-1 "peep2_reg_dead_p (3, operands[0])
   && (unsigned HOST_WIDE_INT) INTVAL (operands[2])
      == -(unsigned HOST_WIDE_INT) INTVAL (operands[3])
   && !reg_overlap_mentioned_p (operands[0], operands[1])")
  (-1 "!TARGET_CMOVE")
  (-1 "TARGET_64BIT && TARGET_FSGSBASE")
  (-1 "REGNO (operands[1]) != REGNO (operands[2])
   && peep2_reg_dead_p (2, operands[1])
   && peep2_reg_dead_p (4, operands[2])
   && !reg_mentioned_p (operands[2], operands[3])")
  (-1 "(TARGET_BMI
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "TARGET_SSE3
   && can_create_pseudo_p ()
   && ((rtx_equal_p (operands[1], operands[3])
	&& rtx_equal_p (operands[2], operands[4]))
       || (rtx_equal_p (operands[1], operands[4])
	   && rtx_equal_p (operands[2], operands[3])))")
  (-1 "reload_completed
    && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
    && !(INTVAL (operands[2]) & ~(255 << 8))
    && GET_MODE (operands[0]) != QImode")
  (-1 "(TARGET_64BIT && !TARGET_PARTIAL_REG_STALL) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V2DFmode, operands) && 1 && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DImode)
       == GET_MODE_NUNITS (V32QImode))")
  (-1 "TARGET_XOP || TARGET_AVX512VL")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMIN, V4DFmode, operands)
   && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V2DFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F
   && INTVAL (operands[2]) + 4 == INTVAL (operands[6])
   && INTVAL (operands[3]) + 4 == INTVAL (operands[7])
   && INTVAL (operands[4]) + 4 == INTVAL (operands[8])
   && INTVAL (operands[5]) + 4 == INTVAL (operands[9])
   && INTVAL (operands[2]) + 8 == INTVAL (operands[10])
   && INTVAL (operands[3]) + 8 == INTVAL (operands[11])
   && INTVAL (operands[4]) + 8 == INTVAL (operands[12])
   && INTVAL (operands[5]) + 8 == INTVAL (operands[13])
   && INTVAL (operands[2]) + 12 == INTVAL (operands[14])
   && INTVAL (operands[3]) + 12 == INTVAL (operands[15])
   && INTVAL (operands[4]) + 12 == INTVAL (operands[16])
   && INTVAL (operands[5]) + 12 == INTVAL (operands[17]))")
  (-1 "(!TARGET_CMOVE) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (PLUS, V4SFmode, operands) && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)))")
  (-1 "TARGET_64BIT && TARGET_FXSR")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512DQ) && (TARGET_SSE2))")
  (-1 "(TARGET_SSE) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX && 1
   && avx_vpermilp_parallel (operands[2], V4DFmode)) && (TARGET_AVX)")
  (-1 "TARGET_SSE2")
  (-1 "((TARGET_SINGLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && ((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && ix86_binary_operator_ok (XOR, DImode, operands)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V32HImode)
       || register_operand (operands[1], V32HImode))) && (TARGET_AVX512F)")
  (-1 "((GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
   && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && GET_MODE (operands[0]) == GET_MODE (operands[3])) && ( reload_completed)")
  (-1 "(TARGET_BMI2 && reload_completed
  && true_regnum (operands[1]) == DX_REG) && (!TARGET_64BIT)")
  (-1 "TARGET_64BIT && TARGET_SSE")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (AND, V8HImode, operands))")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (US_PLUS, V4HImode, operands)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (IOR, SImode, operands)")
  (-1 "TARGET_AVX512VBMI && 1")
  (-1 "(TARGET_BMI2 && reload_completed) && (TARGET_64BIT)")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (PLUS, SImode, operands)")
  (-1 "TARGET_MIX_SSE_I387")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_PLUS, V8HImode, operands))")
  (-1 "TARGET_64BIT || TARGET_SSE2")
  (-1 "(!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (2))
   && !reg_mentioned_p (operands[0],
			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))) && (word_mode == SImode)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V64QImode)
       || register_operand (operands[1], V64QImode))) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX && 1
   && avx_vpermilp_parallel (operands[2], V8SFmode)) && (TARGET_AVX)")
  (-1 "TARGET_AVX512VL")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE4_1 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512VL) && (TARGET_AVX)")
  (-1 "TARGET_AVX512F && (64 == 64 || TARGET_AVX512VL) && 1")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V2DImode, operands)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DFmode)
       == GET_MODE_NUNITS (V16HImode))")
  (-1 "TARGET_AVX512DQ")
  (-1 "TARGET_USE_FANCY_MATH_387
   && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)
   && flag_unsafe_math_optimizations")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (IOR, V16HImode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_SSE2 && TARGET_SSE_MATH
   && TARGET_SSE_PARTIAL_REG_DEPENDENCY
   && optimize_function_for_speed_p (cfun)
   && reload_completed && SSE_REG_P (operands[0])
   && (!EXT_REX_SSE_REG_P (operands[0])
       || TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_CMOVE) && (!TARGET_64BIT)")
  (-1 "TARGET_64BIT || (TARGET_CMPXCHG8B && (TARGET_80387 || TARGET_SSE))")
  (-1 "(TARGET_SSE2 && TARGET_SSE_MATH
   && TARGET_SSE_PARTIAL_REG_DEPENDENCY
   && optimize_function_for_speed_p (cfun)
   && reload_completed && SSE_REG_P (operands[0])
   && (!EXT_REX_SSE_REG_P (operands[0])
       || TARGET_AVX512VL)) && (TARGET_64BIT)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (SMIN, V32QImode, operands)")
  (-1 "TARGET_AVX512F
   && rtx_equal_p (operands[2], operands[0])")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V16HImode)
       == GET_MODE_NUNITS (V8SFmode))")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V16QImode)
       == GET_MODE_NUNITS (V4SImode))")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || SImode != DImode))
	&& TARGET_SSE_MATH)
   && can_create_pseudo_p ()")
  (-1 "TARGET_RTM")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (UMAX, V4SImode, operands))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V16HImode)
       == GET_MODE_NUNITS (V4DImode))")
  (-1 "(!TARGET_X32 && SIBLING_CALL_P (peep2_next_insn (1))
   && !reg_mentioned_p (operands[0],
			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (1)))) && (word_mode == DImode)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V4DFmode)
       == GET_MODE_NUNITS (V8SImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_SSE4_2) && (TARGET_AVX2)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[5]) - 2)
       && INTVAL (operands[3]) == (INTVAL (operands[6]) - 3)
       && INTVAL (operands[7]) == (INTVAL (operands[8]) - 1)
       && INTVAL (operands[7]) == (INTVAL (operands[9]) - 2)
       && INTVAL (operands[7]) == (INTVAL (operands[10]) - 3)
       && INTVAL (operands[11]) == (INTVAL (operands[12]) - 1)
       && INTVAL (operands[11]) == (INTVAL (operands[13]) - 2)
       && INTVAL (operands[11]) == (INTVAL (operands[14]) - 3)
       && INTVAL (operands[15]) == (INTVAL (operands[16]) - 1)
       && INTVAL (operands[15]) == (INTVAL (operands[17]) - 2)
       && INTVAL (operands[15]) == (INTVAL (operands[18]) - 3)))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V4SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V8SImode, operands)) && (TARGET_AVX)")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (XOR, SImode, operands)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V2DFmode, operands)) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V2DFmode, operands)) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && TARGET_64BIT) && (TARGET_SSE2))")
  (-1 "ix86_binary_operator_ok (AND, QImode, operands)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DImode)
       == GET_MODE_NUNITS (V16SImode))")
  (-1 "(TARGET_AVX && 1) && (TARGET_SSE2)")
  (-1 "((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (CONST_INT_P (operands[2])
       ? (INTVAL (operands[2]) < GET_MODE_BITSIZE (DImode)
	  && INTVAL (operands[2])
	       >= (optimize_function_for_size_p (cfun) ? 8 : 32))
       : register_operand (operands[2], SImode))
   && can_create_pseudo_p ()) && (TARGET_64BIT)")
  (-1 "(!(TARGET_PUSH_MEMORY || optimize_insn_for_size_p ())
   && !RTX_FRAME_RELATED_P (peep2_next_insn (0))) && (TARGET_64BIT)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (AND, V2SImode, operands)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (XFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC
   && !TARGET_64BIT && optimize_function_for_speed_p (cfun)
   && reload_completed")
  (-1 "((TARGET_DOUBLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V2DFmode, operands) && 1 && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MULT, V32HImode, operands)
   && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX512BW))")
  (-1 "TARGET_AVX512F && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (XOR, V16SFmode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (16 == 64 || TARGET_AVX512VL)) && (TARGET_SSE2))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_AVX2
   /* Disable this splitter if avx512vl_vec_dup_gprv*[qhs]i insn is
      available, because then we can broadcast from GPRs directly.
      For V*[QH]I modes it requires both -mavx512vl and -mavx512bw,
      for V*SI mode it requires just -mavx512vl.  */
   && !(TARGET_AVX512VL
	&& (TARGET_AVX512BW || QImode == SImode))
   && reload_completed && GENERAL_REG_P (operands[1])")
  (-1 "!TARGET_64BIT
   && TARGET_80387 && X87_ENABLE_FLOAT (XFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (XOR, V8SImode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_AVX512VL
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[5]) == (INTVAL (operands[6]) - 1))")
  (-1 "reload_completed && ix86_avoid_lea_for_add (insn, operands)")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (UMIN, V8HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V4DFmode, operands) && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (0 "(TARGET_AVX512F) && (TARGET_AVX512F && 1 && (DFmode == V16SFmode
							      || DFmode == V8DFmode
							      || DFmode == V8DImode
							      || DFmode == V16SImode))")
  (-1 "(TARGET_64BIT && TARGET_SSE2) && (TARGET_AVX2)")
  (-1 "(TARGET_80387 || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)) && (TARGET_64BIT)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "((TARGET_SINGLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(peep2_reg_dead_p (3, operands[0])
   && (unsigned HOST_WIDE_INT) INTVAL (operands[2])
      == -(unsigned HOST_WIDE_INT) INTVAL (operands[3])
   && !reg_overlap_mentioned_p (operands[0], operands[1])) && (TARGET_64BIT)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V4SImode)
       == GET_MODE_NUNITS (V8HImode))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V2DFmode == V4SFmode)) && (TARGET_SSE2))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (EQ, V32QImode, operands)")
  (-1 "TARGET_64BIT && TARGET_BMI2 && reload_completed")
  (-1 "ix86_unary_operator_ok (NOT, HImode, operands)")
  (-1 "(IN_RANGE (INTVAL (operands[3]), 2, HOST_WIDE_INT_UC (0x80000000))
   && (UINTVAL (operands[3]) & (UINTVAL (operands[3]) - 1)) == 0) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_MINUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(!TARGET_X32) && (word_mode == SImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512F && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)))")
  (-1 "(TARGET_64BIT || TARGET_SSE)
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "!TARGET_64BIT
   && TARGET_80387 && X87_ENABLE_FLOAT (DFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (SFmode, DImode)")
  (-1 "(ix86_binary_operator_ok (ASHIFTRT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_SSE2 && !TARGET_XOP
   && ix86_binary_operator_ok (EQ, V16QImode, operands)")
  (-1 "(ix86_binary_operator_ok (PLUS, TImode, operands)) && (TARGET_64BIT)")
  (-1 "(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH) && (TARGET_64BIT)")
  (-1 "TARGET_3DNOW && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "!TARGET_64BIT && SIBLING_CALL_P (peep2_next_insn (2))
   && !reg_mentioned_p (operands[0],
			CALL_INSN_FUNCTION_USAGE (peep2_next_insn (2)))")
  (-1 "TARGET_64BIT && (TARGET_USE_BT || reload_completed)")
  (-1 "(!TARGET_64BIT && TARGET_XSAVE) && (TARGET_XSAVEC)")
  (-1 "TARGET_SSE4_1 && ix86_binary_operator_ok (MULT, V4SImode, operands) && 1")
  (-1 "TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun)")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "(ix86_unary_operator_ok (NEG, DImode, operands)
   && mode_signbit_p (DImode, operands[2])) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (AND, V8DFmode, operands))")
  (-1 "((TARGET_DOUBLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(TARGET_80387 && TARGET_CMOVE)
   || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)")
  (-1 "TARGET_MMX && reload_completed")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512CD)")
  (-1 "(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && GET_CODE (operands[2]) != MINUS
   && peep2_reg_dead_p (3, operands[0])
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && ix86_match_ccmode (peep2_next_insn (2),
			 GET_CODE (operands[2]) == PLUS
			 ? CCGOCmode : CCNOmode)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && (true_regnum (operands[2]) != AX_REG
       || satisfies_constraint_K (operands[3]))
   && peep2_reg_dead_p (1, operands[2])")
  (-1 "(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && REG_P (operands[0]) && REG_P (operands[4])
   && REGNO (operands[0]) == REGNO (operands[4])
   && peep2_reg_dead_p (4, operands[0])
   && (QImode != QImode
       || immediate_operand (operands[2], SImode)
       || any_QIreg_operand (operands[2], SImode))
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && !reg_overlap_mentioned_p (operands[0], operands[2])
   && ix86_match_ccmode (peep2_next_insn (3),
			 (GET_CODE (operands[3]) == PLUS
			  || GET_CODE (operands[3]) == MINUS)
			 ? CCGOCmode : CCNOmode)")
  (-1 "(ix86_match_ccmode (insn, CCNOmode)
   && ((TARGET_64BIT && GET_MODE (operands[0]) == DImode)
       || GET_MODE (operands[0]) == SImode
       || GET_MODE (operands[0]) == HImode
       || GET_MODE (operands[0]) == QImode)
   /* Ensure that resulting mask is zero or sign extended operand.  */
   && INTVAL (operands[2]) >= 0
   && ((INTVAL (operands[1]) > 0
	&& INTVAL (operands[1]) + INTVAL (operands[2]) <= 32)
       || (DImode == DImode
	   && INTVAL (operands[1]) > 32
	   && INTVAL (operands[1]) + INTVAL (operands[2]) == 64))) && (TARGET_64BIT)")
  (-1 "!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun)")
  (-1 "REGNO (operands[0]) != REGNO (operands[1])
   && GENERAL_REGNO_P (REGNO (operands[0]))
   && GENERAL_REGNO_P (REGNO (operands[1]))")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (SS_PLUS, V4HImode, operands)")
  (-1 "(TARGET_SSE2) && (TARGET_AVX512VL)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (XOR, V64QImode, operands)) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX512F
   && (INTVAL (operands[3]) == (INTVAL (operands[7]) - 4)
       && INTVAL (operands[4]) == (INTVAL (operands[8]) - 4)
       && INTVAL (operands[5]) == (INTVAL (operands[9]) - 4)
       && INTVAL (operands[6]) == (INTVAL (operands[10]) - 4)
       && INTVAL (operands[3]) == (INTVAL (operands[11]) - 8)
       && INTVAL (operands[4]) == (INTVAL (operands[12]) - 8)
       && INTVAL (operands[5]) == (INTVAL (operands[13]) - 8)
       && INTVAL (operands[6]) == (INTVAL (operands[14]) - 8)
       && INTVAL (operands[3]) == (INTVAL (operands[15]) - 12)
       && INTVAL (operands[4]) == (INTVAL (operands[16]) - 12)
       && INTVAL (operands[5]) == (INTVAL (operands[17]) - 12)
       && INTVAL (operands[6]) == (INTVAL (operands[18]) - 12))")
  (-1 "TARGET_X32")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_MINUS, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512DQ && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)))")
  (-1 "(TARGET_LWP) && (Pmode == SImode)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (SFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC
   && !TARGET_64BIT && optimize_function_for_speed_p (cfun)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_PLUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V2DImode)
       == GET_MODE_NUNITS (V8HImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (AND, V16QImode, operands))")
  (-1 "((SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
   || (TARGET_SSE && (DFmode == TFmode))) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (SMIN, V4SFmode, operands)
   && 1 && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode))")
  (-1 "TARGET_AVX")
  (-1 "((SSE_FLOAT_MODE_P (TFmode) && TARGET_SSE_MATH)
   || (TARGET_SSE && (TFmode == TFmode))) && ( reload_completed)")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (MINUS, QImode, operands)")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V16QImode, operands)")
  (-1 "(TARGET_SSE
   && GET_RTX_CLASS (GET_CODE (operands[3])) == RTX_COMM_COMPARE) && (TARGET_AVX)")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || HImode != DImode))
   && can_create_pseudo_p ()")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DImode)
       == GET_MODE_NUNITS (V16SFmode))")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V16SImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)))")
  (-1 "TARGET_AVX512F && TARGET_AVX512VL
   && rtx_equal_p (operands[2], operands[0])")
  (-1 "(reload_completed && ix86_avoid_lea_for_addr (insn, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (PLUS, V8HImode, operands)")
  (-1 "(INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == SImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == SImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_REG_STALL
    || (operands[1] == const1_rtx
	&& TARGET_SHIFT1))")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V16HImode)
       == GET_MODE_NUNITS (V4DFmode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V8HImode, operands))")
  (-1 "TARGET_AVX && !TARGET_AVX2 && reload_completed")
  (-1 "(TARGET_SLOW_IMUL_IMM8 && optimize_insn_for_speed_p ()
   && satisfies_constraint_K (operands[2])) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE
   && 1 && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (IOR, V8DImode, operands)) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V32HImode)
       == GET_MODE_NUNITS (V16SFmode))")
  (-1 "TARGET_AVX512F
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[5]) == (INTVAL (operands[6]) - 1)
       && INTVAL (operands[7]) == (INTVAL (operands[8]) - 1)
       && INTVAL (operands[9]) == (INTVAL (operands[10]) - 1))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (SMAX, V16HImode, operands)")
  (-1 "(TARGET_XOP) && (TARGET_AVX)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_PLUS, V16HImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (AND, V64QImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512BW && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX2))")
  (-1 "(TARGET_SSE4_2
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V64QImode)
       == GET_MODE_NUNITS (V8DFmode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (MULT, V8HImode, operands)
   && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW)")
  (-1 "TARGET_80387 && X87_ENABLE_ARITH (DFmode)
   && !(TARGET_SSE2 && TARGET_SSE_MATH)")
  (-1 "TARGET_AVX512F
   && ix86_binary_operator_ok (MINUS, V8DImode, operands)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V32HImode)
       == GET_MODE_NUNITS (V32HImode))) && (TARGET_AVX512BW)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V32HImode)
       == GET_MODE_NUNITS (V8DImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512VBMI) && (TARGET_AVX512VL))")
  (-1 "TARGET_SSE4_2")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V4SFmode)
       == GET_MODE_NUNITS (V2DFmode))) && (TARGET_SSE2)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V32HImode)
       == GET_MODE_NUNITS (V8DFmode))")
  (-1 "TARGET_64BIT && INTVAL (operands[2]) == 31
   && (TARGET_USE_CLTD || optimize_function_for_size_p (cfun))
   && ix86_binary_operator_ok (ASHIFTRT, SImode, operands)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V16SImode, operands)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SImode)
       == GET_MODE_NUNITS (V8DImode))")
  (-1 "(TARGET_BMI2 && INTVAL (operands[4]) == 4 * BITS_PER_UNIT
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))) && (!TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_MINUS, V8HImode, operands))")
  (-1 "TARGET_SSE2 && !TARGET_XOP ")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V2DImode == V16SFmode
									      || V2DImode == V8DFmode
									      || V2DImode == V8DImode
									      || V2DImode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (LSHIFTRT, HImode, operands)")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (XOR, V16QImode, operands)")
  (-1 "TARGET_AVX512F && 1")
  (-1 "(TARGET_SSSE3) && (TARGET_AVX512VL)")
  (-1 "TARGET_FMA")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V8DFmode, operands)
   && 1 && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_SSSE3 || TARGET_AVX || TARGET_XOP) && (TARGET_AVX2)")
  (-1 "(INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V8SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_FMA) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V8DFmode, operands) && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "TARGET_SSE2 && 1
   && ix86_binary_operator_ok (MULT, V4SImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && !(MEM_P (operands[0]) && MEM_P (operands[1])))")
  (-1 "(TARGET_POPCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMAX, V2DFmode, operands)
   && 1 && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V8SFmode, operands) && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "TARGET_BMI")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_PLUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "((SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
    || (TARGET_SSE && (SFmode == TFmode)))
   && reload_completed")
  (-1 "TARGET_SLOW_IMUL_IMM32_MEM && optimize_insn_for_speed_p ()
   && !satisfies_constraint_K (operands[2])")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (SMAX, V16QImode, operands))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (UMIN, V8SImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_AVX) && (TARGET_AVX512F)")
  (-1 "!TARGET_64BIT && flag_pic")
  (-1 "TARGET_SSE2 && reload_completed")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V8DImode, operands)) && (TARGET_AVX512F))")
  (-1 "!TARGET_64BIT
   && ((TARGET_80387 && X87_ENABLE_FLOAT (XFmode, DImode)
	&& TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC)
       || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH))")
  (-1 "(TARGET_64BIT && TARGET_XSAVE) && (TARGET_XSAVES)")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V4SImode)
       == GET_MODE_NUNITS (V16QImode))")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
       && HImode != HImode 
       && ((HImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "TARGET_64BIT && ix86_unary_operator_ok (NEG, SImode, operands)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (MULT, V16HImode, operands)")
  (-1 "reload_completed
   && operands[1] == constm1_rtx")
  (-1 "TARGET_SPLIT_MEM_OPND_FOR_FP_CONVERTS
   && optimize_insn_for_speed_p ()
   && SSE_REG_P (operands[0])")
  (-1 "TARGET_3DNOW && ix86_binary_operator_ok (MULT, V2SFmode, operands)")
  (-1 "(TARGET_MWAITX) && (Pmode == DImode)")
  (-1 "(!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && ix86_match_ccmode (insn, CCNOmode)
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V8DImode == V16SFmode
									      || V8DImode == V8DFmode
									      || V8DImode == V8DImode
									      || V8DImode == V16SImode))")
  (-1 "TARGET_PKU")
  (-1 "ix86_binary_operator_ok (ROTATERT, QImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (UMAX, V8HImode, operands))")
  (-1 "(TARGET_SSE3) && (Pmode == SImode)")
  (-1 "TARGET_64BIT && !symbolic_operand (operands[1], DImode)
   && !x86_64_immediate_operand (operands[1], DImode)")
  (-1 "TARGET_USE_FANCY_MATH_387
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (AND, V4DFmode, operands)) && (TARGET_AVX))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V16HImode)
       == GET_MODE_NUNITS (V16HImode))")
  (-1 "(TARGET_SSE2
   && ((unsigned) exact_log2 (INTVAL (operands[3]))
       < GET_MODE_NUNITS (V2DImode))) && (TARGET_SSE4_1 && TARGET_64BIT)")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (MINUS, V4DImode, operands)) && (TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE
   && 1 && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(!SIBLING_CALL_P (insn)) && (word_mode == DImode)")
  (-1 "TARGET_BMI && ix86_match_ccmode (insn, CCNOmode)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V8DFmode)
       || register_operand (operands[1], V8DFmode))) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512DQ) && (TARGET_SSE2)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_PLUS, V16QImode, operands)")
  (-1 "SSE_FLOAT_MODE_P (SFmode)")
  (-1 "(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && REG_P (operands[0]) && REG_P (operands[4])
   && REGNO (operands[0]) == REGNO (operands[4])
   && peep2_reg_dead_p (4, operands[0])
   && (HImode != QImode
       || immediate_operand (operands[2], SImode)
       || any_QIreg_operand (operands[2], SImode))
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && !reg_overlap_mentioned_p (operands[0], operands[2])
   && ix86_match_ccmode (peep2_next_insn (3),
			 (GET_CODE (operands[3]) == PLUS
			  || GET_CODE (operands[3]) == MINUS)
			 ? CCGOCmode : CCNOmode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V16SFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "ix86_binary_operator_ok (ROTATE, SImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V8DFmode, operands) && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && (Pmode == SImode)")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || SImode != DImode))
	&& TARGET_SSE_MATH)")
  (-1 "(GET_MODE (operands[0]) == QImode
    || GET_MODE (operands[0]) == HImode)
   && (! TARGET_USE_MOV0 || optimize_insn_for_size_p ())
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (EQ, V16SImode, operands))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V4DImode, operands)) && (TARGET_AVX)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (XOR, V8DFmode, operands)")
  (-1 "TARGET_64BIT && TARGET_SSE2")
  (-1 "TARGET_XOP")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F
   && (64 == 64 || TARGET_AVX512VL)
   && !(MEM_P (operands[0]) && MEM_P (operands[1])))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (IOR, V64QImode, operands)) && (TARGET_AVX512F))")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V16QImode, operands)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_PLUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "TARGET_AVX512DQ && (INTVAL (operands[2]) == INTVAL (operands[3]) - 1)")
  (-1 "TARGET_64BIT
   && ix86_match_ccmode
	(insn,
	 /* If we are going to emit andl instead of andq, and the operands[2]
	    constant might have the SImode sign bit set, make sure the sign
	    flag isn't tested, because the instruction will set the sign flag
	    based on bit 31 rather than bit 63.  If it isn't CONST_INT,
	    conservatively assume it might have bit 31 set.  */
	 (satisfies_constraint_Z (operands[2])
	  && (!CONST_INT_P (operands[2])
	      || val_signbit_known_set_p (SImode, INTVAL (operands[2]))))
	 ? CCZmode : CCNOmode)
   && ix86_binary_operator_ok (AND, DImode, operands)")
  (-1 "ix86_binary_operator_ok (IOR, SImode, operands)")
  (-1 "(TARGET_SSSE3 && 1 && 1) && (TARGET_AVX2)")
  (-1 "(TARGET_SSE2) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MULT, V16SFmode, operands) && 1 && 1) && (TARGET_AVX512F)")
  (-1 "TARGET_AES")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V32QImode)
       == GET_MODE_NUNITS (V8SFmode))")
  (-1 "(TARGET_AVX512PF) && (Pmode == DImode)")
  (-1 "TARGET_SSE4_1")
  (-1 "((TARGET_LZCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)) && ( reload_completed)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_unary_operator_ok (NOT, SImode, operands)")
  (-1 "(ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (PLUS, DImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_SSE
   && ix86_binary_operator_ok (XOR, TFmode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V4DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE
   && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_MINUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "((GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
   && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && GET_MODE (operands[0]) == GET_MODE (operands[2])
   && (GET_MODE (operands[0]) == GET_MODE (operands[3])
       || GET_MODE (operands[3]) == VOIDmode)) && ( reload_completed)")
  (-1 "TARGET_QIMODE_MATH
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[CX_REG] || fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "TARGET_MPX")
  (-1 "(peep2_reg_dead_p (3, operands[1])
    || operands_match_p (operands[1], operands[3]))
   && ! reg_overlap_mentioned_p (operands[3], operands[0])
   && ! reg_set_p (operands[3], operands[4])")
  (-1 "TARGET_AVX512BW && ix86_binary_operator_ok (PLUS, V32HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V8SFmode, operands) && 1 && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE
   && 1 && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && (((((TARGET_AVX512VL) && (Pmode == DImode)) && (Pmode == DImode)) && (TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "(reload_completed) && (Pmode == DImode)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMAX, V8SFmode, operands)
   && 1 && 1) && (TARGET_AVX)")
  (-1 "TARGET_SSSE3 && ix86_binary_operator_ok (MULT, V4HImode, operands)")
  (-1 "TARGET_80387 || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)")
  (-1 "TARGET_SSE2 && TARGET_64BIT")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_MINUS, V16QImode, operands))")
  (-1 "reload_completed
    && GET_MODE (operands[2]) != QImode
    && (!REG_P (operands[2]) || ANY_QI_REG_P (operands[2]))
    && ((ix86_match_ccmode (insn, CCZmode)
	 && !(INTVAL (operands[3]) & ~255))
	|| (ix86_match_ccmode (insn, CCNOmode)
	    && !(INTVAL (operands[3]) & ~127)))")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_MINUS, V16QImode, operands)")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (PLUS, V8HImode, operands)) && (TARGET_AVX512VL)")
  (-1 "!TARGET_64BIT && TARGET_CMOVE
   && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && can_create_pseudo_p ()
   && optimize_insn_for_speed_p ()")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && 1 && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "optimize_insn_for_speed_p ()
   && ((QImode == HImode
       && TARGET_LCP_STALL)
       || (TARGET_SPLIT_LONG_MOVES
          && get_attr_length (insn) >= ix86_cur_cost ()->large_insn))")
  (-1 "(X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || HImode != DImode))
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (XOR, V32QImode, operands)) && (TARGET_AVX)")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFTRT, SImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (AND, V4SImode, operands))")
  (-1 "((SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
   || (TARGET_SSE && (SFmode == TFmode))) && ( reload_completed)")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ix86_binary_operator_ok (UMIN, V8QImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V4SImode, operands))")
  (-1 "(INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "TARGET_LP64 && ix86_check_movabs (insn, 0)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (IOR, QImode, operands)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
       && DImode != HImode 
       && ((DImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "TARGET_3DNOW && ix86_binary_operator_ok (MULT, V4HImode, operands)")
  (-1 "exact_log2 (INTVAL (operands[1])) >= 0
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (XOR, V4DImode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (MULT, V4HImode, operands)")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& (TARGET_SHIFT1
	    || TARGET_DOUBLE_WITH_ADD)))
   && ix86_match_ccmode (insn, CCGOCmode)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_MINUS, V8HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V2DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V8DFmode, operands) && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "reload_completed
    && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
    && !(~INTVAL (operands[2]) & ~(255 << 8))
    && GET_MODE (operands[0]) != QImode")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V8DFmode, operands) && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(!TARGET_X32 && peep2_reg_dead_p (2, operands[0])) && (word_mode == SImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_PLUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MINUS, V8SFmode, operands) && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_SSE2) && (TARGET_AVX2)")
  (-1 "TARGET_FMA || TARGET_FMA4")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (SMAX, V4SImode, operands))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MINUS, V2DFmode, operands) && 1 && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[CX_REG] || fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (UMIN, V4SImode, operands))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V8DFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "TARGET_XOP && !(MEM_P (operands[2]) && MEM_P (operands[3]))")
  (-1 "TARGET_AVX
   && 1 && 1
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFTRT, HImode, operands)")
  (-1 "TARGET_SSE2 && ix86_binary_operator_ok (UMIN, V16QImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX && (32 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V16SImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_FMA || TARGET_FMA4 || TARGET_AVX512F) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V8SFmode)
       == GET_MODE_NUNITS (V32QImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_MINUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX2) && (TARGET_AVX512F)")
  (0 "(TARGET_AVX512F) && (TARGET_AVX && 1 && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode))")
  (-1 "! TARGET_PARTIAL_REG_STALL
   && ix86_match_ccmode (insn, CCNOmode)
   && true_regnum (operands[2]) != AX_REG
   && peep2_reg_dead_p (1, operands[2])")
  (-1 "(!TARGET_64BIT && TARGET_CMOVE
   && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && can_create_pseudo_p ()
   && optimize_insn_for_speed_p ()) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (IOR, V8HImode, operands))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512ER)")
  (-1 "(TARGET_SSE2
   && ((unsigned) exact_log2 (INTVAL (operands[3]))
       < GET_MODE_NUNITS (V4SImode))) && (TARGET_SSE4_1)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2 && (32 == 64 || TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_AVX512DQ && 1")
  (-1 "TARGET_FXSR")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE
   && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "(INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == DImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == DImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (XOR, V16QImode, operands))")
  (-1 "(TARGET_AVX512F && !(MEM_P (operands[0]) && MEM_P (operands[1]))) && ( reload_completed)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (IOR, V4SFmode, operands))")
  (-1 "ix86_binary_operator_ok (PLUS, HImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DFmode)
       == GET_MODE_NUNITS (V8DImode))")
  (-1 "ix86_binary_operator_ok (ROTATE, HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512F))")
  (-1 "(ix86_binary_operator_ok (PLUS, DImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (32 == 64 || TARGET_AVX512VL)
   && avx_vpermilp_parallel (operands[2], V8SFmode)) && (TARGET_AVX))")
  (-1 "TARGET_AVX2
   /* Disable this splitter if avx512vl_vec_dup_gprv*[qhs]i insn is
      available, because then we can broadcast from GPRs directly.
      For V*[QH]I modes it requires both -mavx512vl and -mavx512bw,
      for V*SI mode it requires just -mavx512vl.  */
   && !(TARGET_AVX512VL
	&& (TARGET_AVX512BW || HImode == SImode))
   && reload_completed && GENERAL_REG_P (operands[1])")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
       && !flag_trapping_math)")
  (-1 "TARGET_AVX512BW")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (SMIN, V16QImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (AND, V16SFmode, operands))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode))")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V8SImode)
       == GET_MODE_NUNITS (V8SFmode))")
  (-1 "TARGET_64BIT
   && (optimize_function_for_size_p (cfun)
       || !TARGET_PARTIAL_FLAG_REG_STALL
       || (operands[2] == const1_rtx
	   && TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFTRT, SImode, operands)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (SFmode, HImode)
   && !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
   && (TARGET_USE_HIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "TARGET_BMI2 && INTVAL (operands[3]) == 4 * BITS_PER_UNIT")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "!TARGET_64BIT
   && ((TARGET_80387 && X87_ENABLE_FLOAT (DFmode, DImode)
	&& TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC)
       || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V8SImode, operands)) && (TARGET_AVX512VL))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "TARGET_SSE2 && ix86_binary_operator_ok (SMAX, V8HImode, operands)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MINUS, V8DFmode, operands) && 1 && 1) && (TARGET_AVX512F)")
  (-1 "ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (AND, QImode, operands)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "TARGET_80387
   && !(SSE_FLOAT_MODE_P (SFmode) && (!TARGET_FISTTP || TARGET_SSE_MATH))")
  (-1 "(TARGET_AVX) && ( reload_completed && (V8SFmode != V4DFmode || !TARGET_AVX2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V2DFmode, operands) && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "(! TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (PLUS, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V32QImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (SS_MINUS, V8QImode, operands)")
  (-1 "epilogue_completed")
  (-1 "(ix86_binary_operator_ok (ROTATE, DImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_MOVBE
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "((TARGET_DOUBLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -2*GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && (((((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (DFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC
   && !TARGET_64BIT && optimize_function_for_speed_p (cfun)
   && reload_completed")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SImode)
       == GET_MODE_NUNITS (V64QImode))) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V8DFmode, operands)
   && 1 && (V8DFmode == V16SFmode
									      || V8DFmode == V8DFmode
									      || V8DFmode == V8DImode
									      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "TARGET_MMX && !TARGET_SSE")
  (-1 "TARGET_USE_FANCY_MATH_387
   && ix86_libc_has_function (function_c99_misc)
   && !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512DQ && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)))")
  (-1 "TARGET_SSE4_2
   && can_create_pseudo_p ()")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4DImode == V16SFmode
							      || V4DImode == V8DFmode
							      || V4DImode == V8DImode
							      || V4DImode == V16SImode)) && (TARGET_AVX512VL))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512DQ && (V8DImode == V16SFmode
							      || V8DImode == V8DFmode
							      || V8DImode == V8DImode
							      || V8DImode == V16SImode)))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && 1 && (V8SFmode == V16SFmode
							      || V8SFmode == V8DFmode
							      || V8SFmode == V8DImode
							      || V8SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "ix86_binary_operator_ok (ASHIFT, QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V2DFmode, operands) && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V2DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_MPX) && (TARGET_LP64)")
  (-1 "TARGET_AVX512PF")
  (-1 "TARGET_3DNOW && ix86_binary_operator_ok (PLUS, V2SFmode, operands)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_MINUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V16SFmode, operands) && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX512BW && ix86_binary_operator_ok (PLUS, V64QImode, operands)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (MULT, V16SImode, operands)")
  (-1 "TARGET_SSE3
   && INTVAL (operands[2]) != INTVAL (operands[3])")
  (-1 "(TARGET_SSE && 1 && 1) && (TARGET_AVX)")
  (-1 "TARGET_3DNOW && ix86_binary_operator_ok (EQ, V2SFmode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (MINUS, V4SFmode, operands) && 1 && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode))")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (PLUS, QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V2DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (XOR, V8SFmode, operands)) && (TARGET_AVX))")
  (-1 "optimize_insn_for_speed_p ()
   && ((TARGET_NOT_UNPAIRABLE
	&& (!MEM_P (operands[0])
	    || !memory_displacement_operand (operands[0], SImode)))
       || (TARGET_NOT_VECTORMODE
	   && long_memory_operand (operands[0], SImode)))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE
   && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_USE_FANCY_MATH_387 && X87_ENABLE_ARITH (DFmode))
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F && 1 && 1) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V8HImode, operands)")
  (-1 "TARGET_AVX512F && !(MEM_P (operands[0]) && MEM_P (operands[1]))
   && reload_completed")
  (-1 "TARGET_BMI && !TARGET_64BIT && TARGET_STV && TARGET_SSE")
  (-1 "(!TARGET_X32 && peep2_reg_dead_p (2, operands[0])) && (word_mode == DImode)")
  (-1 "SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (IOR, V2DFmode, operands)) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V4SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "!(MEM_P (operands[0]) && MEM_P (operands[1]))
   && (lra_in_progress || reload_completed
       || (ix86_cmodel == CM_MEDIUM || ix86_cmodel == CM_LARGE)
       || !CONST_DOUBLE_P (operands[1])
       || (optimize_function_for_size_p (cfun)
	   && ((!(TARGET_SSE2 && TARGET_SSE_MATH)
		&& standard_80387_constant_p (operands[1]) > 0)
	       || (TARGET_SSE2 && TARGET_SSE_MATH
		   && standard_sse_constant_p (operands[1])))
	   && !memory_operand (operands[0], DFmode))
       || ((TARGET_64BIT || !TARGET_MEMORY_MISMATCH_STALL)
	   && memory_operand (operands[0], DFmode))
       || !TARGET_HARD_DF_REGS)")
  (-1 "(TARGET_SSE2 && 1 && 1) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V8DImode, operands))")
  (-1 "(ix86_target_stack_probe ()) && (Pmode == SImode)")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V8SFmode)
       == GET_MODE_NUNITS (V8SFmode))")
  (-1 "((TARGET_SINGLE_PUSH || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == -GET_MODE_SIZE (word_mode)
   && !ix86_using_red_zone ()) && ((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && ix86_binary_operator_ok (AND, DImode, operands)) && ( reload_completed)")
  (-1 "(TARGET_USE_8BIT_IDIV
   && TARGET_QIMODE_MATH
   && can_create_pseudo_p ()
   && !optimize_insn_for_size_p ()) && (TARGET_64BIT)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "Pmode == SImode")
  (-1 "(TARGET_BMI2 && reload_completed
  && true_regnum (operands[1]) == DX_REG) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE2) && (TARGET_AVX)")
  (-1 "((TARGET_64BIT) && (Pmode == DImode)) && ( 1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512ER))")
  (-1 "TARGET_CMOVE && !TARGET_PARTIAL_REG_STALL")
  (-1 "ix86_binary_operator_ok (ASHIFTRT, SImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V8SFmode, operands) && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(TARGET_SSE2 && 1 && 1) && (TARGET_AVX512F)")
  (-1 "! TARGET_POPCNT")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V4DFmode, operands)
   && 1 && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(!TARGET_64BIT
   && TARGET_80387 && X87_ENABLE_FLOAT (SFmode, DImode)
   && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC) && ( reload_completed)")
  (-1 "TARGET_80387
   && (reload_completed
       || !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH))")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH
       && SImode != HImode 
       && ((SImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (MINUS, V4SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(IN_RANGE (INTVAL (operands[2]), 1, 3)
   /* Validate MODE for lea.  */
   && ((!TARGET_PARTIAL_REG_STALL
	&& (GET_MODE (operands[0]) == QImode
	    || GET_MODE (operands[0]) == HImode))
       || GET_MODE (operands[0]) == SImode
       || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
   && (rtx_equal_p (operands[0], operands[3])
       || peep2_reg_dead_p (2, operands[0]))
   /* We reorder load and the shift.  */
   && !reg_overlap_mentioned_p (operands[0], operands[4])) && (word_mode == DImode)")
  (-1 "!TARGET_SSE2 && TARGET_SSE
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE3 && TARGET_AVX512VL)")
  (-1 "(optimize_insn_for_speed_p ()
   && (!TARGET_PARTIAL_REG_STALL || DImode == SImode)) && (TARGET_64BIT)")
  (-1 "TARGET_AVX2
   && (GET_MODE_NUNITS (V16HImode)
       == GET_MODE_NUNITS (V8SImode))")
  (-1 "(TARGET_AVX512BW && 1) && (TARGET_AVX2)")
  (-1 "TARGET_SSE3 && 1")
  (-1 "TARGET_MMX || (TARGET_SSE2 && V2SImode == V1DImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && TARGET_AVX512VL
   && ix86_binary_operator_ok (AND, V2DFmode, operands)) && (TARGET_SSE2))")
  (-1 "TARGET_80387 && !TARGET_CMOVE
   && (TARGET_USE_HIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_PLUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (XOR, V16SImode, operands)) && (TARGET_AVX512F))")
  (-1 "TARGET_AVX2 && 1 && 1")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && !TARGET_FISTTP
   && !(TARGET_64BIT && SSE_FLOAT_MODE_P (GET_MODE (operands[1])))")
  (-1 "!TARGET_64BIT && reload_completed
   && !(MMX_REG_P (operands[1]) || SSE_REG_P (operands[1]))")
  (-1 "(TARGET_SLOW_IMUL_IMM32_MEM && optimize_insn_for_speed_p ()
   && !satisfies_constraint_K (operands[2])) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (EQ, V2DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "TARGET_CMOVE")
  (-1 "TARGET_64BIT && ix86_binary_operator_ok (LSHIFTRT, SImode, operands)")
  (-1 "!TARGET_64BIT && reload_completed
   && !(MMX_REG_P (operands[0]) || SSE_REG_P (operands[0]))
   && true_regnum (operands[0]) == true_regnum (operands[1])")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (XOR, V2SImode, operands)")
  (-1 "TARGET_SSE2 && (V4SFmode == V4SFmode || TARGET_AVX2)")
  (-1 "TARGET_USE_FANCY_MATH_387")
  (-1 "X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || HImode != DImode))
	&& TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_AVX512VL) && (TARGET_AVX512BW)")
  (-1 "(TARGET_SSE && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(optimize_insn_for_size_p ()
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V4DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "reload_completed")
  (-1 "(TARGET_AVX512F && TARGET_64BIT) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V4SImode)
       == GET_MODE_NUNITS (V2DFmode))) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V4DFmode, operands) && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "(TARGET_ROUND && !flag_trapping_math) && (TARGET_AVX)")
  (-1 "ix86_match_ccmode (insn, CCmode)
   && ix86_binary_operator_ok (MINUS, HImode, operands)")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V2DImode, operands)")
  (-1 "TARGET_SSSE3")
  (-1 "TARGET_AVX512F
   && ix86_binary_operator_ok (PLUS, V16SImode, operands)")
  (-1 "(TARGET_SSE3) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "TARGET_64BIT && !TARGET_OPT_AGU
   && REGNO (operands[0]) == REGNO (operands[1])
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V16SImode, operands))")
  (-1 "(TARGET_SSE && reload_completed) && (Pmode == DImode)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (V4SFmode == V8SFmode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_AVX
   && avx_vperm2f128_parallel (operands[3], V8SFmode)")
  (-1 "(!TARGET_64BIT && TARGET_STV && TARGET_SSE2) && ( reload_completed && GENERAL_REG_P (operands[0]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (AND, V32HImode, operands)) && (TARGET_AVX512F))")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH
       && DImode != HImode 
       && ((DImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (XOR, V8HImode, operands)")
  (-1 "(SIBLING_CALL_P (insn)) && (word_mode == DImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V2DFmode, operands) && (16 == 64 || TARGET_AVX512VL) && 1) && (TARGET_SSE2))")
  (-1 "ix86_binary_operator_ok (ASHIFT, SImode, operands)")
  (-1 "TARGET_RDRND")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (PLUS, V64QImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V16SFmode, operands) && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_AVX512F) && (((((TARGET_AVX512VL) && (Pmode == SImode)) && (Pmode == SImode)) && (TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "(IN_RANGE (INTVAL (operands[3]), 2, HOST_WIDE_INT_UC (0x80000000))
   && (UINTVAL (operands[3]) & (UINTVAL (operands[3]) - 1)) == 0) && ( 1)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V8SImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "! TARGET_PARTIAL_REG_STALL && reload_completed
   && ((GET_MODE (operands[0]) == HImode
	&& ((optimize_function_for_speed_p (cfun) && !TARGET_FAST_PREFIX)
            /* ??? next two lines just !satisfies_constraint_K (...) */
	    || !CONST_INT_P (operands[2])
	    || satisfies_constraint_K (operands[2])))
       || (GET_MODE (operands[0]) == QImode
	   && (TARGET_PROMOTE_QImode || optimize_function_for_size_p (cfun))))")
  (-1 "TARGET_80387 && X87_ENABLE_ARITH (DFmode)
   && COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[AX_REG] || fixed_regs[CX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "TARGET_80387 || SSE_FLOAT_MODE_P (DFmode)")
  (-1 "!TARGET_PARTIAL_REG_STALL
   && (!TARGET_ZERO_EXTEND_WITH_AND || optimize_function_for_size_p (cfun))")
  (-1 "(ix86_target_stack_probe ()) && (Pmode == DImode)")
  (-1 "(TARGET_SSSE3 || TARGET_AVX || TARGET_XOP) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX512F && ix86_match_ccmode (insn, CCCmode)")
  (-1 "TARGET_SSE2 && 1")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V4SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V2DFmode, operands) && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (EQ, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SImode)
       == GET_MODE_NUNITS (V16SImode))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V64QImode)
       == GET_MODE_NUNITS (V16SImode))")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (SMIN, V4SFmode, operands)
   && 1 && 1")
  (-1 "ptr_mode == SImode")
  (-1 "(TARGET_80387 && X87_ENABLE_ARITH (SFmode))
    || (SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (XOR, V8SImode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SImode)
       == GET_MODE_NUNITS (V32HImode))) && (TARGET_AVX512BW)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (SS_MINUS, V8HImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V4DFmode, operands) && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V4HImode == V1DImode))
   && ix86_binary_operator_ok (PLUS, V4HImode, operands)")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (IOR, V8HImode, operands)")
  (-1 "ix86_unary_operator_ok (NOT, SImode, operands)")
  (-1 "TARGET_SSP_TLS_GUARD")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V2DFmode, operands) && (16 == 64 || TARGET_AVX512VL) && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2)))")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V8QImode == V1DImode))
   && ix86_binary_operator_ok (MINUS, V8QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (SMIN, V4SFmode, operands)
   && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)))")
  (-1 "((IN_RANGE (INTVAL (operands[3]), 2, HOST_WIDE_INT_UC (0x80000000))
   && (UINTVAL (operands[3]) & (UINTVAL (operands[3]) - 1)) == 0) && (TARGET_64BIT)) && ( 1)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL) && 1)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode))")
  (-1 "(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH) && (TARGET_64BIT)")
  (-1 "TARGET_MMX || (TARGET_SSE2 && V8QImode == V1DImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V2DFmode, operands)
   && 1 && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (MULT, V4SFmode, operands) && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)))")
  (-1 "reload_completed
    && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
    && !(~INTVAL (operands[2]) & ~255)
    && !(INTVAL (operands[2]) & 128)
    && GET_MODE (operands[0]) != QImode")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFTRT, QImode, operands)")
  (-1 "!TARGET_64BIT")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (64 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (AND, V8DImode, operands)) && (TARGET_AVX512F))")
  (-1 "(!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && ix86_binary_operator_ok (XOR, DImode, operands)) && ( reload_completed)")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (UMIN, V8SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "TARGET_80387
   && (!(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (US_MINUS, V4HImode, operands)")
  (-1 "TARGET_AVX512F && TARGET_64BIT")
  (-1 "(TARGET_SSE4A) && (TARGET_SSE2)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (AND, V8DFmode, operands)")
  (-1 "TARGET_AVX || (TARGET_AVX512VL && TARGET_AVX512F)")
  (-1 "TARGET_CMOVE && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && optimize_insn_for_speed_p ()")
  (-1 "(!(fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (16 == 64 || TARGET_AVX512VL)) && (TARGET_SSE2))")
  (-1 "((optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& TARGET_SHIFT1))
   && ix86_match_ccmode (insn, CCGOCmode)) && (TARGET_64BIT)")
  (-1 "ix86_match_ccmode (insn, CCmode)
   && ix86_binary_operator_ok (MINUS, SImode, operands)")
  (-1 "(unsigned HOST_WIDE_INT) INTVAL (operands[1])
   == -(unsigned HOST_WIDE_INT) INTVAL (operands[2])")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V4SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "((TARGET_SINGLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == DImode) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (Pmode == SImode)) && (word_mode == DImode)) && (Pmode == SImode)) && (Pmode == SImode))")
  (-1 "TARGET_80387 && (!TARGET_SSE_MATH || TARGET_MIX_SSE_I387)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V2DFmode, operands)) && (TARGET_SSE2)")
  (-1 "(ix86_binary_operator_ok (ROTATERT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "ix86_binary_operator_ok (XOR, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX))")
  (-1 "TARGET_BMI && !TARGET_AVOID_FALSE_DEP_FOR_BMI")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (PLUS, V8DFmode, operands) && 1 && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMAX, V8DFmode, operands)
   && 1 && 1) && (TARGET_AVX512F)")
  (-1 "((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && can_create_pseudo_p ()) && (TARGET_64BIT)")
  (-1 "TARGET_SSE2 && TARGET_SSE_MATH
   && TARGET_SSE_PARTIAL_REG_DEPENDENCY
   && optimize_function_for_speed_p (cfun)
   && SSE_REG_P (operands[0])
   && (!SSE_REG_P (operands[1])
       || REGNO (operands[0]) != REGNO (operands[1]))
   && (!EXT_REX_SSE_REG_P (operands[0])
       || TARGET_AVX512VL)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_PLUS, V32HImode, operands)) && (TARGET_AVX512BW)")
  (-1 "(ix86_match_ccmode (insn, CCZmode)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))) && (TARGET_64BIT)")
  (-1 "TARGET_80387
   && (!(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)")
  (-1 "TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (PLUS, V16QImode, operands)")
  (-1 "(!TARGET_64BIT && TARGET_SSE2 && TARGET_SSE_MATH
   && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "TARGET_80387
   && (reload_completed
       || !(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH))")
  (-1 "TARGET_SSE2 && !TARGET_XOP")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V8SImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_SSE3
   && can_create_pseudo_p ()
   && ((rtx_equal_p (operands[1], operands[3])
	&& rtx_equal_p (operands[2], operands[4]))
       || (rtx_equal_p (operands[1], operands[4])
	   && rtx_equal_p (operands[2], operands[3])))) && (TARGET_AVX)")
  (-1 "TARGET_SSE
   && (GET_MODE_NUNITS (V2DImode)
       == GET_MODE_NUNITS (V4SFmode))")
  (-1 "TARGET_CLWB")
  (-1 "(TARGET_64BIT
   && !(fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "(TARGET_POPCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && ( reload_completed)")
  (-1 "(TARGET_AVX) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V8DFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V16SImode, operands)) && (TARGET_AVX512F)")
  (-1 "(peep2_reg_dead_p (3, operands[1])
    || operands_match_p (operands[1], operands[3]))
   && ! reg_overlap_mentioned_p (operands[3], operands[0])")
  (-1 "TARGET_BSWAP")
  (-1 "TARGET_AVX512F")
  (-1 "(TARGET_CMPXCHG) && (TARGET_64BIT || TARGET_CMPXCHG8B)")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V2SImode == V1DImode))
   && ix86_binary_operator_ok (PLUS, V2SImode, operands)")
  (-1 "(ix86_binary_operator_ok (PLUS, DImode, operands)) && (!TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL))")
  (-1 "TARGET_64BIT
   && reload_completed && ix86_avoid_lea_for_add (insn, operands)")
  (-1 "(X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || HImode != DImode))
	&& TARGET_SSE_MATH)
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "((TARGET_SSE) && (TARGET_AVX)) && ( reload_completed)")
  (-1 "TARGET_AVX512F && ix86_binary_operator_ok (UMAX, V8DImode, operands)")
  (-1 "TARGET_80387 && reload_completed")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V8DImode, operands)) && (TARGET_AVX512F)")
  (-1 "TARGET_CMOVE && !TARGET_PARTIAL_REG_STALL
   && reload_completed")
  (-1 "optimize_insn_for_speed_p ()
   && ((SImode == HImode
       && TARGET_LCP_STALL)
       || (TARGET_SPLIT_LONG_MOVES
          && get_attr_length (insn) >= ix86_cur_cost ()->large_insn))")
  (-1 "(TARGET_LZCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE2 && 1 && 1) && (TARGET_AVX2)")
  (-1 "ix86_match_ccmode (insn, CCmode)
   && ix86_binary_operator_ok (MINUS, QImode, operands)")
  (-1 "TARGET_64BIT && ix86_match_ccmode (insn, CCNOmode)
   && ix86_unary_operator_ok (NOT, SImode, operands)")
  (-1 "ix86_match_ccmode (insn, CCGOCmode)")
  (-1 "(ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (MINUS, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1
   && (16 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (UMIN, V8HImode, operands))")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V4DImode, operands)) && (TARGET_AVX2)")
  (-1 "((SSE_FLOAT_MODE_P (TFmode) && TARGET_SSE_MATH)
    || (TARGET_SSE && (TFmode == TFmode)))
   && reload_completed")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V8SImode == V16SFmode
									      || V8SImode == V8DFmode
									      || V8SImode == V8DImode
									      || V8SImode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_SLOW_IMUL_IMM8 && optimize_insn_for_speed_p ()
   && satisfies_constraint_K (operands[2])")
  (-1 "!TARGET_64BIT && TARGET_80387 && TARGET_CMOVE
   && TARGET_AVOID_MEM_OPND_FOR_CMOVE
   && (MEM_P (operands[2]) || MEM_P (operands[3]))
   && can_create_pseudo_p ()
   && optimize_insn_for_speed_p ()")
  (-1 "(TARGET_80387 && X87_ENABLE_ARITH (SFmode))
    || TARGET_SSE_MATH")
  (-1 "(!(fixed_regs[AX_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX && (16 == 64 || TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SFmode)
       == GET_MODE_NUNITS (V32HImode))) && (TARGET_AVX512BW)")
  (-1 "ix86_binary_operator_ok (PLUS, HImode, operands)")
  (-1 "(TARGET_SSSE3) && (TARGET_AVX512BW)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512F && (V16SImode == V16SFmode
									      || V16SImode == V8DFmode
									      || V16SImode == V8DImode
									      || V16SImode == V16SImode)))")
  (-1 "ix86_binary_operator_ok (ROTATERT, SImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMAX, V16SFmode, operands)
   && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(optimize_function_for_size_p (cfun)
    || !TARGET_PARTIAL_FLAG_REG_STALL
    || (operands[2] == const1_rtx
	&& (TARGET_SHIFT1
	    || (TARGET_DOUBLE_WITH_ADD && REG_P (operands[0])))))
   && ix86_match_ccmode (insn, CCGOCmode)
   && ix86_binary_operator_ok (ASHIFT, SImode, operands)")
  (-1 "TARGET_80387
   && (reload_completed
       || !(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH))")
  (-1 "(SSE_FLOAT_MODE_P (TFmode) && TARGET_SSE_MATH)
   || (TARGET_SSE && (TFmode == TFmode))")
  (-1 "TARGET_HIMODE_MATH")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (16 == 64 || TARGET_AVX512VL)
   && avx_vpermilp_parallel (operands[2], V2DFmode)) && (TARGET_SSE2))")
  (-1 "(TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (CONST_INT_P (operands[2])
       ? (INTVAL (operands[2]) < GET_MODE_BITSIZE (SImode)
	  && INTVAL (operands[2])
	       >= (optimize_function_for_size_p (cfun) ? 8 : 32))
       : register_operand (operands[2], SImode))
   && can_create_pseudo_p ()")
  (-1 "TARGET_80387 || (TARGET_64BIT && SSE_FLOAT_MODE_P (SFmode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && ix86_binary_operator_ok (PLUS, V4SFmode, operands) && 1 && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode))")
  (-1 "(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
   || (TARGET_SSE && (SFmode == TFmode))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE4_1 && ix86_binary_operator_ok (MULT, V4SImode, operands) && (16 == 64 || TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2
   && TARGET_AVX512VL
   && INTVAL (operands[2]) + 4 == INTVAL (operands[6])
   && INTVAL (operands[3]) + 4 == INTVAL (operands[7])
   && INTVAL (operands[4]) + 4 == INTVAL (operands[8])
   && INTVAL (operands[5]) + 4 == INTVAL (operands[9]))")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V16SFmode)
       || register_operand (operands[1], V16SFmode))) && (TARGET_AVX512F)")
  (-1 "can_create_pseudo_p ()
   && SUBREG_P (operands[1])
   && REG_P (SUBREG_REG (operands[1]))
   && (GET_MODE_CLASS (GET_MODE (SUBREG_REG (operands[1]))) == MODE_VECTOR_INT
       || (GET_MODE_CLASS (GET_MODE (SUBREG_REG (operands[1])))
	   == MODE_VECTOR_FLOAT))
   && SUBREG_BYTE (operands[1]) == 0
   && TARGET_SSE
   && (GET_MODE_SIZE (GET_MODE (SUBREG_REG (operands[1]))) == 16
       || (GET_MODE_SIZE (GET_MODE (SUBREG_REG (operands[1]))) == 32
	   && TARGET_AVX)
       || (GET_MODE_SIZE (GET_MODE (SUBREG_REG (operands[1]))) == 64
	   && TARGET_AVX512F))
   && (DImode == SImode || TARGET_64BIT || MEM_P (operands[0]))")
  (-1 "ix86_binary_operator_ok (LSHIFTRT, SImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (SImode)-1))
      == GET_MODE_BITSIZE (SImode)-1")
  (-1 "!(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512VBMI && (64 == 64 || TARGET_AVX512VL))")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SFmode)
       == GET_MODE_NUNITS (V8DFmode))")
  (-1 "!TARGET_64BIT && reload_completed
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))
   && !(MMX_REG_P (operands[0]) || SSE_REG_P (operands[0]))")
  (-1 "(TARGET_AVX512DQ && 1) && (TARGET_AVX512F)")
  (-1 "TARGET_AVX512F
   && ((INTVAL (operands[2]) % 4 == 0)
       && INTVAL (operands[2]) == (INTVAL (operands[3]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[4]) == (INTVAL (operands[5]) - 1))
   && rtx_equal_p (operands[6], operands[0])")
  (-1 "TARGET_80387
   && !(SSE_FLOAT_MODE_P (XFmode) && (!TARGET_FISTTP || TARGET_SSE_MATH))")
  (-1 "(TARGET_SSE && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_SSE && reload_completed) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && TARGET_64BIT)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (PLUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F)))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (MULT, V8DFmode, operands) && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_BMI2) && (TARGET_64BIT)")
  (-1 "REGNO (operands[1]) == REGNO (operands[3])
   && ! reg_overlap_mentioned_p (operands[3], operands[0])")
  (-1 "word_mode == SImode")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2 && (16 == 64 || TARGET_AVX512VL))")
  (-1 "(optimize_insn_for_size_p ()
   && INTVAL (operands[0]) == 2*GET_MODE_SIZE (word_mode)) && (((((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "ix86_binary_operator_ok (ASHIFT, HImode, operands)")
  (-1 "SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH
   && !COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_BMI && !TARGET_64BIT && TARGET_STV && TARGET_SSE) && ( reload_completed)")
  (-1 "TARGET_SSE2 && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V16QImode, operands))")
  (-1 "TARGET_SHA")
  (-1 "TARGET_POPCNT")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MULT, V4DFmode, operands) && 1 && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (PLUS, V32HImode, operands)) && (TARGET_AVX512BW))")
  (-1 "TARGET_XOP && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "ix86_binary_operator_ok (PLUS, SImode, operands)")
  (-1 "TARGET_SSE")
  (-1 "TARGET_SSE && ix86_binary_operator_ok (MINUS, V4SFmode, operands) && 1 && 1")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (UMAX, V8HImode, operands)")
  (-1 "reload_completed
   && (GET_MODE (operands[0]) == TFmode
       || GET_MODE (operands[0]) == XFmode
       || GET_MODE (operands[0]) == DFmode
       || GET_MODE (operands[0]) == SFmode)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V4DFmode == V16SFmode
									      || V4DFmode == V8DFmode
									      || V4DFmode == V8DImode
									      || V4DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "TARGET_80387 && X87_ENABLE_ARITH (SFmode)
   && COMMUTATIVE_ARITH_P (operands[3])
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))")
  (-1 "TARGET_SSE && !(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSSE3 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (MULT, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_SSE2
   && 1 && 1) && (TARGET_AVX512BW)")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (UMIN, V16HImode, operands)")
  (-1 "(TARGET_AVX) && (TARGET_AVX2)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V4SFmode == V16SFmode
							      || V4SFmode == V8DFmode
							      || V4SFmode == V8DImode
							      || V4SFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2 && TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512BW && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX2)")
  (-1 "(TARGET_80387 && X87_ENABLE_ARITH (DFmode))
    || (TARGET_SSE2 && TARGET_SSE_MATH)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX && TARGET_AVX512VL)")
  (-1 "(TARGET_ROUND && !flag_trapping_math) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V8DImode)
       == GET_MODE_NUNITS (V64QImode))) && (TARGET_AVX512BW)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V8SImode == V16SFmode
									      || V8SImode == V8DFmode
									      || V8SImode == V8DImode
									      || V8SImode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "TARGET_AVOID_VECTOR_DECODE
   && SSE_FLOAT_MODE_P (SFmode)
   && optimize_insn_for_speed_p ()")
  (-1 "(TARGET_MOVBE
   && !(MEM_P (operands[0]) && MEM_P (operands[1]))) && (TARGET_64BIT)")
  (-1 "(TARGET_SSE2
   && (GET_MODE_NUNITS (V2DFmode)
       == GET_MODE_NUNITS (V8HImode))) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && TARGET_AVX512VL
   && ix86_binary_operator_ok (MULT, V4SImode, operands))")
  (-1 "TARGET_SSE2
   && (GET_MODE_NUNITS (V8HImode)
       == GET_MODE_NUNITS (V4SImode))")
  (-1 "(TARGET_AVX512F) && (((TARGET_AVX512VL) && (Pmode == DImode)) && (Pmode == DImode))")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F
   && (INTVAL (operands[3]) == (INTVAL (operands[7]) - 4)
       && INTVAL (operands[4]) == (INTVAL (operands[8]) - 4)
       && INTVAL (operands[5]) == (INTVAL (operands[9]) - 4)
       && INTVAL (operands[6]) == (INTVAL (operands[10]) - 4)
       && INTVAL (operands[3]) == (INTVAL (operands[11]) - 8)
       && INTVAL (operands[4]) == (INTVAL (operands[12]) - 8)
       && INTVAL (operands[5]) == (INTVAL (operands[13]) - 8)
       && INTVAL (operands[6]) == (INTVAL (operands[14]) - 8)
       && INTVAL (operands[3]) == (INTVAL (operands[15]) - 12)
       && INTVAL (operands[4]) == (INTVAL (operands[16]) - 12)
       && INTVAL (operands[5]) == (INTVAL (operands[17]) - 12)
       && INTVAL (operands[6]) == (INTVAL (operands[18]) - 12)))")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH
       && HImode != HImode 
       && ((HImode != DImode) || TARGET_64BIT)
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "TARGET_AVX512F
   && ix86_binary_operator_ok (PLUS, V8DImode, operands)")
  (-1 "!(MEM_P (operands[0]) && MEM_P (operands[1]))
   && (lra_in_progress || reload_completed
       || (ix86_cmodel == CM_MEDIUM || ix86_cmodel == CM_LARGE)
       || !CONST_DOUBLE_P (operands[1])
       || (optimize_function_for_size_p (cfun)
	   && standard_80387_constant_p (operands[1]) > 0
	   && !memory_operand (operands[0], XFmode))
       || (!TARGET_MEMORY_MISMATCH_STALL
	   && memory_operand (operands[0], XFmode))
       || !TARGET_HARD_XF_REGS)")
  (-1 "(TARGET_SSE2 && (V8SFmode == V4SFmode || TARGET_AVX2)) && (TARGET_AVX)")
  (-1 "TARGET_80387 && !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "TARGET_AVX512F
   && (GET_MODE_NUNITS (V16SImode)
       == GET_MODE_NUNITS (V16SFmode))")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (PLUS, V4DFmode, operands) && 1 && 1) && (TARGET_AVX)")
  (-1 "(ix86_unary_operator_ok (NOT, DImode, operands)) && (TARGET_64BIT)")
  (-1 "TARGET_AVX
   && avx_vperm2f128_parallel (operands[3], V4DFmode)")
  (-1 "(TARGET_SSE || TARGET_3DNOW_A)
   && ix86_binary_operator_ok (SMAX, V4HImode, operands)")
  (-1 "(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && peep2_reg_dead_p (4, operands[0])
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && !reg_overlap_mentioned_p (operands[0], operands[2])
   && (QImode != QImode
       || immediate_operand (operands[2], QImode)
       || any_QIreg_operand (operands[2], QImode))
   && ix86_match_ccmode (peep2_next_insn (3),
			 (GET_CODE (operands[3]) == PLUS
			  || GET_CODE (operands[3]) == MINUS)
			 ? CCGOCmode : CCNOmode)")
  (0 "(TARGET_AVX512F) && ((TARGET_SSE
   && 1 && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "TARGET_AVX512F && 1 && 1")
  (-1 "((TARGET_64BIT) && (Pmode == SImode)) && ( 1)")
  (-1 "TARGET_80387
   && (TARGET_USE_SIMODE_FIOP
       || optimize_function_for_size_p (cfun))")
  (-1 "((optimize_insn_for_size_p () || TARGET_MOVE_M1_VIA_OR)
   && GENERAL_REGNO_P (REGNO (operands[0]))
   && peep2_regno_dead_p (0, FLAGS_REG)) && (TARGET_64BIT)")
  (-1 "TARGET_64BIT && ix86_cmodel == CM_LARGE_PIC && !TARGET_PECOFF
   && GET_CODE (operands[3]) == CONST
   && GET_CODE (XEXP (operands[3], 0)) == UNSPEC
   && XINT (XEXP (operands[3], 0), 1) == UNSPEC_PLTOFF")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (AND, V64QImode, operands)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE4_1 && ix86_binary_operator_ok (MULT, V16SImode, operands) && (64 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512F))")
  (-1 "(!TARGET_64BIT && TARGET_STV && TARGET_SSE2
   && ix86_binary_operator_ok (IOR, DImode, operands)) && ( reload_completed)")
  (-1 "(TARGET_80387 && TARGET_CMOVE)
   || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL) && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "TARGET_AVX
   && 1
   && (INTVAL (operands[3]) == (INTVAL (operands[7]) - 4)
       && INTVAL (operands[4]) == (INTVAL (operands[8]) - 4)
       && INTVAL (operands[5]) == (INTVAL (operands[9]) - 4)
       && INTVAL (operands[6]) == (INTVAL (operands[10]) - 4))")
  (-1 "TARGET_AVX512DQ
   && rtx_equal_p (operands[2], operands[0])")
  (-1 "(TARGET_AVX512F && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && (V16SImode == V16SFmode
									      || V16SImode == V8DFmode
									      || V16SImode == V8DImode
									      || V16SImode == V16SImode))")
  (-1 "optimize_insn_for_speed_p ()
   && ((HImode == HImode
       && TARGET_LCP_STALL)
       || (!TARGET_USE_MOV0
          && TARGET_SPLIT_LONG_MOVES
          && get_attr_length (insn) >= ix86_cur_cost ()->large_insn))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "!TARGET_64BIT && SIBLING_CALL_P (insn)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMIN, V8SFmode, operands)
   && 1 && 1) && (TARGET_AVX)")
  (-1 "ix86_binary_operator_ok (ROTATE, QImode, operands)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && 1) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (IOR, V32HImode, operands)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && 1 && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "TARGET_80387
   && !COMMUTATIVE_ARITH_P (operands[3])")
  (-1 "(ix86_match_ccmode (insn, CCNOmode)
   && !(MEM_P (operands[1]) && MEM_P (operands[2]))) && (TARGET_64BIT)")
  (-1 "(((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (CONST_INT_P (operands[2])
       ? (INTVAL (operands[2]) < GET_MODE_BITSIZE (DImode)
	  && INTVAL (operands[2])
	       >= (optimize_function_for_size_p (cfun) ? 8 : 32))
       : register_operand (operands[2], SImode))
   && can_create_pseudo_p ()) && (TARGET_64BIT)) && ( 1)")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V4HImode == V1DImode))
   && ix86_binary_operator_ok (MINUS, V4HImode, operands)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F && ix86_binary_operator_ok (XOR, V8DFmode, operands))")
  (-1 "(TARGET_AVX512F) && (SSE_FLOAT_MODE_P (SFmode))")
  (-1 "TARGET_AVX2
   && ix86_binary_operator_ok (MULT, V8SImode, operands)")
  (-1 "(reload_completed && ix86_lea_for_add_ok (insn, operands)) && (TARGET_64BIT)")
  (-1 "(!TARGET_OPT_AGU
   && peep2_regno_dead_p (0, FLAGS_REG)) && (TARGET_64BIT)")
  (-1 "reload_completed
   && (GET_MODE (operands[0]) == TFmode
       || GET_MODE (operands[0]) == XFmode
       || GET_MODE (operands[0]) == DFmode)")
  (-1 "(GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
   && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && GET_MODE (operands[0]) == GET_MODE (operands[2])
   && (GET_MODE (operands[0]) == GET_MODE (operands[3])
       || GET_MODE (operands[3]) == VOIDmode)")
  (-1 "TARGET_SSE
   && (register_operand (operands[0], V2DFmode)
       || register_operand (operands[1], V2DFmode))")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V16HImode)
       || register_operand (operands[1], V16HImode))) && (TARGET_AVX)")
  (-1 "(TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "TARGET_SSE && !TARGET_SSE4_1")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL) && (V4DFmode == V16SFmode
							      || V4DFmode == V8DFmode
							      || V4DFmode == V8DImode
							      || V4DFmode == V16SImode)) && (TARGET_AVX)))")
  (-1 "can_create_pseudo_p ()
   && SUBREG_P (operands[1])
   && REG_P (SUBREG_REG (operands[1]))
   && (GET_MODE_CLASS (GET_MODE (SUBREG_REG (operands[1]))) == MODE_VECTOR_INT
       || (GET_MODE_CLASS (GET_MODE (SUBREG_REG (operands[1])))
	   == MODE_VECTOR_FLOAT))
   && SUBREG_BYTE (operands[1]) == 0
   && TARGET_SSE
   && (GET_MODE_SIZE (GET_MODE (SUBREG_REG (operands[1]))) == 16
       || (GET_MODE_SIZE (GET_MODE (SUBREG_REG (operands[1]))) == 32
	   && TARGET_AVX)
       || (GET_MODE_SIZE (GET_MODE (SUBREG_REG (operands[1]))) == 64
	   && TARGET_AVX512F))
   && (SImode == SImode || TARGET_64BIT || MEM_P (operands[0]))")
  (-1 "!(MEM_P (operands[0]) && MEM_P (operands[1]))")
  (-1 "optimize_insn_for_speed_p ()
   && ((TARGET_NOT_UNPAIRABLE
	&& (!MEM_P (operands[0])
	    || !memory_displacement_operand (operands[0], HImode)))
       || (TARGET_NOT_VECTORMODE
	   && long_memory_operand (operands[0], HImode)))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE
   && (64 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512F))")
  (-1 "REGNO (operands[0]) != REGNO (operands[1])")
  (-1 "ix86_binary_operator_ok (LSHIFTRT, QImode, operands)")
  (-1 "ix86_unary_operator_ok (NEG, QImode, operands)")
  (-1 "TARGET_64BIT && ix86_unary_operator_ok (NOT, SImode, operands)")
  (-1 "TARGET_SSE || TARGET_3DNOW_A")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V8SFmode)
       || register_operand (operands[1], V8SFmode))) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V2DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V8SFmode, operands)
   && 1 && (V8SFmode == V16SFmode
									      || V8SFmode == V8DFmode
									      || V8SFmode == V8DImode
									      || V8SFmode == V16SImode)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_F16C || TARGET_AVX512VL) && TARGET_AVX512VL)")
  (-1 "(TARGET_SSE
   && GET_RTX_CLASS (GET_CODE (operands[3])) == RTX_COMM_COMPARE) && (TARGET_SSE2)")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (SMIN, V4SImode, operands)")
  (-1 "TARGET_USE_FANCY_MATH_387
   && (!(SSE_FLOAT_MODE_P (SFmode) && TARGET_SSE_MATH)
       || TARGET_MIX_SSE_I387)
   && flag_unsafe_math_optimizations")
  (-1 "(TARGET_AVX512VBMI && 1) && (TARGET_AVX512VL)")
  (-1 "(ix86_binary_operator_ok (MINUS, DImode, operands)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MINUS, V16HImode, operands)) && (TARGET_AVX2))")
  (-1 "!(TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   /* Do not split stack checking probes.  */
   && GET_CODE (operands[3]) != IOR && operands[1] != const0_rtx")
  (-1 "TARGET_AVX
   && (GET_MODE_NUNITS (V4DFmode)
       == GET_MODE_NUNITS (V8SFmode))")
  (-1 "(reload_completed) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V2DImode, operands))")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX512F
   && (INTVAL (operands[2]) == (INTVAL (operands[3]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[4]) == (INTVAL (operands[5]) - 1)))")
  (-1 "TARGET_AVX2 && ix86_binary_operator_ok (SMIN, V8SImode, operands)")
  (-1 "(TARGET_AVX512F && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX512VL)")
  (-1 "(((TARGET_USE_BT || optimize_function_for_size_p (cfun))
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1
   && can_create_pseudo_p ()) && (TARGET_64BIT)) && ( 1)")
  (-1 "GET_MODE_SIZE (GET_MODE (operands[0])) <= UNITS_PER_WORD
   && (! TARGET_USE_MOV0 || optimize_insn_for_size_p ())
   && GENERAL_REGNO_P (REGNO (operands[0]))
   && peep2_regno_dead_p (0, FLAGS_REG)")
  (-1 "TARGET_80387 && X87_ENABLE_FLOAT (DFmode, SImode)")
  (-1 "(TARGET_SSE
   && (GET_MODE_NUNITS (V16QImode)
       == GET_MODE_NUNITS (V2DFmode))) && (TARGET_SSE2)")
  (-1 "TARGET_80387
   && COMMUTATIVE_ARITH_P (operands[3])")
  (-1 "TARGET_AVX512F
   && ix86_binary_operator_ok (MINUS, V16SImode, operands)")
  (-1 "(TARGET_CMPXCHG) && (TARGET_64BIT && TARGET_CMPXCHG16B)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (SS_PLUS, V64QImode, operands)) && (TARGET_AVX512BW))")
  (-1 "((TARGET_READ_MODIFY_WRITE || optimize_insn_for_size_p ())
   && GET_CODE (operands[2]) != MINUS
   && peep2_reg_dead_p (3, operands[0])
   && !reg_overlap_mentioned_p (operands[0], operands[1])
   && ix86_match_ccmode (peep2_next_insn (2),
			 GET_CODE (operands[2]) == PLUS
			 ? CCGOCmode : CCNOmode)) && (TARGET_64BIT)")
  (-1 "TARGET_USE_FANCY_MATH_387
   && flag_unsafe_math_optimizations
   && can_create_pseudo_p ()")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (IOR, V64QImode, operands)) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_PLUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "(TARGET_64BIT || TARGET_KEEPS_VECTOR_ALIGNED_STACK)
   && TARGET_SSE2 && TARGET_SSE_MATH")
  (-1 "TARGET_64BIT && TARGET_GNU2_TLS")
  (-1 "(TARGET_XOP) && (TARGET_SSE2)")
  (-1 "(TARGET_SSE) && (TARGET_SSE2 && TARGET_64BIT)")
  (-1 "TARGET_SAHF")
  (-1 "TARGET_SSE
   && (GET_MODE_NUNITS (V16QImode)
       == GET_MODE_NUNITS (V4SFmode))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMIN, V4SImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V4DImode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_64BIT && TARGET_SSE) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F
   && (GET_MODE_NUNITS (V64QImode)
       == GET_MODE_NUNITS (V64QImode))) && (TARGET_AVX512BW)")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V4DImode)
       || register_operand (operands[1], V4DImode))) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (US_MINUS, V32QImode, operands)) && (TARGET_AVX2))")
  (-1 "TARGET_64BIT && TARGET_XSAVE")
  (-1 "!TARGET_SEH && !ix86_static_chain_on_stack")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512DQ && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW
   && ix86_binary_operator_ok (PLUS, V8HImode, operands))")
  (-1 "(!(fixed_regs[CX_REG] || fixed_regs[SI_REG] || fixed_regs[DI_REG])
   && ix86_check_no_addr_space (insn)) && (Pmode == DImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_AVX2
   && ix86_binary_operator_ok (MULT, V8SImode, operands))")
  (-1 "(ix86_binary_operator_ok (MINUS, SImode, operands)) && (!TARGET_64BIT)")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (PLUS, V4SImode, operands)) && (TARGET_AVX512VL)")
  (-1 "TARGET_MMX || (TARGET_SSE2 && V4HImode == V1DImode)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (PLUS, V16SFmode, operands) && 1 && 1) && (TARGET_AVX512F)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && (TARGET_SSE && (16 == 64 || TARGET_AVX512VL) && (V4SFmode == V16SFmode
									      || V4SFmode == V8DFmode
									      || V4SFmode == V8DImode
									      || V4SFmode == V16SImode)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (32 == 64 || TARGET_AVX512VL) && 1) && (TARGET_AVX))")
  (-1 "(!TARGET_64BIT && TARGET_XSAVE) && (TARGET_XSAVES)")
  (-1 "(TARGET_SSE2 && 1 && 1
   && ix86_binary_operator_ok (US_MINUS, V32QImode, operands)) && (TARGET_AVX2)")
  (-1 "(TARGET_BMI && !TARGET_AVOID_FALSE_DEP_FOR_BMI) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && (64 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX512BW))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V8DFmode, operands) && 1 && (V8DFmode == V16SFmode
							      || V8DFmode == V8DFmode
							      || V8DFmode == V8DImode
							      || V8DFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE && TARGET_64BIT)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMIN, V2DFmode, operands)
   && 1 && 1) && (TARGET_SSE2)")
  (-1 "(TARGET_64BIT) && (Pmode == DImode)")
  (-1 "TARGET_RDSEED")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (IOR, V4DImode, operands)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512DQ) && (TARGET_AVX512VL)")
  (-1 "reload_completed && SSE_REG_P (operands[0])")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (UMAX, V4SImode, operands)")
  (-1 "(!TARGET_PARTIAL_REG_STALL
   && (!TARGET_ZERO_EXTEND_WITH_AND || optimize_function_for_size_p (cfun))) && ( reload_completed)")
  (-1 "(ix86_binary_operator_ok (ROTATERT, DImode, operands)
   && (INTVAL (operands[3]) & (GET_MODE_BITSIZE (DImode)-1))
      == GET_MODE_BITSIZE (DImode)-1) && (TARGET_64BIT)")
  (-1 "(TARGET_ROUND && !flag_trapping_math) && (TARGET_AVX512F)")
  (-1 "TARGET_SSE2 && TARGET_SSE_MATH
   && TARGET_USE_VECTOR_CONVERTS && optimize_function_for_speed_p (cfun)
   && reload_completed && SSE_REG_P (operands[0])
   && (MEM_P (operands[1]) || TARGET_INTER_UNIT_MOVES_TO_VEC)
   && (!EXT_REX_SSE_REG_P (operands[0])
       || TARGET_AVX512VL)")
  (-1 "((TARGET_BMI || TARGET_GENERIC)
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)) && (TARGET_64BIT)")
  (-1 "TARGET_LZCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)")
  (-1 "ix86_binary_operator_ok (MINUS, SImode, operands)
   && CONST_INT_P (operands[2])
   && INTVAL (operands[2]) == INTVAL (operands[3])")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (MINUS, V2DFmode, operands) && 1 && (V2DFmode == V16SFmode
							      || V2DFmode == V8DFmode
							      || V2DFmode == V8DImode
							      || V2DFmode == V16SImode)) && (TARGET_SSE2))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && (32 == 64 || TARGET_AVX512VL)
   && ix86_binary_operator_ok (AND, V8SImode, operands)) && (TARGET_AVX))")
  (-1 "(TARGET_AVX512F) && (TARGET_FMA || TARGET_FMA4)")
  (-1 "TARGET_MMX && ix86_binary_operator_ok (EQ, V4HImode, operands)")
  (-1 "!TARGET_64BIT && TARGET_SSE2 && TARGET_INTER_UNIT_MOVES_TO_VEC")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2 && 1 && (V16SFmode == V16SFmode
							      || V16SFmode == V8DFmode
							      || V16SFmode == V8DImode
							      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512VBMI && (32 == 64 || TARGET_AVX512VL)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_SSE4_1 && ix86_binary_operator_ok (MULT, V16SImode, operands) && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_BMI && ix86_match_ccmode (insn, CCNOmode)) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_AVX512F && ix86_binary_operator_ok (SMAX, V2DImode, operands)) && (TARGET_AVX512VL))")
  (-1 "(TARGET_AVX512F
   && ix86_binary_operator_ok (PLUS, V4DImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(TARGET_SSE && 1
   && ix86_binary_operator_ok (AND, V4DFmode, operands)) && (TARGET_AVX)")
  (-1 "(TARGET_64BIT) && (Pmode == SImode)")
  (-1 "(TARGET_MMX || (TARGET_SSE2 && V1DImode == V1DImode))
   && ix86_binary_operator_ok (PLUS, V1DImode, operands)")
  (-1 "TARGET_SSE2 && ix86_vec_interleave_v2df_operator_ok (operands, 0)")
  (-1 "(TARGET_SSE2) && (Pmode == SImode)")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && TARGET_AVX512VL && TARGET_AVX512BW)")
  (-1 "TARGET_SSE2 && 1 && 1")
  (-1 "(reload_completed
   && operands[1] == constm1_rtx) && (TARGET_64BIT)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (SMIN, V16SFmode, operands)
   && 1 && (V16SFmode == V16SFmode
									      || V16SFmode == V8DFmode
									      || V16SFmode == V8DImode
									      || V16SFmode == V16SImode)) && (TARGET_AVX512F))")
  (-1 "(ix86_match_ccmode (insn, CCNOmode)
   && ix86_binary_operator_ok (XOR, DImode, operands)) && (TARGET_64BIT)")
  (-1 "!TARGET_PARTIAL_REG_STALL
   && TARGET_ZERO_EXTEND_WITH_AND && optimize_function_for_speed_p (cfun)")
  (-1 "(TARGET_SSE && ix86_binary_operator_ok (SMIN, V8DFmode, operands)
   && 1 && 1) && (TARGET_AVX512F)")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (PLUS, V32QImode, operands)) && (TARGET_AVX512VL)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE && ix86_binary_operator_ok (XOR, V32QImode, operands)) && (TARGET_AVX))")
  (-1 "TARGET_USE_FANCY_MATH_387
   && ix86_libc_has_function (function_c99_misc)")
  (-1 "(TARGET_SSE2
   && ((unsigned) exact_log2 (INTVAL (operands[3]))
       < GET_MODE_NUNITS (V16QImode))) && (TARGET_SSE4_1)")
  (-1 "TARGET_CLFLUSHOPT")
  (-1 "(TARGET_AVX512VL) && (TARGET_SSE)")
  (-1 "ix86_unary_operator_ok (NEG, HImode, operands)
   && mode_signbit_p (HImode, operands[2])")
  (-1 "(TARGET_AVX512F) && (TARGET_SSE2 && (16 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW)")
  (-1 "(TARGET_USE_FANCY_MATH_387
    && (!(SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH)
	|| TARGET_MIX_SSE_I387)
    && flag_unsafe_math_optimizations)
   || (SSE_FLOAT_MODE_P (XFmode) && TARGET_SSE_MATH
       && !flag_trapping_math && !flag_rounding_math)")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX2))")
  (-1 "(TARGET_FAST_PREFIX && !TARGET_PARTIAL_REG_STALL)
    || optimize_function_for_size_p (cfun)")
  (-1 "!TARGET_64BIT && reload_completed
   && !(ANY_FP_REG_P (operands[0]) || ANY_FP_REG_P (operands[1]))")
  (-1 "TARGET_POPCNT
   && TARGET_AVOID_FALSE_DEP_FOR_BMI && optimize_function_for_speed_p (cfun)")
  (-1 "TARGET_80387 && TARGET_CMOVE
   && !(SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "TARGET_SSE2
   && ix86_binary_operator_ok (PLUS, V8HImode, operands)")
  (-1 "(ix86_binary_operator_ok (PLUS, DImode, operands)) && (TARGET_64BIT)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F && (V2DFmode == V16SFmode
									      || V2DFmode == V8DFmode
									      || V2DFmode == V8DImode
									      || V2DFmode == V16SImode)) && (TARGET_AVX512VL))")
  (-1 "ix86_unary_operator_ok (NEG, SImode, operands)")
  (-1 "TARGET_64BIT && TARGET_BMI2")
  (-1 "TARGET_AVX512F && reload_completed")
  (-1 "TARGET_SSE || TARGET_3DNOW")
  (-1 "(TARGET_SSE
   && (register_operand (operands[0], V4DFmode)
       || register_operand (operands[1], V4DFmode))) && (TARGET_AVX)")
  (-1 "(TARGET_AVX512BW && ix86_binary_operator_ok (PLUS, V16QImode, operands)) && (TARGET_AVX512VL)")
  (-1 "(IN_RANGE (INTVAL (operands[2]), 1, 3)
   /* Validate MODE for lea.  */
   && ((!TARGET_PARTIAL_REG_STALL
	&& (GET_MODE (operands[0]) == QImode
	    || GET_MODE (operands[0]) == HImode))
       || GET_MODE (operands[0]) == SImode
       || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
   && (rtx_equal_p (operands[0], operands[3])
       || peep2_reg_dead_p (2, operands[0]))
   /* We reorder load and the shift.  */
   && !reg_overlap_mentioned_p (operands[0], operands[4])) && (word_mode == SImode)")
  (-1 "(TARGET_AVX512DQ && 1) && (TARGET_AVX512VL)")
  (-1 "(((GET_MODE (operands[0]) == QImode || GET_MODE (operands[0]) == HImode)
      && (!TARGET_PARTIAL_REG_STALL || optimize_function_for_size_p (cfun)))
    || GET_MODE (operands[0]) == SImode
    || (TARGET_64BIT && GET_MODE (operands[0]) == DImode))
   && GET_MODE (operands[0]) == GET_MODE (operands[1])
   && ((unsigned HOST_WIDE_INT) INTVAL (operands[2])) - 1 < 3
   && ((unsigned HOST_WIDE_INT) INTVAL (operands[3])
       < (HOST_WIDE_INT_1U << INTVAL (operands[2])))")
  (-1 "(TARGET_SSE2 && 1 && 1) && (TARGET_AVX512BW)")
  (0 "(TARGET_AVX512F) && ((TARGET_AVX512F) && ((TARGET_AVX512F && (V4SImode == V16SFmode
									      || V4SImode == V8DFmode
									      || V4SImode == V8DImode
									      || V4SImode == V16SImode)) && (TARGET_AVX512VL)))")
  (-1 "TARGET_80387 || (SSE_FLOAT_MODE_P (DFmode) && TARGET_SSE_MATH)")
  (-1 "TARGET_AVX512VL
   && (INTVAL (operands[3]) == (INTVAL (operands[4]) - 1)
       && INTVAL (operands[3]) == (INTVAL (operands[5]) - 2)
       && INTVAL (operands[3]) == (INTVAL (operands[6]) - 3)
       && INTVAL (operands[7]) == (INTVAL (operands[8]) - 1)
       && INTVAL (operands[7]) == (INTVAL (operands[9]) - 2)
       && INTVAL (operands[7]) == (INTVAL (operands[10]) - 3))")
  (-1 "(TARGET_AVX512F) && ((TARGET_SSE2
   && ix86_binary_operator_ok (MULT, V16HImode, operands)
   && (32 == 64 || TARGET_AVX512VL) && TARGET_AVX512BW) && (TARGET_AVX2))")
  (-1 "TARGET_SSE && 1
   && ix86_binary_operator_ok (IOR, V4SImode, operands)")
  (-1 "(X87_FLOAT_MODE_P (GET_MODE (operands[1]))
   && TARGET_FISTTP
   && !((SSE_FLOAT_MODE_P (GET_MODE (operands[1]))
	 && (TARGET_64BIT || DImode != DImode))
	&& TARGET_SSE_MATH)
   && can_create_pseudo_p ()) && ( 1)")
  (-1 "(TARGET_SSE
   && 1 && 1) && (TARGET_AVX)")
  (-1 "TARGET_SSE4_1
   && 1
   && ix86_binary_operator_ok (UMIN, V4SImode, operands)")
  (-1 "(TARGET_SSE) && (TARGET_SSE4A)")
  (-1 "((TARGET_SINGLE_POP || optimize_insn_for_size_p ())
   && INTVAL (operands[0]) == GET_MODE_SIZE (word_mode)) && ((((((((word_mode == SImode) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (Pmode == DImode)) && (word_mode == SImode)) && (Pmode == DImode)) && (Pmode == DImode))")
])
