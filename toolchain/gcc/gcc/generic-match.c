/* Generated automatically by the program `genmatch' from
   a IL pattern matching and simplification description.  */

#include "generic-match-head.c"

bool
tree_power_of_two_cand (tree t, tree *res_ops)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  switch (TREE_CODE (t))
    {
    case INTEGER_CST:
      {
	{
/* #line 321 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { t };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:321, %s:%d\n", __FILE__, __LINE__);
	  res_ops[0] = captures[0];
	  return true;
	}
        break;
      }
    case LSHIFT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	switch (TREE_CODE (op0))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 323 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:323, %s:%d\n", __FILE__, __LINE__);
		res_ops[0] = captures[0];
		return true;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return false;
}

bool
tree_negate_expr_p (tree t)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  switch (TREE_CODE (t))
    {
    case INTEGER_CST:
      {
	{
/* #line 696 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
/* #line 696 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((INTEGRAL_TYPE_P (type) && TYPE_OVERFLOW_WRAPS (type)) || (!TYPE_OVERFLOW_SANITIZED (type) && may_negate_without_overflow_p (t)))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:695, %s:%d\n", __FILE__, __LINE__);
	      return true;
	    }
	}
        break;
      }
    case FIXED_CST:
      {
	{
/* #line 701 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:701, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case NEGATE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	{
/* #line 704 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 704 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (!TYPE_OVERFLOW_SANITIZED (type))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:703, %s:%d\n", __FILE__, __LINE__);
	      return true;
	    }
	}
        break;
      }
    case REAL_CST:
      {
	{
/* #line 707 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
/* #line 707 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (REAL_VALUE_NEGATIVE (TREE_REAL_CST (t)))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:706, %s:%d\n", __FILE__, __LINE__);
	      return true;
	    }
	}
        break;
      }
    case VECTOR_CST:
      {
	{
/* #line 712 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
/* #line 712 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (FLOAT_TYPE_P (TREE_TYPE (type)) || TYPE_OVERFLOW_WRAPS (type))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:711, %s:%d\n", __FILE__, __LINE__);
	      return true;
	    }
	}
        break;
      }
    default:;
    }
  return false;
}

bool
tree_truth_valued_p (tree t)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  {
/* #line 798 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { t };
/* #line 798 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if (INTEGRAL_TYPE_P (type) && TYPE_PRECISION (type) == 1)
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:797, %s:%d\n", __FILE__, __LINE__);
	return true;
      }
  }
  switch (TREE_CODE (t))
    {
    case LT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case LE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case EQ_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case NE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case GE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case GT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case UNORDERED_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case ORDERED_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case UNLT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case UNLE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case UNGT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case UNGE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case UNEQ_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case LTGT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case TRUTH_AND_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case TRUTH_ANDIF_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case TRUTH_OR_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case TRUTH_ORIF_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case TRUTH_XOR_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 801 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:801, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    case TRUTH_NOT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	{
/* #line 803 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:803, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    default:;
    }
  return false;
}

bool
tree_logical_inverted_value (tree t, tree *res_ops)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  switch (TREE_CODE (t))
    {
    case TRUTH_NOT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	{
/* #line 805 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:805, %s:%d\n", __FILE__, __LINE__);
	  res_ops[0] = captures[0];
	  return true;
	}
        break;
      }
    case BIT_NOT_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	if (tree_truth_valued_p (op0))
	  {
	    {
/* #line 807 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:807, %s:%d\n", __FILE__, __LINE__);
	      res_ops[0] = captures[0];
	      return true;
	    }
	  }
        break;
      }
    case EQ_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	if (integer_zerop (op1))
	  {
	    {
/* #line 809 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:809, %s:%d\n", __FILE__, __LINE__);
	      res_ops[0] = captures[0];
	      return true;
	    }
	  }
        break;
      }
    case NE_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	if (tree_truth_valued_p (op0))
	  {
	    if (integer_truep (op1))
	      {
		{
/* #line 811 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[1] ATTRIBUTE_UNUSED = { op0 };
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:811, %s:%d\n", __FILE__, __LINE__);
		  res_ops[0] = captures[0];
		  return true;
		}
	      }
	  }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	if (tree_truth_valued_p (op0))
	  {
	    if (integer_truep (op1))
	      {
		{
/* #line 813 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[1] ATTRIBUTE_UNUSED = { op0 };
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:813, %s:%d\n", __FILE__, __LINE__);
		  res_ops[0] = captures[0];
		  return true;
		}
	      }
	  }
        break;
      }
    default:;
    }
  return false;
}

bool
tree_compositional_complex (tree t)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  switch (TREE_CODE (t))
    {
    CASE_CONVERT:
      {
	tree op0 = TREE_OPERAND (t, 0);
	switch (TREE_CODE (op0))
	  {
	  case COMPLEX_EXPR:
	    {
	      tree o20 = TREE_OPERAND (op0, 0);
	      tree o21 = TREE_OPERAND (op0, 1);
	      {
/* #line 1620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1620, %s:%d\n", __FILE__, __LINE__);
		return true;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case COMPLEX_EXPR:
      {
	tree op0 = TREE_OPERAND (t, 0);
	tree op1 = TREE_OPERAND (t, 1);
	{
/* #line 1620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1620, %s:%d\n", __FILE__, __LINE__);
	  return true;
	}
        break;
      }
    default:;
    }
  return false;
}

bool
tree_double_value_p (tree t)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  {
/* #line 2785 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { t };
/* #line 2785 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if (TYPE_MAIN_VARIANT (TREE_TYPE (captures[0])) == double_type_node)
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2784, %s:%d\n", __FILE__, __LINE__);
	return true;
      }
  }
  return false;
}

bool
tree_float_value_p (tree t)
{
  tree type = TREE_TYPE (t);
  if (TREE_SIDE_EFFECTS (t)) return false;
  {
/* #line 2806 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { t };
/* #line 2806 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if (TYPE_MAIN_VARIANT (TREE_TYPE (captures[0])) == float_type_node)
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2805, %s:%d\n", __FILE__, __LINE__);
	return true;
      }
  }
  return false;
}

static tree
generic_simplify_1 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:148, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = non_lvalue_loc (loc, res_op0);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_2 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (pows), combined_fn ARG_UNUSED (copysigns))
{
  {
/* #line 400 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 HOST_WIDE_INT n;
/* #line 401 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (real_isinteger (&TREE_REAL_CST (captures[1]), &n) && (n & 1) == 0)
	{
	  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:402, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  res_op1 = captures[1];
	  tree res;
	  res = maybe_build_call_expr_loc (loc, pows, type, 2, res_op0, res_op1);
	  if (!res)
	    return NULL_TREE;
	  return res;
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_3 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 94 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (fold_real_zero_addition_p (type, captures[1], 0))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:95, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = non_lvalue_loc (loc, res_op0);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_4 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop), enum tree_code ARG_UNUSED (rbitop))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:775, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, bitop, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_5 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:649, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[1];
	{
	  tree ops2[1], res;
	  ops2[0] = captures[0];
	  res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
	  ops1[1] = res;
	}
	res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_6 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:781, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  {
    tree ops1[2], res;
    ops1[0] = captures[0];
    ops1[1] = captures[2];
    res = fold_build2_loc (loc, bitop, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
    res_op0 = res;
  }
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_7 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:469, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res =  build_zero_cst (type);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_8 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (scmp))
{
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (integer_zerop (captures[2]))
    {
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1842, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[2];
      tree res_op1;
      res_op1 = captures[3];
      tree res;
      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
      return res;
    }
  else
    {
/* #line 1843 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (ANY_INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[1])) && single_use (captures[0]))
	{
/* #line 1847 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (tree_int_cst_sgn (captures[2]) < 0)
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1848, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      res_op1 = captures[3];
	      tree res;
	      res = fold_build2_loc (loc, scmp, type, res_op0, res_op1);
	      return res;
	    }
	  else
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1849, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      res_op1 = captures[3];
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_9 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2216 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (SSA_NAME_IS_DEFAULT_DEF (captures[1]) && TREE_CODE (SSA_NAME_VAR (captures[1])) == PARM_DECL)
    {
      {
/* #line 2218 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree base = get_base_address (TREE_OPERAND (captures[0], 0));
/* #line 2219 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TREE_CODE (base) == VAR_DECL && auto_var_in_fn_p (base, current_function_decl))
	    {
/* #line 2221 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cmp == NE_EXPR)
		{
		  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2222, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res =  constant_boolean_node (true, type);
		  return res;
		}
	      else
		{
		  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2223, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res =  constant_boolean_node (false, type);
		  return res;
		}
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_10 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:792, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  {
    tree ops1[2], res;
    ops1[0] = captures[1];
    ops1[1] = captures[2];
    res = fold_build2_loc (loc, bitop, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
    res_op1 = res;
  }
  tree res;
  res = fold_build2_loc (loc, bitop, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_11 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (single_use (captures[0]) && single_use (captures[2]))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1882, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[3];
      tree res_op1;
      res_op1 = captures[1];
      tree res;
      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_12 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])) && wi::bit_and_not (captures[2], captures[3]) != 0)
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2234, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (cmp == NE_EXPR, type);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_13 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
/* #line 2998 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (type) && INTEGRAL_TYPE_P (TREE_TYPE (captures[2])) && INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && (TYPE_PRECISION (TREE_TYPE (captures[2])) == GET_MODE_PRECISION (TYPE_MODE (TREE_TYPE (captures[2])))) && (TYPE_PRECISION (TREE_TYPE (captures[4])) == GET_MODE_PRECISION (TYPE_MODE (TREE_TYPE (captures[4])))) && TYPE_PRECISION (type) == GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_PRECISION (TREE_TYPE (captures[1])) > TYPE_PRECISION (TREE_TYPE (captures[2])) && types_match (captures[2], captures[4]) && (tree_int_cst_min_precision (captures[5], TYPE_SIGN (TREE_TYPE (captures[2]))) <= TYPE_PRECISION (TREE_TYPE (captures[2]))) && (wi::bit_and (captures[5], wi::mask (TYPE_PRECISION (TREE_TYPE (captures[2])), true, TYPE_PRECISION (type))) == 0))
    {
/* #line 3018 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (TYPE_OVERFLOW_WRAPS (TREE_TYPE (captures[2])))
	{
	  {
/* #line 3019 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree ntype = TREE_TYPE (captures[2]);
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:3020, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[2], res;
		{
		  tree ops2[2], res;
		  ops2[0] = captures[2];
		  ops2[1] = captures[4];
		  res = fold_build2_loc (loc, op, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
		  ops1[0] = res;
		}
		{
		  tree ops2[1], res;
		  ops2[0] = captures[5];
		  if (TREE_TYPE (ops2[0]) != ntype)
		    res = fold_build1_loc (loc, NOP_EXPR, ntype, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[1] = res;
		}
		res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	  }
	}
      else
	{
	  {
/* #line 3021 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree utype = unsigned_type_for (TREE_TYPE (captures[2]));
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:3022, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[2], res;
		{
		  tree ops2[2], res;
		  {
		    tree ops3[1], res;
		    ops3[0] = captures[2];
		    if (TREE_TYPE (ops3[0]) != utype)
		      res = fold_build1_loc (loc, NOP_EXPR, utype, ops3[0]);
		    else
		      res = ops3[0];
		    ops2[0] = res;
		  }
		  {
		    tree ops3[1], res;
		    ops3[0] = captures[4];
		    if (TREE_TYPE (ops3[0]) != utype)
		      res = fold_build1_loc (loc, NOP_EXPR, utype, ops3[0]);
		    else
		      res = ops3[0];
		    ops2[1] = res;
		  }
		  res = fold_build2_loc (loc, op, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
		  ops1[0] = res;
		}
		{
		  tree ops2[1], res;
		  ops2[0] = captures[5];
		  if (TREE_TYPE (ops2[0]) != utype)
		    res = fold_build1_loc (loc, NOP_EXPR, utype, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[1] = res;
		}
		res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	  }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_14 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (FLOAT_TYPE_P (TREE_TYPE (captures[1])) && (DECIMAL_FLOAT_TYPE_P (TREE_TYPE (captures[0])) == DECIMAL_FLOAT_TYPE_P (TREE_TYPE (captures[1]))) && (DECIMAL_FLOAT_TYPE_P (TREE_TYPE (captures[0])) == DECIMAL_FLOAT_TYPE_P (TREE_TYPE (captures[2]))))
    {
      {
/* #line 1902 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree type1 = TREE_TYPE (captures[2]);
 if (TREE_CODE (captures[2]) == REAL_CST && !DECIMAL_FLOAT_TYPE_P (type1)) { REAL_VALUE_TYPE orig = TREE_REAL_CST (captures[2]);
 if (TYPE_PRECISION (type1) > TYPE_PRECISION (float_type_node) && exact_real_truncate (TYPE_MODE (float_type_node), &orig)) type1 = float_type_node;
 if (TYPE_PRECISION (type1) > TYPE_PRECISION (double_type_node) && exact_real_truncate (TYPE_MODE (double_type_node), &orig)) type1 = double_type_node;
 } tree newtype = (TYPE_PRECISION (TREE_TYPE (captures[1])) > TYPE_PRECISION (type1) ? TREE_TYPE (captures[1]) : type1);
/* #line 1919 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TYPE_PRECISION (TREE_TYPE (captures[0])) > TYPE_PRECISION (newtype))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1920, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[1];
		if (TREE_TYPE (ops1[0]) != newtype)
		  res = fold_build1_loc (loc, NOP_EXPR, newtype, ops1[0]);
		else
		  res = ops1[0];
		res_op0 = res;
	      }
	      tree res_op1;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		if (TREE_TYPE (ops1[0]) != newtype)
		  res = fold_build1_loc (loc, NOP_EXPR, newtype, ops1[0]);
		else
		  res = ops1[0];
		res_op1 = res;
	      }
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_15 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (ncmp))
{
/* #line 2272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && (TYPE_PRECISION (TREE_TYPE (captures[1])) == GET_MODE_PRECISION (TYPE_MODE (TREE_TYPE (captures[1])))) && element_precision (captures[0]) >= element_precision (captures[1]) && wi::only_sign_bit_p (captures[2], element_precision (captures[1])))
    {
      {
/* #line 2277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree stype = signed_type_for (TREE_TYPE (captures[1]));
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2278, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[1], res;
	    ops1[0] = captures[1];
	    if (TREE_TYPE (ops1[0]) != stype)
	      res = fold_build1_loc (loc, NOP_EXPR, stype, ops1[0]);
	    else
	      res = ops1[0];
	    res_op0 = res;
	  }
	  tree res_op1;
	  res_op1 =  build_zero_cst (stype);
	  tree res;
	  res = fold_build2_loc (loc, ncmp, type, res_op0, res_op1);
	  if (TREE_SIDE_EFFECTS (captures[2]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	  return res;
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_16 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shiftrotate))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1249, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_17 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:662, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[1];
	res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_18 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
/* #line 328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if ((TYPE_UNSIGNED (type) || tree_expr_nonnegative_p (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])) && integer_pow2p (captures[3]) && tree_int_cst_sgn (captures[3]) > 0)
    {
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:332, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      {
	tree ops1[1], res;
	{
	  tree ops2[2], res;
	  ops2[0] = captures[2];
	  ops2[1] =  build_int_cst (TREE_TYPE (captures[2]), 1);
	  res = fold_build2_loc (loc, MINUS_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
	  ops1[0] = res;
	}
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_19 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2245, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[1];
  tree res_op1;
  res_op1 =  build_zero_cst (TREE_TYPE (captures[1]));
  tree res;
  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_20 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:719, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res_op1;
      {
	tree ops1[1], res;
	{
	  tree ops2[1], res;
	  ops2[0] = captures[1];
	  res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
	  ops1[0] = res;
	}
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_21 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (floors), combined_fn ARG_UNUSED (truncs))
{
/* #line 2775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2781, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = maybe_build_call_expr_loc (loc, truncs, type, 1, res_op0);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_22 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1582, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_23 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (froms), combined_fn ARG_UNUSED (tos))
{
/* #line 2799 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (optimize && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2802, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	{
	  res = maybe_build_call_expr_loc (loc, tos, TREE_TYPE (ops1[0]), 1, ops1[0]);
	  if (!res)
	    return NULL_TREE;
	}
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_24 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:829, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res =  constant_boolean_node (op == NE_EXPR ? true : false, type);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_25 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 845 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:846, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_26 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if ((INTEGRAL_TYPE_P (TREE_TYPE (captures[2])) || POINTER_TYPE_P (TREE_TYPE (captures[2]))) && tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])))
    {
      {
/* #line 2359 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree arg1_type = TREE_TYPE (captures[2]);
 unsigned int prec = TYPE_PRECISION (arg1_type);
 wide_int max = wi::max_value (arg1_type);
 wide_int signed_max = wi::max_value (prec, SIGNED);
 wide_int min = wi::min_value (arg1_type);
/* #line 2368 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (wi::eq_p (captures[2], max))
	    {
/* #line 2370 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cmp == GT_EXPR)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2371, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res =  constant_boolean_node (false, type);
		  if (TREE_SIDE_EFFECTS (captures[0]))
		    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		  return res;
		}
	      else
		{
/* #line 2372 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == GE_EXPR)
		    {
		      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2373, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[0];
		      tree res_op1;
		      res_op1 = captures[2];
		      tree res;
		      res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
		      return res;
		    }
		  else
		    {
/* #line 2374 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == LE_EXPR)
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2375, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  constant_boolean_node (true, type);
			  if (TREE_SIDE_EFFECTS (captures[0]))
			    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
			  return res;
			}
		      else
			{
/* #line 2376 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == LT_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2377, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 = captures[2];
			      tree res;
			      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			}
		    }
		}
	    }
	  else
	    {
/* #line 2378 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (wi::eq_p (captures[2], min))
		{
/* #line 2380 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == LT_EXPR)
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2381, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res =  constant_boolean_node (false, type);
		      if (TREE_SIDE_EFFECTS (captures[0]))
			res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		      return res;
		    }
		  else
		    {
/* #line 2382 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == LE_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2383, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 = captures[2];
			  tree res;
			  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			  return res;
			}
		      else
			{
/* #line 2384 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == GE_EXPR)
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2385, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (true, type);
			      if (TREE_SIDE_EFFECTS (captures[0]))
				res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
			      return res;
			    }
			  else
			    {
/* #line 2386 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == GT_EXPR)
				{
				  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2387, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 = captures[0];
				  tree res_op1;
				  res_op1 = captures[2];
				  tree res;
				  res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
				  return res;
				}
			    }
			}
		    }
		}
	      else
		{
/* #line 2388 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (wi::eq_p (captures[2], max - 1))
		    {
/* #line 2390 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == GT_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2391, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::add (captures[2], 1));
			  tree res;
			  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			  return res;
			}
		      else
			{
/* #line 2392 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == LE_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2393, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::add (captures[2], 1));
			      tree res;
			      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			}
		    }
		  else
		    {
/* #line 2394 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (wi::eq_p (captures[2], min + 1))
			{
/* #line 2396 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == GE_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2397, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::sub (captures[2], 1));
			      tree res;
			      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			  else
			    {
/* #line 2398 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == LT_EXPR)
				{
				  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2399, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 = captures[0];
				  tree res_op1;
				  res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::sub (captures[2], 1));
				  tree res;
				  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
				  return res;
				}
			    }
			}
		      else
			{
/* #line 2400 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (wi::eq_p (captures[2], signed_max) && TYPE_UNSIGNED (arg1_type) && prec == GET_MODE_PRECISION (TYPE_MODE (arg1_type)) && INTEGRAL_TYPE_P (arg1_type))
			    {
/* #line 2411 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == LE_EXPR || cmp == GT_EXPR)
				{
				  {
/* #line 2412 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree st = signed_type_for (arg1_type);
/* #line 2413 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (cmp == LE_EXPR)
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2414, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    ops1[0] = captures[1];
					    if (TREE_TYPE (ops1[0]) != st)
					      res = fold_build1_loc (loc, NOP_EXPR, st, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  build_zero_cst (st);
					  tree res;
					  res = fold_build2_loc (loc, GE_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2415, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    ops1[0] = captures[1];
					    if (TREE_TYPE (ops1[0]) != st)
					      res = fold_build1_loc (loc, NOP_EXPR, st, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  build_zero_cst (st);
					  tree res;
					  res = fold_build2_loc (loc, LT_EXPR, type, res_op0, res_op1);
					  return res;
					}
				  }
				}
			    }
			}
		    }
		}
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_27 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2106, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[1];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_28 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (rotate))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1220, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_29 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:865, %s:%d\n", __FILE__, __LINE__);
  if (! tree_invariant_p (captures[1])) return NULL_TREE;
  tree res_op0;
  {
    tree ops1[2], res;
    {
      tree ops2[2], res;
      ops2[0] = unshare_expr (captures[1]);
      ops2[1] = captures[4];
      res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
      ops1[0] = res;
    }
    ops1[1] = captures[2];
    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
    res_op0 = res;
  }
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_30 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (logs), combined_fn ARG_UNUSED (pows))
{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations)
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2572, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	{
	  res = maybe_build_call_expr_loc (loc, logs, TREE_TYPE (ops1[0]), 1, ops1[0]);
	  if (!res)
	    return NULL_TREE;
	}
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_31 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op), enum tree_code ARG_UNUSED (ext))
{
/* #line 3031 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:3032, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res_op1;
      {
	tree ops1[2], res;
	ops1[0] = captures[2];
	ops1[1] = captures[4];
	res = fold_build2_loc (loc, ext, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, op, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_32 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 654 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:656, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[1];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_33 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shift))
{
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])) && TYPE_PRECISION (type) <= HOST_BITS_PER_WIDE_INT && tree_fits_uhwi_p (captures[4]) && tree_to_uhwi (captures[4]) > 0 && tree_to_uhwi (captures[4]) < TYPE_PRECISION (type))
    {
      {
/* #line 1323 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int shiftc = tree_to_uhwi (captures[4]);
 unsigned HOST_WIDE_INT mask = TREE_INT_CST_LOW (captures[5]);
 unsigned HOST_WIDE_INT newmask, zerobits = 0;
 tree shift_type = TREE_TYPE (captures[2]);
 unsigned int prec;
 if (shift == LSHIFT_EXPR) zerobits = ((((unsigned HOST_WIDE_INT) 1) << shiftc) - 1);
 else if (shift == RSHIFT_EXPR && (TYPE_PRECISION (shift_type) == GET_MODE_PRECISION (TYPE_MODE (shift_type)))) { prec = TYPE_PRECISION (TREE_TYPE (captures[2]));
 tree arg00 = captures[3];
 if (captures[2] != captures[3] && TYPE_UNSIGNED (TREE_TYPE (captures[3]))) { tree inner_type = TREE_TYPE (captures[3]);
 if ((TYPE_PRECISION (inner_type) == GET_MODE_PRECISION (TYPE_MODE (inner_type))) && TYPE_PRECISION (inner_type) < prec) { prec = TYPE_PRECISION (inner_type);
 if (shiftc < prec) shift_type = inner_type;
 } } zerobits = ~(unsigned HOST_WIDE_INT) 0;
 if (shiftc < prec) { zerobits >>= HOST_BITS_PER_WIDE_INT - shiftc;
 zerobits <<= prec - shiftc;
 } if (!TYPE_UNSIGNED (TREE_TYPE (captures[2])) && prec == TYPE_PRECISION (TREE_TYPE (captures[2]))) { if ((mask & zerobits) == 0) shift_type = unsigned_type_for (TREE_TYPE (captures[2]));
 else zerobits = 0;
 } }/* #line 1379 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((mask & zerobits) == mask)
	    {
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[4])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1380, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  build_int_cst (type, 0);
	      return res;
	    }
	  else
	    {
	      {
/* #line 1381 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 newmask = mask | zerobits;
/* #line 1382 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (newmask != mask && (newmask & (newmask + 1)) == 0)
		    {
		      {
/* #line 1383 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 for (prec = BITS_PER_UNIT;
 prec < HOST_BITS_PER_WIDE_INT;
 prec <<= 1) if (newmask == (((unsigned HOST_WIDE_INT) 1) << prec) - 1) break;
/* #line 1392 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (prec < HOST_BITS_PER_WIDE_INT || newmask == ~(unsigned HOST_WIDE_INT) 0)
			    {
			      {
/* #line 1394 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree newmaskt = build_int_cst_type (TREE_TYPE (captures[5]), newmask);
/* #line 1396 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (!tree_int_cst_equal (newmaskt, captures[5]))
				    {
/* #line 1397 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (shift_type != TREE_TYPE (captures[2]))
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1398, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    {
					      tree ops2[2], res;
					      {
						tree ops3[1], res;
						ops3[0] = captures[2];
						if (TREE_TYPE (ops3[0]) != shift_type)
						  res = fold_build1_loc (loc, NOP_EXPR, shift_type, ops3[0]);
						else
						  res = ops3[0];
						ops2[0] = res;
					      }
					      ops2[1] = captures[4];
					      res = fold_build2_loc (loc, shift, shift_type, ops2[0], ops2[1]);
					      ops1[0] = res;
					    }
					    if (TREE_TYPE (ops1[0]) != type)
					      res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1399, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				    }
			      }
			    }
		      }
		    }
	      }
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_34 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op), enum tree_code ARG_UNUSED (rop))
{
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:630, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	{
	  tree ops2[1], res;
	  ops2[0] = captures[0];
	  if (TREE_TYPE (ops2[0]) != type)
	    res = fold_build1_loc (loc, NOP_EXPR, type, ops2[0]);
	  else
	    res = ops2[0];
	  ops1[0] = res;
	}
	{
	  tree ops2[1], res;
	  ops2[0] = captures[1];
	  if (TREE_TYPE (ops2[0]) != type)
	    res = fold_build1_loc (loc, NOP_EXPR, type, ops2[0]);
	  else
	    res = ops2[0];
	  ops1[1] = res;
	}
	res = fold_build2_loc (loc, rop, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, BIT_NOT_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_35 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (REAL_VALUE_ISNAN (TREE_REAL_CST (captures[1])) && (cmp != LTGT_EXPR || ! flag_trapping_math))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2423, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (cmp == ORDERED_EXPR || cmp == LTGT_EXPR ? false : true, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_36 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
/* #line 1078 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
	    {
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1079, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[0];
		if (TREE_TYPE (ops1[0]) != type)
		  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
		else
		  res = ops1[0];
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
	      return res;
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_37 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[1])) && tree_nop_conversion_p (type, TREE_TYPE (captures[4])) && wi::bit_and (captures[2], captures[5]) == 0)
    {
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:643, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[3];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, BIT_IOR_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_38 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2939, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_39 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2106, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[1];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_40 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 HOST_WIDE_INT off0, off1;
 tree base0 = get_addr_base_and_unit_offset (TREE_OPERAND (captures[1], 0), &off0);
 tree base1 = get_addr_base_and_unit_offset (TREE_OPERAND (captures[2], 0), &off1);
 if (base0 && TREE_CODE (base0) == MEM_REF) { off0 += mem_ref_offset (base0).to_short_addr ();
 base0 = TREE_OPERAND (base0, 0);
 } if (base1 && TREE_CODE (base1) == MEM_REF) { off1 += mem_ref_offset (base1).to_short_addr ();
 base1 = TREE_OPERAND (base1, 0);
 }/* #line 2303 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (base0 && base1)
	{
	  {
/* #line 2304 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 int equal = 2;
 if (decl_in_symtab_p (base0) && decl_in_symtab_p (base1)) equal = symtab_node::get_create (base0) ->equal_address_to (symtab_node::get_create (base1));
 else if ((DECL_P (base0) || TREE_CODE (base0) == SSA_NAME || TREE_CODE (base0) == STRING_CST) && (DECL_P (base1) || TREE_CODE (base1) == SSA_NAME || TREE_CODE (base1) == STRING_CST)) equal = (base0 == base1);
/* #line 2319 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (equal == 1 && (cmp == EQ_EXPR || cmp == NE_EXPR || off0 == off1 || POINTER_TYPE_OVERFLOW_UNDEFINED || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && (DECL_P (base0) || TREE_CODE (base0) == STRING_CST))))
		{
/* #line 2328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == EQ_EXPR)
		    {
		      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
		      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2329, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res =  constant_boolean_node (off0 == off1, type);
		      return res;
		    }
		  else
		    {
/* #line 2330 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == NE_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2331, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  constant_boolean_node (off0 != off1, type);
			  return res;
			}
		      else
			{
/* #line 2332 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == LT_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2333, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (off0 < off1, type);
			      return res;
			    }
			  else
			    {
/* #line 2334 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == LE_EXPR)
				{
				  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
				  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2335, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  constant_boolean_node (off0 <= off1, type);
				  return res;
				}
			      else
				{
/* #line 2336 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (cmp == GE_EXPR)
				    {
				      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
				      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2337, %s:%d\n", __FILE__, __LINE__);
				      tree res;
				      res =  constant_boolean_node (off0 >= off1, type);
				      return res;
				    }
				  else
				    {
/* #line 2338 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (cmp == GT_EXPR)
					{
					  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2339, %s:%d\n", __FILE__, __LINE__);
					  tree res;
					  res =  constant_boolean_node (off0 > off1, type);
					  return res;
					}
				    }
				}
			    }
			}
		    }
		}
	      else
		{
/* #line 2340 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (equal == 0 && DECL_P (base0) && DECL_P (base1) && (!INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) || off0 == off1))
		    {
/* #line 2346 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == EQ_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2347, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  constant_boolean_node (false, type);
			  return res;
			}
		      else
			{
/* #line 2348 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == NE_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2349, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (true, type);
			      return res;
			    }
			}
		    }
		}
	  }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_41 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1034, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[1];
	  if (TREE_SIDE_EFFECTS (captures[0]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_42 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1173, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_43 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1181, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[1];
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_44 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 503 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (TYPE_UNSIGNED (TREE_TYPE (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:504, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (cmp == GT_EXPR, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_45 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2250 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])))
    {
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2251, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res_op1;
      {
	tree ops1[2], res;
	ops1[0] = captures[2];
	{
	  tree ops2[1], res;
	  ops2[0] = captures[3];
	  if (TREE_TYPE (ops2[0]) != TREE_TYPE (res_op0))
	    res = fold_build1_loc (loc, NOP_EXPR, TREE_TYPE (res_op0), ops2[0]);
	  else
	    res = ops2[0];
	  ops1[1] = res;
	}
	res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_46 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 724 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!HONOR_SIGN_DEPENDENT_ROUNDING (element_mode (type)) && !HONOR_SIGNED_ZEROS (element_mode (type)))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:726, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[1];
	res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	res_op0 = res;
      }
      tree res_op1;
      res_op1 = captures[0];
      tree res;
      res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_47 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, enum tree_code ARG_UNUSED (op))
{
/* #line 2968 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (type) && INTEGRAL_TYPE_P (TREE_TYPE (captures[2])) && INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && (TYPE_PRECISION (TREE_TYPE (captures[2])) == GET_MODE_PRECISION (TYPE_MODE (TREE_TYPE (captures[2])))) && (TYPE_PRECISION (TREE_TYPE (captures[4])) == GET_MODE_PRECISION (TYPE_MODE (TREE_TYPE (captures[4])))) && TYPE_PRECISION (type) == GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_PRECISION (TREE_TYPE (captures[1])) > TYPE_PRECISION (TREE_TYPE (captures[2])) && types_match (captures[2], captures[4]) && types_match (captures[2], type))
    {
/* #line 2985 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (TYPE_OVERFLOW_WRAPS (TREE_TYPE (captures[2])))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2986, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    ops1[0] = captures[2];
	    ops1[1] = captures[4];
	    res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
      else
	{
	  {
/* #line 2987 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree utype = unsigned_type_for (TREE_TYPE (captures[2]));
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2988, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[2], res;
		{
		  tree ops2[1], res;
		  ops2[0] = captures[2];
		  if (TREE_TYPE (ops2[0]) != utype)
		    res = fold_build1_loc (loc, NOP_EXPR, utype, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[0] = res;
		}
		{
		  tree ops2[1], res;
		  ops2[0] = captures[4];
		  if (TREE_TYPE (ops2[0]) != utype)
		    res = fold_build1_loc (loc, NOP_EXPR, utype, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[1] = res;
		}
		res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	  }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_48 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (POW))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
/* #line 2706 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!TREE_OVERFLOW (captures[2]))
	{
	  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2707, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[1];
	  tree res_op1;
	  {
	    tree ops1[2], res;
	    ops1[0] = captures[2];
	    ops1[1] =  build_one_cst (type);
	    res = fold_build2_loc (loc, MINUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op1 = res;
	  }
	  tree res;
	  res = maybe_build_call_expr_loc (loc, POW, type, 2, res_op0, res_op1);
	  if (!res)
	    return NULL_TREE;
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_49 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 296 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (type) && !TYPE_UNSIGNED (type) && !TYPE_OVERFLOW_TRAPS (type) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])) && (expr_not_equal_to (captures[0], TYPE_MIN_VALUE (type)) || expr_not_equal_to (captures[1], wi::minus_one (TYPE_PRECISION (TREE_TYPE (captures[1]))))))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:306, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[1];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, TRUNC_MOD_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_50 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (bswap))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1668, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_51 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shift))
{
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])) && TYPE_PRECISION (type) <= HOST_BITS_PER_WIDE_INT && tree_fits_uhwi_p (captures[4]) && tree_to_uhwi (captures[4]) > 0 && tree_to_uhwi (captures[4]) < TYPE_PRECISION (type))
    {
      {
/* #line 1323 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int shiftc = tree_to_uhwi (captures[4]);
 unsigned HOST_WIDE_INT mask = TREE_INT_CST_LOW (captures[5]);
 unsigned HOST_WIDE_INT newmask, zerobits = 0;
 tree shift_type = TREE_TYPE (captures[2]);
 unsigned int prec;
 if (shift == LSHIFT_EXPR) zerobits = ((((unsigned HOST_WIDE_INT) 1) << shiftc) - 1);
 else if (shift == RSHIFT_EXPR && (TYPE_PRECISION (shift_type) == GET_MODE_PRECISION (TYPE_MODE (shift_type)))) { prec = TYPE_PRECISION (TREE_TYPE (captures[2]));
 tree arg00 = captures[3];
 if (captures[2] != captures[3] && TYPE_UNSIGNED (TREE_TYPE (captures[3]))) { tree inner_type = TREE_TYPE (captures[3]);
 if ((TYPE_PRECISION (inner_type) == GET_MODE_PRECISION (TYPE_MODE (inner_type))) && TYPE_PRECISION (inner_type) < prec) { prec = TYPE_PRECISION (inner_type);
 if (shiftc < prec) shift_type = inner_type;
 } } zerobits = ~(unsigned HOST_WIDE_INT) 0;
 if (shiftc < prec) { zerobits >>= HOST_BITS_PER_WIDE_INT - shiftc;
 zerobits <<= prec - shiftc;
 } if (!TYPE_UNSIGNED (TREE_TYPE (captures[2])) && prec == TYPE_PRECISION (TREE_TYPE (captures[2]))) { if ((mask & zerobits) == 0) shift_type = unsigned_type_for (TREE_TYPE (captures[2]));
 else zerobits = 0;
 } }/* #line 1379 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((mask & zerobits) == mask)
	    {
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[4])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1380, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  build_int_cst (type, 0);
	      return res;
	    }
	  else
	    {
	      {
/* #line 1381 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 newmask = mask | zerobits;
/* #line 1382 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (newmask != mask && (newmask & (newmask + 1)) == 0)
		    {
		      {
/* #line 1383 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 for (prec = BITS_PER_UNIT;
 prec < HOST_BITS_PER_WIDE_INT;
 prec <<= 1) if (newmask == (((unsigned HOST_WIDE_INT) 1) << prec) - 1) break;
/* #line 1392 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (prec < HOST_BITS_PER_WIDE_INT || newmask == ~(unsigned HOST_WIDE_INT) 0)
			    {
			      {
/* #line 1394 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree newmaskt = build_int_cst_type (TREE_TYPE (captures[5]), newmask);
/* #line 1396 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (!tree_int_cst_equal (newmaskt, captures[5]))
				    {
/* #line 1397 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (shift_type != TREE_TYPE (captures[2]))
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1398, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    {
					      tree ops2[2], res;
					      {
						tree ops3[1], res;
						ops3[0] = captures[2];
						if (TREE_TYPE (ops3[0]) != shift_type)
						  res = fold_build1_loc (loc, NOP_EXPR, shift_type, ops3[0]);
						else
						  res = ops3[0];
						ops2[0] = res;
					      }
					      ops2[1] = captures[4];
					      res = fold_build2_loc (loc, shift, shift_type, ops2[0], ops2[1]);
					      ops1[0] = res;
					    }
					    if (TREE_TYPE (ops1[0]) != type)
					      res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1399, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				    }
			      }
			    }
		      }
		    }
	      }
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_52 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
/* #line 1084 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (!TYPE_OVERFLOW_TRAPS (type) && tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
	    {
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1086, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[0];
		if (TREE_TYPE (ops1[0]) != type)
		  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
		else
		  res = ops1[0];
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, BIT_NOT_EXPR, type, res_op0);
	      return res;
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_53 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
/* #line 328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if ((TYPE_UNSIGNED (type) || tree_expr_nonnegative_p (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])) && integer_pow2p (captures[3]) && tree_int_cst_sgn (captures[3]) > 0)
    {
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:332, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      {
	tree ops1[1], res;
	{
	  tree ops2[2], res;
	  ops2[0] = captures[2];
	  ops2[1] =  build_int_cst (TREE_TYPE (captures[2]), 1);
	  res = fold_build2_loc (loc, MINUS_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
	  ops1[0] = res;
	}
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_54 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op), enum tree_code ARG_UNUSED (rop))
{
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:680, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res_op1;
      {
	tree ops1[2], res;
	{
	  tree ops2[1], res;
	  ops2[0] = captures[1];
	  if (TREE_TYPE (ops2[0]) != type)
	    res = fold_build1_loc (loc, NOP_EXPR, type, ops2[0]);
	  else
	    res = ops2[0];
	  ops1[0] = res;
	}
	{
	  tree ops2[1], res;
	  ops2[0] = captures[2];
	  if (TREE_TYPE (ops2[0]) != type)
	    res = fold_build1_loc (loc, NOP_EXPR, type, ops2[0]);
	  else
	    res = ops2[0];
	  ops1[1] = res;
	}
	res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, rop, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_55 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (div))
{
/* #line 352 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (ANY_INTEGRAL_TYPE_P (type) && TYPE_OVERFLOW_UNDEFINED (type))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:354, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res = captures[0];
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_56 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (inner_op), enum tree_code ARG_UNUSED (outer_op))
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
	  {
/* #line 1056 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree cst = const_binop (outer_op == inner_op ? PLUS_EXPR : MINUS_EXPR, type, captures[1], captures[2]);
/* #line 1058 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cst && !TREE_OVERFLOW (cst))
		{
		  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1059, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  res_op1 =  cst;
		  tree res;
		  res = fold_build2_loc (loc, inner_op, type, res_op0, res_op1);
		  return res;
		}
	  }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_57 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (icmp), enum tree_code ARG_UNUSED (ncmp))
{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (VECTOR_TYPE_P (type) || (INTEGRAL_TYPE_P (type) && TYPE_PRECISION (type) == 1))
    {
      {
/* #line 1806 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 enum tree_code ic = invert_tree_comparison (cmp, HONOR_NANS (captures[0]));
/* #line 1808 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (ic == icmp)
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1809, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res;
	      res = fold_build2_loc (loc, icmp, type, res_op0, res_op1);
	      return res;
	    }
	  else
	    {
/* #line 1810 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (ic == ncmp)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1811, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  res_op1 = captures[1];
		  tree res;
		  res = fold_build2_loc (loc, ncmp, type, res_op0, res_op1);
		  return res;
		}
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_58 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop))
{
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (((TREE_CODE (captures[1]) == INTEGER_CST && INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && int_fits_type_p (captures[1], TREE_TYPE (captures[0]))) || types_match (captures[0], captures[1])) && (bitop != BIT_AND_EXPR ||0) && ( TYPE_PRECISION (TREE_TYPE (captures[0])) < TYPE_PRECISION (type) || GET_MODE_CLASS (TYPE_MODE (type)) != MODE_INT || TYPE_PRECISION (type) != GET_MODE_PRECISION (TYPE_MODE (type))))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:762, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[0];
	{
	  tree ops2[1], res;
	  ops2[0] = captures[1];
	  if (TREE_TYPE (ops2[0]) != TREE_TYPE (ops1[0]))
	    res = fold_build1_loc (loc, NOP_EXPR, TREE_TYPE (ops1[0]), ops2[0]);
	  else
	    res = ops2[0];
	  ops1[1] = res;
	}
	res = fold_build2_loc (loc, bitop, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_59 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (outer_op))
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
	  {
/* #line 1065 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree cst = const_binop (outer_op, type, captures[0], captures[2]);
/* #line 1066 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cst && !TREE_OVERFLOW (cst))
		{
		  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
		  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1067, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 =  cst;
		  tree res_op1;
		  res_op1 = captures[1];
		  tree res;
		  res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
		  return res;
		}
	  }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_60 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (ncmp))
{
/* #line 2272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && (TYPE_PRECISION (TREE_TYPE (captures[1])) == GET_MODE_PRECISION (TYPE_MODE (TREE_TYPE (captures[1])))) && element_precision (captures[0]) >= element_precision (captures[1]) && wi::only_sign_bit_p (captures[2], element_precision (captures[1])))
    {
      {
/* #line 2277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree stype = signed_type_for (TREE_TYPE (captures[1]));
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2278, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[1], res;
	    ops1[0] = captures[1];
	    if (TREE_TYPE (ops1[0]) != stype)
	      res = fold_build1_loc (loc, NOP_EXPR, stype, ops1[0]);
	    else
	      res = ops1[0];
	    res_op0 = res;
	  }
	  tree res_op1;
	  res_op1 =  build_zero_cst (stype);
	  tree res;
	  res = fold_build2_loc (loc, ncmp, type, res_op0, res_op1);
	  if (TREE_SIDE_EFFECTS (captures[2]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	  return res;
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_61 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1040, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[0];
	  if (TREE_SIDE_EFFECTS (captures[1]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_62 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shift))
{
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])) && TYPE_PRECISION (type) <= HOST_BITS_PER_WIDE_INT && tree_fits_uhwi_p (captures[4]) && tree_to_uhwi (captures[4]) > 0 && tree_to_uhwi (captures[4]) < TYPE_PRECISION (type))
    {
      {
/* #line 1323 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int shiftc = tree_to_uhwi (captures[4]);
 unsigned HOST_WIDE_INT mask = TREE_INT_CST_LOW (captures[5]);
 unsigned HOST_WIDE_INT newmask, zerobits = 0;
 tree shift_type = TREE_TYPE (captures[2]);
 unsigned int prec;
 if (shift == LSHIFT_EXPR) zerobits = ((((unsigned HOST_WIDE_INT) 1) << shiftc) - 1);
 else if (shift == RSHIFT_EXPR && (TYPE_PRECISION (shift_type) == GET_MODE_PRECISION (TYPE_MODE (shift_type)))) { prec = TYPE_PRECISION (TREE_TYPE (captures[2]));
 tree arg00 = captures[3];
 if (captures[2] != captures[3] && TYPE_UNSIGNED (TREE_TYPE (captures[3]))) { tree inner_type = TREE_TYPE (captures[3]);
 if ((TYPE_PRECISION (inner_type) == GET_MODE_PRECISION (TYPE_MODE (inner_type))) && TYPE_PRECISION (inner_type) < prec) { prec = TYPE_PRECISION (inner_type);
 if (shiftc < prec) shift_type = inner_type;
 } } zerobits = ~(unsigned HOST_WIDE_INT) 0;
 if (shiftc < prec) { zerobits >>= HOST_BITS_PER_WIDE_INT - shiftc;
 zerobits <<= prec - shiftc;
 } if (!TYPE_UNSIGNED (TREE_TYPE (captures[2])) && prec == TYPE_PRECISION (TREE_TYPE (captures[2]))) { if ((mask & zerobits) == 0) shift_type = unsigned_type_for (TREE_TYPE (captures[2]));
 else zerobits = 0;
 } }/* #line 1379 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((mask & zerobits) == mask)
	    {
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[4])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1380, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  build_int_cst (type, 0);
	      return res;
	    }
	  else
	    {
	      {
/* #line 1381 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 newmask = mask | zerobits;
/* #line 1382 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (newmask != mask && (newmask & (newmask + 1)) == 0)
		    {
		      {
/* #line 1383 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 for (prec = BITS_PER_UNIT;
 prec < HOST_BITS_PER_WIDE_INT;
 prec <<= 1) if (newmask == (((unsigned HOST_WIDE_INT) 1) << prec) - 1) break;
/* #line 1392 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (prec < HOST_BITS_PER_WIDE_INT || newmask == ~(unsigned HOST_WIDE_INT) 0)
			    {
			      {
/* #line 1394 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree newmaskt = build_int_cst_type (TREE_TYPE (captures[5]), newmask);
/* #line 1396 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (!tree_int_cst_equal (newmaskt, captures[5]))
				    {
/* #line 1397 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (shift_type != TREE_TYPE (captures[2]))
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1398, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    {
					      tree ops2[2], res;
					      {
						tree ops3[1], res;
						ops3[0] = captures[2];
						if (TREE_TYPE (ops3[0]) != shift_type)
						  res = fold_build1_loc (loc, NOP_EXPR, shift_type, ops3[0]);
						else
						  res = ops3[0];
						ops2[0] = res;
					      }
					      ops2[1] = captures[4];
					      res = fold_build2_loc (loc, shift, shift_type, ops2[0], ops2[1]);
					      ops1[0] = res;
					    }
					    if (TREE_TYPE (ops1[0]) != type)
					      res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1399, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				    }
			      }
			    }
		      }
		    }
	      }
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_63 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 839 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:840, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[0];
	ops1[1] =  build_each_one_cst (TREE_TYPE (captures[0]));
	res = fold_build2_loc (loc, MINUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_64 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 855 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:856, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[0];
	{
	  tree ops2[1], res;
	  ops2[0] = captures[1];
	  res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
	  ops1[1] = res;
	}
	res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_65 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (SIN), combined_fn ARG_UNUSED (COS), combined_fn ARG_UNUSED (TAN))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2672, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res;
      res = maybe_build_call_expr_loc (loc, TAN, type, 1, res_op0);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_66 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 193 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (FLOAT_TYPE_P (type) && ! HONOR_NANS (type) && ! HONOR_INFINITIES (type))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:196, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  build_minus_one_cst (type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_67 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (SQRT))
{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations)
    {
/* #line 2469 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!HONOR_SNANS (type))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2470, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[1];
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_68 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (div))
{
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (integer_pow2p (captures[2]) && tree_int_cst_sgn (captures[2]) > 0 && wi::add (captures[2], captures[1]) == 0 && tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:229, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res_op1;
      res_op1 =  build_int_cst (integer_type_node, wi::exact_log2 (captures[2]));
      tree res;
      res = fold_build2_loc (loc, RSHIFT_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_69 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 1864 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (cmp != NE_EXPR || ! FLOAT_TYPE_P (TREE_TYPE (captures[0])) || ! HONOR_NANS (captures[0]))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1867, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (false, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_70 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2642, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_71 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (copysigns))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:419, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[2];
  tree res;
  res = maybe_build_call_expr_loc (loc, copysigns, type, 2, res_op0, res_op1);
  if (!res)
    return NULL_TREE;
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_72 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:273, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_73 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
  {
/* #line 1302 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 int cand = wi::ctz (captures[2]) - wi::ctz (captures[0]);
/* #line 1303 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (cand < 0 || (!integer_zerop (captures[2]) && wi::ne_p (wi::lshift (captures[0], cand), captures[2])))
	{
	  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1306, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res =  constant_boolean_node (cmp == NE_EXPR, type);
	  if (TREE_SIDE_EFFECTS (captures[1]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	  return res;
	}
      else
	{
/* #line 1307 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (!integer_zerop (captures[2]) && wi::eq_p (wi::lshift (captures[0], cand), captures[2]))
	    {
	      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1309, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      res_op1 =  build_int_cst (TREE_TYPE (captures[1]), cand);
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_74 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (copysigns))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:425, %s:%d\n", __FILE__, __LINE__);
  if (! tree_invariant_p (captures[1])) return NULL_TREE;
  tree res_op0;
  res_op0 = unshare_expr (captures[1]);
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
  if (TREE_SIDE_EFFECTS (captures[2]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_75 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shift))
{
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])) && TYPE_PRECISION (type) <= HOST_BITS_PER_WIDE_INT && tree_fits_uhwi_p (captures[4]) && tree_to_uhwi (captures[4]) > 0 && tree_to_uhwi (captures[4]) < TYPE_PRECISION (type))
    {
      {
/* #line 1323 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int shiftc = tree_to_uhwi (captures[4]);
 unsigned HOST_WIDE_INT mask = TREE_INT_CST_LOW (captures[5]);
 unsigned HOST_WIDE_INT newmask, zerobits = 0;
 tree shift_type = TREE_TYPE (captures[2]);
 unsigned int prec;
 if (shift == LSHIFT_EXPR) zerobits = ((((unsigned HOST_WIDE_INT) 1) << shiftc) - 1);
 else if (shift == RSHIFT_EXPR && (TYPE_PRECISION (shift_type) == GET_MODE_PRECISION (TYPE_MODE (shift_type)))) { prec = TYPE_PRECISION (TREE_TYPE (captures[2]));
 tree arg00 = captures[3];
 if (captures[2] != captures[3] && TYPE_UNSIGNED (TREE_TYPE (captures[3]))) { tree inner_type = TREE_TYPE (captures[3]);
 if ((TYPE_PRECISION (inner_type) == GET_MODE_PRECISION (TYPE_MODE (inner_type))) && TYPE_PRECISION (inner_type) < prec) { prec = TYPE_PRECISION (inner_type);
 if (shiftc < prec) shift_type = inner_type;
 } } zerobits = ~(unsigned HOST_WIDE_INT) 0;
 if (shiftc < prec) { zerobits >>= HOST_BITS_PER_WIDE_INT - shiftc;
 zerobits <<= prec - shiftc;
 } if (!TYPE_UNSIGNED (TREE_TYPE (captures[2])) && prec == TYPE_PRECISION (TREE_TYPE (captures[2]))) { if ((mask & zerobits) == 0) shift_type = unsigned_type_for (TREE_TYPE (captures[2]));
 else zerobits = 0;
 } }/* #line 1379 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((mask & zerobits) == mask)
	    {
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[4])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1380, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  build_int_cst (type, 0);
	      return res;
	    }
	  else
	    {
	      {
/* #line 1381 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 newmask = mask | zerobits;
/* #line 1382 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (newmask != mask && (newmask & (newmask + 1)) == 0)
		    {
		      {
/* #line 1383 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 for (prec = BITS_PER_UNIT;
 prec < HOST_BITS_PER_WIDE_INT;
 prec <<= 1) if (newmask == (((unsigned HOST_WIDE_INT) 1) << prec) - 1) break;
/* #line 1392 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (prec < HOST_BITS_PER_WIDE_INT || newmask == ~(unsigned HOST_WIDE_INT) 0)
			    {
			      {
/* #line 1394 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree newmaskt = build_int_cst_type (TREE_TYPE (captures[5]), newmask);
/* #line 1396 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (!tree_int_cst_equal (newmaskt, captures[5]))
				    {
/* #line 1397 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (shift_type != TREE_TYPE (captures[2]))
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1398, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    {
					      tree ops2[2], res;
					      {
						tree ops3[1], res;
						ops3[0] = captures[2];
						if (TREE_TYPE (ops3[0]) != shift_type)
						  res = fold_build1_loc (loc, NOP_EXPR, shift_type, ops3[0]);
						else
						  res = ops3[0];
						ops2[0] = res;
					      }
					      ops2[1] = captures[4];
					      res = fold_build2_loc (loc, shift, shift_type, ops2[0], ops2[1]);
					      ops1[0] = res;
					    }
					    if (TREE_TYPE (ops1[0]) != type)
					      res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[5])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1399, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  newmaskt;
					  tree res;
					  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
					  return res;
					}
				    }
			      }
			    }
		      }
		    }
	      }
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_76 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (operand_equal_p (captures[1], captures[0], 0) && (INTEGRAL_TYPE_P (type) || VECTOR_INTEGER_TYPE_P (type)))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:315, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[1];
	ops1[1] = captures[2];
	res = fold_build2_loc (loc, TRUNC_MOD_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_77 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, enum tree_code ARG_UNUSED (bitop), combined_fn ARG_UNUSED (bswap))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1675, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  {
    tree ops1[1], res;
    ops1[0] = captures[1];
    {
      res = maybe_build_call_expr_loc (loc, bswap, TREE_TYPE (ops1[0]), 1, ops1[0]);
      if (!res)
        return NULL_TREE;
    }
    res_op1 = res;
  }
  tree res;
  res = fold_build2_loc (loc, bitop, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_78 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1017 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])) && !TYPE_OVERFLOW_SANITIZED (type))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1019, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_79 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1043, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[1];
	  tree res;
	  res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
	  if (TREE_SIDE_EFFECTS (captures[0]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_80 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2109, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[1];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_81 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:824, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res =  constant_boolean_node (true, type);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_82 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (minmax))
{
/* #line 1199 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (real_isnan (TREE_REAL_CST_PTR (captures[1])) && (!HONOR_SNANS (captures[1]) || !TREE_REAL_CST (captures[1]).signalling))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1201, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res = captures[0];
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_83 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (div))
{
/* #line 154 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_UNSIGNED (type))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:155, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_84 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1004 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (tree_nop_conversion_p (type, TREE_TYPE (captures[1])) && !TYPE_OVERFLOW_SANITIZED (type))
	{
	  {
/* #line 1006 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree t1 = type;
 if (INTEGRAL_TYPE_P (type) && TYPE_OVERFLOW_WRAPS (type) != TYPE_OVERFLOW_WRAPS (TREE_TYPE (captures[1]))) t1 = TYPE_OVERFLOW_WRAPS (type) ? type : TREE_TYPE (captures[1]);
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1013, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[2], res;
		{
		  tree ops2[1], res;
		  ops2[0] = captures[0];
		  if (TREE_TYPE (ops2[0]) != t1)
		    res = fold_build1_loc (loc, NOP_EXPR, t1, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[0] = res;
		}
		{
		  tree ops2[1], res;
		  ops2[0] = captures[1];
		  if (TREE_TYPE (ops2[0]) != t1)
		    res = fold_build1_loc (loc, NOP_EXPR, t1, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[1] = res;
		}
		res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	  }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_85 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:474, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  {
    tree ops1[2], res;
    ops1[0] = captures[1];
    ops1[1] = unshare_expr (captures[2]);
    res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
    res_op0 = res;
  }
  tree res_op1;
  res_op1 = captures[2];
  tree res;
  res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_86 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (div))
{
  {
/* #line 170 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 bool overflow_p;
 wide_int mul = wi::mul (captures[1], captures[2], TYPE_SIGN (type), &overflow_p);
/* #line 174 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!overflow_p)
	{
	  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:175, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  res_op1 =  wide_int_to_tree (type, mul);
	  tree res;
	  res = fold_build2_loc (loc, div, type, res_op0, res_op1);
	  return res;
	}
      else
	{
/* #line 176 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TYPE_UNSIGNED (type) || mul != wi::min_value (TYPE_PRECISION (type), SIGNED))
	    {
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:178, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  build_zero_cst (type);
	      if (TREE_SIDE_EFFECTS (captures[0]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	      return res;
	    }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_87 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (FMIN))
{
/* #line 1207 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_finite_math_only)
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1210, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 = captures[1];
      tree res;
      res = fold_build2_loc (loc, MIN_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_88 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (FMAX))
{
/* #line 1207 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_finite_math_only)
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1213, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 = captures[1];
      tree res;
      res = fold_build2_loc (loc, MAX_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_89 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop), enum tree_code ARG_UNUSED (rbitop))
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:563, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[1];
  tree res_op1;
  res_op1 = captures[2];
  tree res;
  res = fold_build2_loc (loc, bitop, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_90 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (SIN), combined_fn ARG_UNUSED (TAN), combined_fn ARG_UNUSED (COS))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
/* #line 2682 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (! HONOR_NANS (captures[1]) && ! HONOR_INFINITIES (captures[1]))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2684, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[1];
	  tree res;
	  res = maybe_build_call_expr_loc (loc, COS, type, 1, res_op0);
	  if (!res)
	    return NULL_TREE;
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_91 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:483, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = unshare_expr (captures[2]);
  tree res_op1;
  {
    tree ops1[2], res;
    ops1[0] = captures[1];
    ops1[1] = captures[2];
    res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
    res_op1 = res;
  }
  tree res;
  res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_92 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	{
/* #line 1072 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (!TYPE_OVERFLOW_TRAPS (type))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1073, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  build_all_ones_cst (type);
	      if (TREE_SIDE_EFFECTS (captures[0]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	      return res;
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_93 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shiftrotate))
{
  {
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = uniform_vector_p (captures[1]);
/* #line 1256 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (tem)
	{
	  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1257, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  res_op1 =  tem;
	  tree res;
	  res = fold_build2_loc (loc, shiftrotate, type, res_op0, res_op1);
	  return res;
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_94 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:488, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_95 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (COPYSIGN))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2627, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_96 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  {
/* #line 1271 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int prec = element_precision (type);
/* #line 1272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (wi::ge_p (captures[1], 0, TYPE_SIGN (TREE_TYPE (captures[1]))) && wi::lt_p (captures[1], prec, TYPE_SIGN (TREE_TYPE (captures[1]))) && wi::ge_p (captures[2], 0, TYPE_SIGN (TREE_TYPE (captures[2]))) && wi::lt_p (captures[2], prec, TYPE_SIGN (TREE_TYPE (captures[2]))))
	{
	  {
/* #line 1276 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int low = wi::add (captures[1], captures[2]).to_uhwi ();
/* #line 1279 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (low >= prec)
		{
/* #line 1280 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (op == LROTATE_EXPR || op == RROTATE_EXPR)
		    {
		      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1281, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[0];
		      tree res_op1;
		      res_op1 =  build_int_cst (TREE_TYPE (captures[1]), low % prec);
		      tree res;
		      res = fold_build2_loc (loc, op, type, res_op0, res_op1);
		      return res;
		    }
		  else
		    {
/* #line 1282 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (TYPE_UNSIGNED (type) || op == LSHIFT_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1283, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  build_zero_cst (type);
			  if (TREE_SIDE_EFFECTS (captures[0]))
			    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
			  return res;
			}
		      else
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1284, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  build_int_cst (TREE_TYPE (captures[1]), prec - 1);
			  tree res;
			  res = fold_build2_loc (loc, op, type, res_op0, res_op1);
			  return res;
			}
		    }
		}
	      else
		{
		  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1285, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  res_op1 =  build_int_cst (TREE_TYPE (captures[1]), low);
		  tree res;
		  res = fold_build2_loc (loc, op, type, res_op0, res_op1);
		  return res;
		}
	  }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_97 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (TAN), combined_fn ARG_UNUSED (COS), combined_fn ARG_UNUSED (SIN))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2661, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res;
      res = maybe_build_call_expr_loc (loc, SIN, type, 1, res_op0);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_98 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_SATURATING (type))
    {
/* #line 991 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (tree_nop_conversion_p (type, TREE_TYPE (captures[1])) && !TYPE_OVERFLOW_SANITIZED (type))
	{
	  {
/* #line 993 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree t1 = type;
 if (INTEGRAL_TYPE_P (type) && TYPE_OVERFLOW_WRAPS (type) != TYPE_OVERFLOW_WRAPS (TREE_TYPE (captures[1]))) t1 = TYPE_OVERFLOW_WRAPS (type) ? type : TREE_TYPE (captures[1]);
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1000, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[2], res;
		{
		  tree ops2[1], res;
		  ops2[0] = captures[0];
		  if (TREE_TYPE (ops2[0]) != t1)
		    res = fold_build1_loc (loc, NOP_EXPR, t1, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[0] = res;
		}
		{
		  tree ops2[1], res;
		  ops2[0] = captures[1];
		  if (TREE_TYPE (ops2[0]) != t1)
		    res = fold_build1_loc (loc, NOP_EXPR, t1, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[1] = res;
		}
		res = fold_build2_loc (loc, MINUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	  }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_99 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shiftrotate))
{
  {
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = uniform_vector_p (captures[1]);
/* #line 1256 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (tem)
	{
	  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1257, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  res_op1 =  tem;
	  tree res;
	  res = fold_build2_loc (loc, shiftrotate, type, res_op0, res_op1);
	  return res;
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_100 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 498 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (TYPE_UNSIGNED (TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:499, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (cmp == LT_EXPR, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_101 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:586, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, PLUS_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_102 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (COS), combined_fn ARG_UNUSED (SIN), combined_fn ARG_UNUSED (TAN))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2677, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 =  build_one_cst (type);
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[1];
	{
	  res = maybe_build_call_expr_loc (loc, TAN, TREE_TYPE (ops1[0]), 1, ops1[0]);
	  if (!res)
	    return NULL_TREE;
	}
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, RDIV_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_103 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bit_op), enum tree_code ARG_UNUSED (shift))
{
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[2])))
    {
      {
/* #line 1408 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree mask = int_const_binop (shift, fold_convert (type, captures[3]), captures[4]);
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1409, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      if (TREE_TYPE (ops2[0]) != type)
		res = fold_build1_loc (loc, NOP_EXPR, type, ops2[0]);
	      else
	        res = ops2[0];
	      ops1[0] = res;
	    }
	    ops1[1] = captures[4];
	    res = fold_build2_loc (loc, shift, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res_op1;
	  res_op1 =  mask;
	  tree res;
	  res = fold_build2_loc (loc, bit_op, type, res_op0, res_op1);
	  return res;
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_104 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:522, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 =  build_all_ones_cst (TREE_TYPE (captures[0]));
  tree res;
  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_105 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 870 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[3])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:872, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	{
	  tree ops2[1], res;
	  ops2[0] = captures[3];
	  res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
	  ops1[0] = res;
	}
	ops1[1] = captures[0];
	res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_106 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (froms), combined_fn ARG_UNUSED (tos))
{
/* #line 2830 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (optimize && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2833, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = maybe_build_call_expr_loc (loc, tos, type, 1, res_op0);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_107 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (test1), enum tree_code ARG_UNUSED (test2))
{
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) || VECTOR_INTEGER_TYPE_P (TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2119, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (true, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_108 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (acmp))
{
/* #line 1782 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_int_cst_sgn (captures[1]) == 1)
    {
      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1783, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 =  wide_int_to_tree (TREE_TYPE (captures[1]), wi::sub (captures[1], 1));
      tree res;
      res = fold_build2_loc (loc, acmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_109 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2151, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, op, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_110 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:543, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = non_lvalue_loc (loc, res_op0);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_111 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && !(targetm.have_canonicalize_funcptr_for_compare () && TREE_CODE (TREE_TYPE (captures[1])) == POINTER_TYPE && TREE_CODE (TREE_TYPE (TREE_TYPE (captures[1]))) == FUNCTION_TYPE) && single_use (captures[0]))
    {
/* #line 2164 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (TYPE_PRECISION (TREE_TYPE (captures[1])) == TYPE_PRECISION (TREE_TYPE (captures[0])) && (TREE_CODE (captures[3]) == INTEGER_CST || (captures[2] != captures[3] && types_match (TREE_TYPE (captures[3]), TREE_TYPE (captures[1])))) && (TYPE_UNSIGNED (TREE_TYPE (captures[1])) == TYPE_UNSIGNED (TREE_TYPE (captures[0])) || cmp == NE_EXPR || cmp == EQ_EXPR) && (POINTER_TYPE_P (TREE_TYPE (captures[1])) == POINTER_TYPE_P (TREE_TYPE (captures[0]))))
	{
/* #line 2174 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TREE_CODE (captures[2]) == INTEGER_CST)
	    {
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2175, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      res_op1 =  force_fit_type (TREE_TYPE (captures[1]), wi::to_widest (captures[2]), 0, TREE_OVERFLOW (captures[2]));
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      if (TREE_SIDE_EFFECTS (captures[3]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[3]), res);
	      return res;
	    }
	  else
	    {
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2177, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		if (TREE_TYPE (ops1[0]) != TREE_TYPE (res_op0))
		  res = fold_build1_loc (loc, NOP_EXPR, TREE_TYPE (res_op0), ops1[0]);
		else
		  res = ops1[0];
		res_op1 = res;
	      }
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
	}
      else
	{
/* #line 2179 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TYPE_PRECISION (TREE_TYPE (captures[0])) > TYPE_PRECISION (TREE_TYPE (captures[1])))
	    {
/* #line 2181 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if ((cmp == EQ_EXPR || cmp == NE_EXPR || TYPE_UNSIGNED (TREE_TYPE (captures[0])) == TYPE_UNSIGNED (TREE_TYPE (captures[1]))) && (types_match (TREE_TYPE (captures[3]), TREE_TYPE (captures[1])) || ((TYPE_PRECISION (TREE_TYPE (captures[1])) >= TYPE_PRECISION (TREE_TYPE (captures[3]))) && (TYPE_UNSIGNED (TREE_TYPE (captures[1])) == TYPE_UNSIGNED (TREE_TYPE (captures[3])))) || (TREE_CODE (captures[3]) == INTEGER_CST && INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && int_fits_type_p (captures[3], TREE_TYPE (captures[1])))))
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2191, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    ops1[0] = captures[3];
		    if (TREE_TYPE (ops1[0]) != TREE_TYPE (res_op0))
		      res = fold_build1_loc (loc, NOP_EXPR, TREE_TYPE (res_op0), ops1[0]);
		    else
		      res = ops1[0];
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
		  return res;
		}
	      else
		{
/* #line 2192 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (TREE_CODE (captures[3]) == INTEGER_CST && INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && !int_fits_type_p (captures[3], TREE_TYPE (captures[1])))
		    {
		      {
/* #line 2195 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree min = lower_bound_in_type (TREE_TYPE (captures[3]), TREE_TYPE (captures[1]));
 tree max = upper_bound_in_type (TREE_TYPE (captures[3]), TREE_TYPE (captures[1]));
 bool above = integer_nonzerop (const_binop (LT_EXPR, type, max, captures[3]));
 bool below = integer_nonzerop (const_binop (LT_EXPR, type, captures[3], min));
/* #line 2202 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (above || below)
			    {
/* #line 2203 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == EQ_EXPR || cmp == NE_EXPR)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2204, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  constant_boolean_node (cmp == EQ_EXPR ? false : true, type);
				  if (TREE_SIDE_EFFECTS (captures[1]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
				  if (TREE_SIDE_EFFECTS (captures[3]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[3]), res);
				  return res;
				}
			      else
				{
/* #line 2205 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (cmp == LT_EXPR || cmp == LE_EXPR)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2206, %s:%d\n", __FILE__, __LINE__);
				      tree res;
				      res =  constant_boolean_node (above ? true : false, type);
				      if (TREE_SIDE_EFFECTS (captures[1]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
				      if (TREE_SIDE_EFFECTS (captures[3]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[3]), res);
				      return res;
				    }
				  else
				    {
/* #line 2207 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (cmp == GT_EXPR || cmp == GE_EXPR)
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2208, %s:%d\n", __FILE__, __LINE__);
					  tree res;
					  res =  constant_boolean_node (above ? false : true, type);
					  if (TREE_SIDE_EFFECTS (captures[1]))
					    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
					  if (TREE_SIDE_EFFECTS (captures[3]))
					    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[3]), res);
					  return res;
					}
				    }
				}
			    }
		      }
		    }
		}
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_112 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:548, %s:%d\n", __FILE__, __LINE__);
  if (! tree_invariant_p (captures[2])) return NULL_TREE;
  tree res_op0;
  {
    tree ops1[2], res;
    ops1[0] = captures[0];
    ops1[1] = unshare_expr (captures[2]);
    res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
    res_op0 = res;
  }
  tree res_op1;
  {
    tree ops1[1], res;
    ops1[0] = captures[2];
    res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
    res_op1 = res;
  }
  tree res;
  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_113 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 1829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (single_use (captures[0]))
    {
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1830, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res_op1;
      res_op1 = captures[2];
      tree res;
      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_114 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:555, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  {
    tree ops1[1], res;
    ops1[0] = captures[2];
    res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
    res_op1 = res;
  }
  tree res;
  res = fold_build2_loc (loc, bitop, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_115 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (POW))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2712, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      {
	tree ops1[2], res;
	ops1[0] = captures[2];
	{
	  tree ops2[1], res;
	  ops2[0] = captures[3];
	  res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
	  ops1[1] = res;
	}
	{
	  res = maybe_build_call_expr_loc (loc, POW, TREE_TYPE (ops1[0]), 2, ops1[0], ops1[1]);
	  if (!res)
	    return NULL_TREE;
	}
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_116 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop), enum tree_code ARG_UNUSED (rbitop))
{
  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:563, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[1];
  tree res_op1;
  res_op1 = captures[2];
  tree res;
  res = fold_build2_loc (loc, bitop, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_117 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:568, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_118 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:573, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_119 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (fns))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2612, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_120 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:581, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_IOR_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_121 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2638, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_122 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
/* #line 259 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!integer_zerop (captures[1]))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:260, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res = captures[0];
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_123 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (bswap))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1671, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = fold_build1_loc (loc, BIT_NOT_EXPR, type, res_op0);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_124 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (scmp))
{
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (FLOAT_TYPE_P (TREE_TYPE (captures[0])) || (ANY_INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))))
    {
      {
/* #line 2143 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_unop (NEGATE_EXPR, TREE_TYPE (captures[0]), captures[1]);
/* #line 2144 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (tem && !TREE_OVERFLOW (tem))
	    {
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2145, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 =  tem;
	      tree res;
	      res = fold_build2_loc (loc, scmp, type, res_op0, res_op1);
	      return res;
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_125 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 1655 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (TREE_TYPE (captures[0]), type))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1656, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_126 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (fns))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2607, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = maybe_build_call_expr_loc (loc, fns, type, 1, res_op0);
  if (!res)
    return NULL_TREE;
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_127 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (scmp))
{
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (single_use (captures[0]) && (TREE_CODE (captures[2]) == INTEGER_CST || TREE_CODE (captures[2]) == VECTOR_CST))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1891, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res_op1;
      {
	tree ops1[1], res;
	ops1[0] = captures[2];
	res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, scmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_128 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if ((INTEGRAL_TYPE_P (TREE_TYPE (captures[2])) || POINTER_TYPE_P (TREE_TYPE (captures[2]))) && tree_nop_conversion_p (TREE_TYPE (captures[0]), TREE_TYPE (captures[1])))
    {
      {
/* #line 2359 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree arg1_type = TREE_TYPE (captures[2]);
 unsigned int prec = TYPE_PRECISION (arg1_type);
 wide_int max = wi::max_value (arg1_type);
 wide_int signed_max = wi::max_value (prec, SIGNED);
 wide_int min = wi::min_value (arg1_type);
/* #line 2368 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (wi::eq_p (captures[2], max))
	    {
/* #line 2370 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cmp == GT_EXPR)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2371, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res =  constant_boolean_node (false, type);
		  if (TREE_SIDE_EFFECTS (captures[1]))
		    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
		  return res;
		}
	      else
		{
/* #line 2372 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == GE_EXPR)
		    {
		      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
		      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2373, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[0];
		      tree res_op1;
		      res_op1 = captures[2];
		      tree res;
		      res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
		      return res;
		    }
		  else
		    {
/* #line 2374 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == LE_EXPR)
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2375, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  constant_boolean_node (true, type);
			  if (TREE_SIDE_EFFECTS (captures[1]))
			    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
			  return res;
			}
		      else
			{
/* #line 2376 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == LT_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2377, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 = captures[2];
			      tree res;
			      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			}
		    }
		}
	    }
	  else
	    {
/* #line 2378 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (wi::eq_p (captures[2], min))
		{
/* #line 2380 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == LT_EXPR)
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2381, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res =  constant_boolean_node (false, type);
		      if (TREE_SIDE_EFFECTS (captures[1]))
			res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
		      return res;
		    }
		  else
		    {
/* #line 2382 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == LE_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2383, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 = captures[2];
			  tree res;
			  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			  return res;
			}
		      else
			{
/* #line 2384 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == GE_EXPR)
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2385, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (true, type);
			      if (TREE_SIDE_EFFECTS (captures[1]))
				res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
			      return res;
			    }
			  else
			    {
/* #line 2386 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == GT_EXPR)
				{
				  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
				  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2387, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 = captures[0];
				  tree res_op1;
				  res_op1 = captures[2];
				  tree res;
				  res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
				  return res;
				}
			    }
			}
		    }
		}
	      else
		{
/* #line 2388 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (wi::eq_p (captures[2], max - 1))
		    {
/* #line 2390 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == GT_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2391, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::add (captures[2], 1));
			  tree res;
			  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			  return res;
			}
		      else
			{
/* #line 2392 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == LE_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2393, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::add (captures[2], 1));
			      tree res;
			      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			}
		    }
		  else
		    {
/* #line 2394 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (wi::eq_p (captures[2], min + 1))
			{
/* #line 2396 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == GE_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2397, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::sub (captures[2], 1));
			      tree res;
			      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			  else
			    {
/* #line 2398 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == LT_EXPR)
				{
				  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
				  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2399, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 = captures[0];
				  tree res_op1;
				  res_op1 =  wide_int_to_tree (TREE_TYPE (captures[2]), wi::sub (captures[2], 1));
				  tree res;
				  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
				  return res;
				}
			    }
			}
		      else
			{
/* #line 2400 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (wi::eq_p (captures[2], signed_max) && TYPE_UNSIGNED (arg1_type) && prec == GET_MODE_PRECISION (TYPE_MODE (arg1_type)) && INTEGRAL_TYPE_P (arg1_type))
			    {
/* #line 2411 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == LE_EXPR || cmp == GT_EXPR)
				{
				  {
/* #line 2412 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree st = signed_type_for (arg1_type);
/* #line 2413 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (cmp == LE_EXPR)
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2414, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    ops1[0] = captures[1];
					    if (TREE_TYPE (ops1[0]) != st)
					      res = fold_build1_loc (loc, NOP_EXPR, st, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  build_zero_cst (st);
					  tree res;
					  res = fold_build2_loc (loc, GE_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2415, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  {
					    tree ops1[1], res;
					    ops1[0] = captures[1];
					    if (TREE_TYPE (ops1[0]) != st)
					      res = fold_build1_loc (loc, NOP_EXPR, st, ops1[0]);
					    else
					      res = ops1[0];
					    res_op0 = res;
					  }
					  tree res_op1;
					  res_op1 =  build_zero_cst (st);
					  tree res;
					  res = fold_build2_loc (loc, LT_EXPR, type, res_op0, res_op1);
					  return res;
					}
				  }
				}
			    }
			}
		    }
		}
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_129 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (POW))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2696, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[1];
      tree res_op1;
      {
	tree ops1[2], res;
	ops1[0] = captures[2];
	ops1[1] = captures[4];
	res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op1 = res;
      }
      tree res;
      res = maybe_build_call_expr_loc (loc, POW, type, 2, res_op0, res_op1);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_130 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (COPYSIGN))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2632, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = fold_build1_loc (loc, ABS_EXPR, type, res_op0);
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_131 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:615, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_132 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bit_op), enum tree_code ARG_UNUSED (shift))
{
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[2])))
    {
      {
/* #line 1408 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree mask = int_const_binop (shift, fold_convert (type, captures[3]), captures[4]);
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1409, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      if (TREE_TYPE (ops2[0]) != type)
		res = fold_build1_loc (loc, NOP_EXPR, type, ops2[0]);
	      else
	        res = ops2[0];
	      ops1[0] = res;
	    }
	    ops1[1] = captures[4];
	    res = fold_build2_loc (loc, shift, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res_op1;
	  res_op1 =  mask;
	  tree res;
	  res = fold_build2_loc (loc, bit_op, type, res_op0, res_op1);
	  return res;
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_133 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 1751 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (VECTOR_TYPE_P (type) && TYPE_VECTOR_SUBPARTS (type) == TYPE_VECTOR_SUBPARTS (TREE_TYPE (captures[3])) && (TYPE_MODE (TREE_TYPE (type)) == TYPE_MODE (TREE_TYPE (TREE_TYPE (captures[3])))))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1755, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      {
	tree ops1[1], res;
	{
	  tree ops2[3], res;
	  ops2[0] = captures[2];
	  {
	    tree ops3[1], res;
	    ops3[0] = captures[3];
	    res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops3[0]), ops3[0]);
	    ops2[1] = res;
	  }
	  ops2[2] = captures[4];
	  res = fold_build3_loc (loc, VEC_COND_EXPR, TREE_TYPE (ops2[1]), ops2[0], ops2[1], ops2[2]);
	  ops1[0] = res;
	}
	res = fold_build1_loc (loc, VIEW_CONVERT_EXPR, type, ops1[0]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_134 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 849 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:850, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_135 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:620, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_136 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (bitop), enum tree_code ARG_UNUSED (rbitop))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:770, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_137 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (scmp))
{
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (FLOAT_TYPE_P (TREE_TYPE (captures[0])) || (ANY_INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2137, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 = captures[1];
      tree res;
      res = fold_build2_loc (loc, scmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_138 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 443 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (! FLOAT_TYPE_P (type) && tree_nop_conversion_p (type, TREE_TYPE (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:445, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 = captures[2];
      tree res;
      res = fold_build2_loc (loc, LSHIFT_EXPR, type, res_op0, res_op1);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_139 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (froms), combined_fn ARG_UNUSED (tos))
{
/* #line 2840 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (optimize && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2843, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = maybe_build_call_expr_loc (loc, tos, type, 1, res_op0);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_140 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1177, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[1];
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_141 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1871, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res =  constant_boolean_node (true, type);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_142 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (shiftrotate))
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1246, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res;
  res = non_lvalue_loc (loc, res_op0);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_143 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (REAL_VALUE_MINUS_ZERO (TREE_REAL_CST (captures[1])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1928, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 =  build_real (TREE_TYPE (captures[1]), dconst0);
      tree res;
      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
      return res;
    }
  else
    {
/* #line 1930 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (REAL_VALUE_ISNAN (TREE_REAL_CST (captures[1])) && ! HONOR_SNANS (captures[1]))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1932, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res =  constant_boolean_node (cmp == NE_EXPR, type);
	  if (TREE_SIDE_EFFECTS (captures[0]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	  return res;
	}
      else
	{
/* #line 1934 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (REAL_VALUE_ISINF (TREE_REAL_CST (captures[1])) && MODE_HAS_INFINITIES (TYPE_MODE (TREE_TYPE (captures[1]))))
	    {
	      {
/* #line 1936 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 REAL_VALUE_TYPE max;
 enum tree_code code = cmp;
 bool neg = REAL_VALUE_NEGATIVE (TREE_REAL_CST (captures[1]));
 if (neg) code = swap_tree_comparison (code);
/* #line 1946 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (code == GT_EXPR && ! HONOR_SNANS (captures[0]))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1948, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res =  constant_boolean_node (false, type);
		      if (TREE_SIDE_EFFECTS (captures[0]))
			res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		      return res;
		    }
		  else
		    {
/* #line 1949 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (code == LE_EXPR)
			{
/* #line 1951 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! HONOR_NANS (captures[0]))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1952, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (true, type);
			      if (TREE_SIDE_EFFECTS (captures[0]))
				res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
			      return res;
			    }
			  else
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1954, %s:%d\n", __FILE__, __LINE__);
			      if (! tree_invariant_p (captures[0])) return NULL_TREE;
			      tree res_op0;
			      res_op0 = unshare_expr (captures[0]);
			      tree res_op1;
			      res_op1 = captures[0];
			      tree res;
			      res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			}
		      else
			{
/* #line 1956 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (code == EQ_EXPR || code == GE_EXPR)
			    {
			      {
/* #line 1957 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 real_maxval (&max, neg, TYPE_MODE (TREE_TYPE (captures[0])));
/* #line 1958 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (neg)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1959, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[0];
				      tree res_op1;
				      res_op1 =  build_real (TREE_TYPE (captures[0]), max);
				      tree res;
				      res = fold_build2_loc (loc, LT_EXPR, type, res_op0, res_op1);
				      return res;
				    }
				  else
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1960, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[0];
				      tree res_op1;
				      res_op1 =  build_real (TREE_TYPE (captures[0]), max);
				      tree res;
				      res = fold_build2_loc (loc, GT_EXPR, type, res_op0, res_op1);
				      return res;
				    }
			      }
			    }
			  else
			    {
/* #line 1962 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (code == LT_EXPR)
				{
				  {
/* #line 1963 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 real_maxval (&max, neg, TYPE_MODE (TREE_TYPE (captures[0])));
/* #line 1964 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (neg)
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1965, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  build_real (TREE_TYPE (captures[0]), max);
					  tree res;
					  res = fold_build2_loc (loc, GE_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1966, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  build_real (TREE_TYPE (captures[0]), max);
					  tree res;
					  res = fold_build2_loc (loc, LE_EXPR, type, res_op0, res_op1);
					  return res;
					}
				  }
				}
			      else
				{
/* #line 1968 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (code == NE_EXPR)
				    {
				      {
/* #line 1969 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 real_maxval (&max, neg, TYPE_MODE (TREE_TYPE (captures[0])));
/* #line 1970 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					  if (! HONOR_NANS (captures[0]))
					    {
/* #line 1971 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					      if (neg)
						{
						  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1972, %s:%d\n", __FILE__, __LINE__);
						  tree res_op0;
						  res_op0 = captures[0];
						  tree res_op1;
						  res_op1 =  build_real (TREE_TYPE (captures[0]), max);
						  tree res;
						  res = fold_build2_loc (loc, GE_EXPR, type, res_op0, res_op1);
						  return res;
						}
					      else
						{
						  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1973, %s:%d\n", __FILE__, __LINE__);
						  tree res_op0;
						  res_op0 = captures[0];
						  tree res_op1;
						  res_op1 =  build_real (TREE_TYPE (captures[0]), max);
						  tree res;
						  res = fold_build2_loc (loc, LE_EXPR, type, res_op0, res_op1);
						  return res;
						}
					    }
					  else
					    {
/* #line 1974 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					      if (neg)
						{
						  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1975, %s:%d\n", __FILE__, __LINE__);
						  tree res_op0;
						  {
						    tree ops1[2], res;
						    ops1[0] = captures[0];
						    ops1[1] =  build_real (TREE_TYPE (captures[0]), max);
						    res = fold_build2_loc (loc, LT_EXPR, boolean_type_node, ops1[0], ops1[1]);
						    res_op0 = res;
						  }
						  tree res_op1;
						  res_op1 =  build_one_cst (type);
						  tree res;
						  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
						  return res;
						}
					      else
						{
						  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1977, %s:%d\n", __FILE__, __LINE__);
						  tree res_op0;
						  {
						    tree ops1[2], res;
						    ops1[0] = captures[0];
						    ops1[1] =  build_real (TREE_TYPE (captures[0]), max);
						    res = fold_build2_loc (loc, GT_EXPR, boolean_type_node, ops1[0], ops1[1]);
						    res_op0 = res;
						  }
						  tree res_op1;
						  res_op1 =  build_one_cst (type);
						  tree res;
						  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
						  return res;
						}
					    }
				      }
				    }
				}
			    }
			}
		    }
	      }
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_144 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (tans), combined_fn ARG_UNUSED (atans))
{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations)
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2596, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res = captures[0];
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_145 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
/* #line 268 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (!TYPE_UNSIGNED (type))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:269, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  build_zero_cst (type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_146 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:264, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res =  build_zero_cst (type);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_147 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 1760 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (VECTOR_TYPE_P (type) && TYPE_VECTOR_SUBPARTS (type) == TYPE_VECTOR_SUBPARTS (TREE_TYPE (captures[3])) && (TYPE_MODE (TREE_TYPE (type)) == TYPE_MODE (TREE_TYPE (TREE_TYPE (captures[3])))))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1764, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      {
	tree ops1[1], res;
	{
	  tree ops2[3], res;
	  ops2[0] = captures[2];
	  {
	    tree ops3[1], res;
	    ops3[0] = captures[3];
	    res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops3[0]), ops3[0]);
	    ops2[1] = res;
	  }
	  ops2[2] = captures[4];
	  res = fold_build3_loc (loc, VEC_COND_EXPR, TREE_TYPE (ops2[1]), ops2[0], ops2[1], ops2[2]);
	  ops1[0] = res;
	}
	res = fold_build1_loc (loc, VIEW_CONVERT_EXPR, type, ops1[0]);
	res_op1 = res;
      }
      tree res;
      res = fold_build2_loc (loc, PLUS_EXPR, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_148 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (acmp))
{
/* #line 1776 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_int_cst_sgn (captures[1]) == -1)
    {
      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1777, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res_op1;
      res_op1 =  wide_int_to_tree (TREE_TYPE (captures[1]), wi::add (captures[1], 1));
      tree res;
      res = fold_build2_loc (loc, acmp, type, res_op0, res_op1);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_149 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (POW))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
/* #line 2666 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!TREE_OVERFLOW (captures[2]))
	{
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2667, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  {
	    tree ops1[2], res;
	    ops1[0] = captures[2];
	    ops1[1] =  build_one_cst (type);
	    res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op1 = res;
	  }
	  tree res;
	  res = maybe_build_call_expr_loc (loc, POW, type, 2, res_op0, res_op1);
	  if (!res)
	    return NULL_TREE;
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_150 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (icmp), enum tree_code ARG_UNUSED (ncmp))
{
  {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 enum tree_code ic = invert_tree_comparison (cmp, HONOR_NANS (captures[0]));
/* #line 1816 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (ic == icmp)
	{
	  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1817, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  res_op1 = captures[1];
	  tree res;
	  res = fold_build2_loc (loc, icmp, type, res_op0, res_op1);
	  return res;
	}
      else
	{
/* #line 1818 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (ic == ncmp)
	    {
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1819, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res;
	      res = fold_build2_loc (loc, ncmp, type, res_op0, res_op1);
	      return res;
	    }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_151 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:667, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  {
    tree ops1[1], res;
    ops1[0] = captures[0];
    res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
    res_op0 = res;
  }
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_152 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
, combined_fn ARG_UNUSED (froms), combined_fn ARG_UNUSED (tos))
{
/* #line 2821 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (optimize && canonicalize_math_p () && targetm.libc_has_function (function_c99_misc))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2825, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	{
	  res = maybe_build_call_expr_loc (loc, tos, TREE_TYPE (ops1[0]), 1, ops1[0]);
	  if (!res)
	    return NULL_TREE;
	}
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_153 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:819, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res =  build_zero_cst (type);
  if (TREE_SIDE_EFFECTS (captures[0]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_154 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 1856 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (! FLOAT_TYPE_P (TREE_TYPE (captures[0])) || ! HONOR_NANS (captures[0]))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1858, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (true, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      return res;
    }
  else
    {
/* #line 1859 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (cmp != EQ_EXPR)
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1860, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = unshare_expr (captures[0]);
	  tree res_op1;
	  res_op1 = captures[0];
	  tree res;
	  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_155 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (icmp))
{
  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1294, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 =  build_zero_cst (TREE_TYPE (captures[0]));
  tree res;
  res = fold_build2_loc (loc, icmp, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_156 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree *captures
)
{
/* #line 859 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:860, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[0];
	ops1[1] = captures[1];
	res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_157 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 HOST_WIDE_INT off0, off1;
 tree base0 = get_addr_base_and_unit_offset (TREE_OPERAND (captures[1], 0), &off0);
 tree base1 = get_addr_base_and_unit_offset (TREE_OPERAND (captures[2], 0), &off1);
 if (base0 && TREE_CODE (base0) == MEM_REF) { off0 += mem_ref_offset (base0).to_short_addr ();
 base0 = TREE_OPERAND (base0, 0);
 } if (base1 && TREE_CODE (base1) == MEM_REF) { off1 += mem_ref_offset (base1).to_short_addr ();
 base1 = TREE_OPERAND (base1, 0);
 }/* #line 2303 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (base0 && base1)
	{
	  {
/* #line 2304 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 int equal = 2;
 if (decl_in_symtab_p (base0) && decl_in_symtab_p (base1)) equal = symtab_node::get_create (base0) ->equal_address_to (symtab_node::get_create (base1));
 else if ((DECL_P (base0) || TREE_CODE (base0) == SSA_NAME || TREE_CODE (base0) == STRING_CST) && (DECL_P (base1) || TREE_CODE (base1) == SSA_NAME || TREE_CODE (base1) == STRING_CST)) equal = (base0 == base1);
/* #line 2319 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (equal == 1 && (cmp == EQ_EXPR || cmp == NE_EXPR || off0 == off1 || POINTER_TYPE_OVERFLOW_UNDEFINED || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && (DECL_P (base0) || TREE_CODE (base0) == STRING_CST))))
		{
/* #line 2328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == EQ_EXPR)
		    {
		      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2329, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res =  constant_boolean_node (off0 == off1, type);
		      return res;
		    }
		  else
		    {
/* #line 2330 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == NE_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2331, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  constant_boolean_node (off0 != off1, type);
			  return res;
			}
		      else
			{
/* #line 2332 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == LT_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2333, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (off0 < off1, type);
			      return res;
			    }
			  else
			    {
/* #line 2334 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == LE_EXPR)
				{
				  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
				  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2335, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  constant_boolean_node (off0 <= off1, type);
				  return res;
				}
			      else
				{
/* #line 2336 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (cmp == GE_EXPR)
				    {
				      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
				      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2337, %s:%d\n", __FILE__, __LINE__);
				      tree res;
				      res =  constant_boolean_node (off0 >= off1, type);
				      return res;
				    }
				  else
				    {
/* #line 2338 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (cmp == GT_EXPR)
					{
					  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
					  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2339, %s:%d\n", __FILE__, __LINE__);
					  tree res;
					  res =  constant_boolean_node (off0 > off1, type);
					  return res;
					}
				    }
				}
			    }
			}
		    }
		}
	      else
		{
/* #line 2340 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (equal == 0 && DECL_P (base0) && DECL_P (base1) && (!INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) || off0 == off1))
		    {
/* #line 2346 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == EQ_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2347, %s:%d\n", __FILE__, __LINE__);
			  tree res;
			  res =  constant_boolean_node (false, type);
			  return res;
			}
		      else
			{
/* #line 2348 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (cmp == NE_EXPR)
			    {
			      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2349, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (true, type);
			      return res;
			    }
			}
		    }
		}
	  }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_158 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2109, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[1];
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_159 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (inner_op), enum tree_code ARG_UNUSED (outer_op))
{
  {
/* #line 891 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 bool fail = false;
 wide_int zero_mask_not;
 wide_int C0;
 wide_int cst_emit;
 if (TREE_CODE (captures[1]) == SSA_NAME) zero_mask_not = get_nonzero_bits (captures[1]);
 else fail = true;
 if (inner_op == BIT_XOR_EXPR) { C0 = wi::bit_and_not (captures[2], captures[3]);
 cst_emit = wi::bit_or (C0, captures[3]);
 } else { C0 = captures[2];
 cst_emit = wi::bit_xor (captures[2], captures[3]);
 }/* #line 914 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!fail && wi::bit_and (C0, zero_mask_not) == 0)
	{
	  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	  if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:915, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[1];
	  tree res_op1;
	  res_op1 =  wide_int_to_tree (type, cst_emit);
	  tree res;
	  res = fold_build2_loc (loc, outer_op, type, res_op0, res_op1);
	  return res;
	}
      else
	{
/* #line 916 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (!fail && wi::bit_and (captures[3], zero_mask_not) == 0)
	    {
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:917, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      res_op1 =  wide_int_to_tree (type, cst_emit);
	      tree res;
	      res = fold_build2_loc (loc, inner_op, type, res_op0, res_op1);
	      return res;
	    }
	}
  }
  return NULL_TREE;
}

static tree
generic_simplify_160 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_single_nonzero_warnv_p (captures[0], NULL))
    {
      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2256, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (cmp == NE_EXPR, type);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_161 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2239, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 = captures[1];
  tree res;
  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_162 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (POW))
{
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2622, %s:%d\n", __FILE__, __LINE__);
  tree res;
  res = captures[0];
  if (TREE_SIDE_EFFECTS (captures[1]))
    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_163 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (test1), enum tree_code ARG_UNUSED (test2))
{
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) || VECTOR_INTEGER_TYPE_P (TREE_TYPE (captures[0])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2127, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  constant_boolean_node (false, type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      if (TREE_SIDE_EFFECTS (captures[1]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_164 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (POW))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2701, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	ops1[0] = captures[1];
	ops1[1] = captures[4];
	res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res_op1;
      res_op1 = captures[2];
      tree res;
      res = maybe_build_call_expr_loc (loc, POW, type, 2, res_op0, res_op1);
      if (!res)
        return NULL_TREE;
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_165 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (mod))
{
/* #line 277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (ANY_INTEGRAL_TYPE_P (type) && TYPE_OVERFLOW_UNDEFINED (type) && wi::multiple_of_p (captures[1], captures[2], TYPE_SIGN (type)))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:280, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res =  build_zero_cst (type);
      if (TREE_SIDE_EFFECTS (captures[0]))
	res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_166 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 971 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (POINTER_TYPE_P (TREE_TYPE (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
    {
      {
/* #line 973 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 unsigned int align;
 unsigned HOST_WIDE_INT bitpos;
 get_pointer_alignment_1 (captures[0], &align, &bitpos);
/* #line 979 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (wi::ltu_p (captures[1], align / BITS_PER_UNIT))
	    {
	      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:980, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  wide_int_to_tree (type, wi::bit_and (captures[1], bitpos / BITS_PER_UNIT));
	      return res;
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_167 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (op), enum tree_code ARG_UNUSED (cmp))
{
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations)
    {
      {
/* #line 1988 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (op == PLUS_EXPR ? MINUS_EXPR : PLUS_EXPR, TREE_TYPE (captures[1]), captures[2], captures[1]);
/* #line 1993 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (tem && !TREE_OVERFLOW (tem))
	    {
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1994, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 =  tem;
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_168 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
)
{
/* #line 870 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])) && tree_nop_conversion_p (type, TREE_TYPE (captures[3])))
    {
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:872, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[2], res;
	{
	  tree ops2[1], res;
	  ops2[0] = captures[3];
	  res = fold_build1_loc (loc, BIT_NOT_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
	  ops1[0] = res;
	}
	ops1[1] = captures[0];
	res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	res_op0 = res;
      }
      tree res;
      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
      return res;
    }
  return NULL_TREE;
}

static tree
generic_simplify_169 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_associative_math)
    {
      {
/* #line 2003 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (MINUS_EXPR, TREE_TYPE (captures[1]), captures[0], captures[2]);
/* #line 2004 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (tem && !TREE_OVERFLOW (tem))
	    {
	      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2005, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 =  tem;
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_170 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (sq), enum tree_code ARG_UNUSED (cmp))
{
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && ! flag_errno_math)
    {
/* #line 2014 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (REAL_VALUE_NEGATIVE (TREE_REAL_CST (captures[1])))
	{
/* #line 2017 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (cmp == EQ_EXPR || cmp == LT_EXPR || cmp == LE_EXPR)
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2018, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res =  constant_boolean_node (false, type);
	      if (TREE_SIDE_EFFECTS (captures[0]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	      return res;
	    }
	  else
	    {
/* #line 2021 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cmp == NE_EXPR || !HONOR_NANS (captures[0]))
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2022, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res =  constant_boolean_node (true, type);
		  if (TREE_SIDE_EFFECTS (captures[0]))
		    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		  return res;
		}
	      else
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2024, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  res_op1 =  build_real (TREE_TYPE (captures[0]), dconst0);
		  tree res;
		  res = fold_build2_loc (loc, GE_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	}
      else
	{
/* #line 2025 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (real_equal (TREE_REAL_CST_PTR (captures[1]), &dconst0))
	    {
/* #line 2028 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cmp == LT_EXPR)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2029, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res =  constant_boolean_node (false, type);
		  if (TREE_SIDE_EFFECTS (captures[0]))
		    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		  return res;
		}
	      else
		{
/* #line 2031 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == GE_EXPR && !HONOR_NANS (captures[0]))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2032, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res =  constant_boolean_node (true, type);
		      if (TREE_SIDE_EFFECTS (captures[0]))
			res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		      return res;
		    }
		  else
		    {
/* #line 2034 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (cmp == LE_EXPR)
			{
			  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2035, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 = captures[1];
			  tree res;
			  res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			  return res;
			}
		      else
			{
			  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2043, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 = captures[1];
			  tree res;
			  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
			  return res;
			}
		    }
		}
	    }
	  else
	    {
/* #line 2044 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (cmp == GT_EXPR || cmp == GE_EXPR)
		{
		  {
/* #line 2045 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 REAL_VALUE_TYPE c2;
 real_arithmetic (&c2, MULT_EXPR, &TREE_REAL_CST (captures[1]), &TREE_REAL_CST (captures[1]));
 real_convert (&c2, TYPE_MODE (TREE_TYPE (captures[0])), &c2);
/* #line 2052 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (REAL_VALUE_ISINF (c2))
			{
/* #line 2054 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (HONOR_INFINITIES (captures[0]))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2055, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  build_real (TREE_TYPE (captures[0]), c2);
			      tree res;
			      res = fold_build2_loc (loc, EQ_EXPR, type, res_op0, res_op1);
			      return res;
			    }
			  else
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2056, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res =  constant_boolean_node (false, type);
			      if (TREE_SIDE_EFFECTS (captures[0]))
				res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
			      return res;
			    }
			}
		      else
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2058, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  build_real (TREE_TYPE (captures[0]), c2);
			  tree res;
			  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
			  return res;
			}
		  }
		}
	      else
		{
/* #line 2059 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (cmp == LT_EXPR || cmp == LE_EXPR)
		    {
		      {
/* #line 2060 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 REAL_VALUE_TYPE c2;
 real_arithmetic (&c2, MULT_EXPR, &TREE_REAL_CST (captures[1]), &TREE_REAL_CST (captures[1]));
 real_convert (&c2, TYPE_MODE (TREE_TYPE (captures[0])), &c2);
/* #line 2067 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (REAL_VALUE_ISINF (c2))
			    {
/* #line 2071 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (! HONOR_NANS (captures[0]) && ! HONOR_INFINITIES (captures[0]))
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2072, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  constant_boolean_node (true, type);
				  if (TREE_SIDE_EFFECTS (captures[0]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				  return res;
				}
			      else
				{
/* #line 2075 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (! HONOR_NANS (captures[0]))
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2076, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[0];
				      tree res_op1;
				      res_op1 =  build_real (TREE_TYPE (captures[0]), c2);
				      tree res;
				      res = fold_build2_loc (loc, NE_EXPR, type, res_op0, res_op1);
				      return res;
				    }
				  else
				    {
/* #line 2079 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (! HONOR_INFINITIES (captures[0]))
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2080, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 =  build_real (TREE_TYPE (captures[0]), dconst0);
					  tree res;
					  res = fold_build2_loc (loc, GE_EXPR, type, res_op0, res_op1);
					  return res;
					}
				      else
					{
/* #line 2082 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					  if (1)
					    {
					      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2083, %s:%d\n", __FILE__, __LINE__);
					      if (! tree_invariant_p (captures[0])) return NULL_TREE;
					      tree res_op0;
					      {
						tree ops1[2], res;
						ops1[0] = unshare_expr (captures[0]);
						ops1[1] =  build_real (TREE_TYPE (captures[0]), dconst0);
						res = fold_build2_loc (loc, GE_EXPR, boolean_type_node, ops1[0], ops1[1]);
						res_op0 = res;
					      }
					      tree res_op1;
					      {
						tree ops1[2], res;
						ops1[0] = captures[0];
						ops1[1] =  build_real (TREE_TYPE (captures[0]), c2);
						res = fold_build2_loc (loc, NE_EXPR, boolean_type_node, ops1[0], ops1[1]);
						res_op1 = res;
					      }
					      tree res;
					      res = fold_build2_loc (loc, TRUTH_ANDIF_EXPR, type, res_op0, res_op1);
					      return res;
					    }
					}
				    }
				}
			    }
			  else
			    {
/* #line 2087 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (! HONOR_NANS (captures[0]))
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2088, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 = captures[0];
				  tree res_op1;
				  res_op1 =  build_real (TREE_TYPE (captures[0]), c2);
				  tree res;
				  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
				  return res;
				}
			      else
				{
/* #line 2090 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (1)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2091, %s:%d\n", __FILE__, __LINE__);
				      if (! tree_invariant_p (captures[0])) return NULL_TREE;
				      tree res_op0;
				      {
					tree ops1[2], res;
					ops1[0] = unshare_expr (captures[0]);
					ops1[1] =  build_real (TREE_TYPE (captures[0]), dconst0);
					res = fold_build2_loc (loc, GE_EXPR, boolean_type_node, ops1[0], ops1[1]);
					res_op0 = res;
				      }
				      tree res_op1;
				      {
					tree ops1[2], res;
					ops1[0] = captures[0];
					ops1[1] =  build_real (TREE_TYPE (captures[0]), c2);
					res = fold_build2_loc (loc, cmp, boolean_type_node, ops1[0], ops1[1]);
					res_op1 = res;
				      }
				      tree res;
				      res = fold_build2_loc (loc, TRUTH_ANDIF_EXPR, type, res_op0, res_op1);
				      return res;
				    }
				}
			    }
		      }
		    }
		}
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_171 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, combined_fn ARG_UNUSED (TAN), combined_fn ARG_UNUSED (SIN), combined_fn ARG_UNUSED (COS))
{
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (flag_unsafe_math_optimizations && canonicalize_math_p ())
    {
/* #line 2689 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (! HONOR_NANS (captures[1]) && ! HONOR_INFINITIES (captures[1]))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2691, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 =  build_one_cst (type);
	  tree res_op1;
	  {
	    tree ops1[1], res;
	    ops1[0] = captures[1];
	    {
	      res = maybe_build_call_expr_loc (loc, COS, TREE_TYPE (ops1[0]), 1, ops1[0]);
	      if (!res)
	        return NULL_TREE;
	    }
	    res_op1 = res;
	  }
	  tree res;
	  res = fold_build2_loc (loc, RDIV_EXPR, type, res_op0, res_op1);
	  return res;
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_172 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp))
{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
  if (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && !(targetm.have_canonicalize_funcptr_for_compare () && TREE_CODE (TREE_TYPE (captures[1])) == POINTER_TYPE && TREE_CODE (TREE_TYPE (TREE_TYPE (captures[1]))) == FUNCTION_TYPE) && single_use (captures[0]))
    {
/* #line 2164 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (TYPE_PRECISION (TREE_TYPE (captures[1])) == TYPE_PRECISION (TREE_TYPE (captures[0])) && (TREE_CODE (captures[3]) == INTEGER_CST || (captures[2] != captures[3] && types_match (TREE_TYPE (captures[3]), TREE_TYPE (captures[1])))) && (TYPE_UNSIGNED (TREE_TYPE (captures[1])) == TYPE_UNSIGNED (TREE_TYPE (captures[0])) || cmp == NE_EXPR || cmp == EQ_EXPR) && (POINTER_TYPE_P (TREE_TYPE (captures[1])) == POINTER_TYPE_P (TREE_TYPE (captures[0]))))
	{
/* #line 2174 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TREE_CODE (captures[2]) == INTEGER_CST)
	    {
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2175, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      res_op1 =  force_fit_type (TREE_TYPE (captures[1]), wi::to_widest (captures[2]), 0, TREE_OVERFLOW (captures[2]));
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
	  else
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2177, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		if (TREE_TYPE (ops1[0]) != TREE_TYPE (res_op0))
		  res = fold_build1_loc (loc, NOP_EXPR, TREE_TYPE (res_op0), ops1[0]);
		else
		  res = ops1[0];
		res_op1 = res;
	      }
	      tree res;
	      res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
	      return res;
	    }
	}
      else
	{
/* #line 2179 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TYPE_PRECISION (TREE_TYPE (captures[0])) > TYPE_PRECISION (TREE_TYPE (captures[1])))
	    {
/* #line 2181 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if ((cmp == EQ_EXPR || cmp == NE_EXPR || TYPE_UNSIGNED (TREE_TYPE (captures[0])) == TYPE_UNSIGNED (TREE_TYPE (captures[1]))) && (types_match (TREE_TYPE (captures[3]), TREE_TYPE (captures[1])) || ((TYPE_PRECISION (TREE_TYPE (captures[1])) >= TYPE_PRECISION (TREE_TYPE (captures[3]))) && (TYPE_UNSIGNED (TREE_TYPE (captures[1])) == TYPE_UNSIGNED (TREE_TYPE (captures[3])))) || (TREE_CODE (captures[3]) == INTEGER_CST && INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && int_fits_type_p (captures[3], TREE_TYPE (captures[1])))))
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2191, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    ops1[0] = captures[3];
		    if (TREE_TYPE (ops1[0]) != TREE_TYPE (res_op0))
		      res = fold_build1_loc (loc, NOP_EXPR, TREE_TYPE (res_op0), ops1[0]);
		    else
		      res = ops1[0];
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, cmp, type, res_op0, res_op1);
		  return res;
		}
	      else
		{
/* #line 2192 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (TREE_CODE (captures[3]) == INTEGER_CST && INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) && !int_fits_type_p (captures[3], TREE_TYPE (captures[1])))
		    {
		      {
/* #line 2195 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree min = lower_bound_in_type (TREE_TYPE (captures[3]), TREE_TYPE (captures[1]));
 tree max = upper_bound_in_type (TREE_TYPE (captures[3]), TREE_TYPE (captures[1]));
 bool above = integer_nonzerop (const_binop (LT_EXPR, type, max, captures[3]));
 bool below = integer_nonzerop (const_binop (LT_EXPR, type, captures[3], min));
/* #line 2202 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (above || below)
			    {
/* #line 2203 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (cmp == EQ_EXPR || cmp == NE_EXPR)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2204, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  constant_boolean_node (cmp == EQ_EXPR ? false : true, type);
				  if (TREE_SIDE_EFFECTS (captures[1]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
				  if (TREE_SIDE_EFFECTS (captures[2]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
				  return res;
				}
			      else
				{
/* #line 2205 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (cmp == LT_EXPR || cmp == LE_EXPR)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2206, %s:%d\n", __FILE__, __LINE__);
				      tree res;
				      res =  constant_boolean_node (above ? true : false, type);
				      if (TREE_SIDE_EFFECTS (captures[1]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
				      if (TREE_SIDE_EFFECTS (captures[2]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
				      return res;
				    }
				  else
				    {
/* #line 2207 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (cmp == GT_EXPR || cmp == GE_EXPR)
					{
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2208, %s:%d\n", __FILE__, __LINE__);
					  tree res;
					  res =  constant_boolean_node (above ? false : true, type);
					  if (TREE_SIDE_EFFECTS (captures[1]))
					    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
					  if (TREE_SIDE_EFFECTS (captures[2]))
					    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
					  return res;
					}
				    }
				}
			    }
		      }
		    }
		}
	    }
	}
    }
  return NULL_TREE;
}

static tree
generic_simplify_173 (location_t ARG_UNUSED (loc), tree ARG_UNUSED (type),
 tree ARG_UNUSED (op0), tree ARG_UNUSED (op1), tree *captures
, enum tree_code ARG_UNUSED (cmp), enum tree_code ARG_UNUSED (icmp))
{
  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2264, %s:%d\n", __FILE__, __LINE__);
  tree res_op0;
  res_op0 = captures[0];
  tree res_op1;
  res_op1 =  build_zero_cst (TREE_TYPE (captures[1]));
  tree res;
  res = fold_build2_loc (loc, icmp, type, res_op0, res_op1);
  return res;
  return NULL_TREE;
}

static tree
generic_simplify_ABS_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    case ABS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 685 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:685, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[0];
	  return res;
	}
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 688 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:688, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res;
	  res = fold_build1_loc (loc, ABS_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    default:;
    }
if (tree_expr_nonnegative_p (op0))
  {
    {
/* #line 691 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:691, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res = captures[0];
      return res;
    }
  }
  return NULL_TREE;
}

static tree
generic_simplify_NEGATE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (tree_negate_expr_p (o21))
	  {
	    {
/* #line 724 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_46 (loc, type, op0, captures);
	      if (res) return res;
	    }
	  }
	if (tree_negate_expr_p (o20))
	  {
	    {
/* #line 724 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_46 (loc, type, op0, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		tree res = generic_simplify_78 (loc, type, op0, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  tree res = generic_simplify_78 (loc, type, op0, captures);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_BIT_NOT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 834 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:834, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[0];
	  return res;
	}
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 839 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		tree res = generic_simplify_63 (loc, type, op0, captures);
		if (res) return res;
	      }
	      break;
	    }
	  case MINUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (integer_each_onep (o31))
		{
		  {
/* #line 845 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		    tree res = generic_simplify_25 (loc, type, op0, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
	  case PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (integer_all_onesp (o31))
		{
		  {
/* #line 849 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		    tree res = generic_simplify_134 (loc, type, op0, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 855 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o30, o31 };
		      tree res = generic_simplify_64 (loc, type, op0, captures);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o30))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o40 = TREE_OPERAND (o30, 0);
		    {
/* #line 859 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o40, o31 };
		      tree res = generic_simplify_156 (loc, type, op0, captures);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o31))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o31, 0);
		    {
/* #line 859 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o50, o30 };
		      tree res = generic_simplify_156 (loc, type, op0, captures);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 839 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  tree res = generic_simplify_63 (loc, type, op0, captures);
	  if (res) return res;
	}
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_each_onep (o21))
	  {
	    {
/* #line 845 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_25 (loc, type, op0, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_all_onesp (o21))
	  {
	    {
/* #line 849 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_134 (loc, type, op0, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 855 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
		tree res = generic_simplify_64 (loc, type, op0, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 859 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o30, o21 };
		tree res = generic_simplify_156 (loc, type, op0, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      {
/* #line 859 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o40, o20 };
		tree res = generic_simplify_156 (loc, type, op0, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case LT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, LT_EXPR, GE_EXPR, UNGE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case LE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, LE_EXPR, GT_EXPR, UNGT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case EQ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, EQ_EXPR, NE_EXPR, NE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case NE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, NE_EXPR, EQ_EXPR, EQ_EXPR);
	  if (res) return res;
	}
        break;
      }
    case GE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, GE_EXPR, LT_EXPR, UNLT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case GT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, GT_EXPR, LE_EXPR, UNLE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case UNORDERED_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, UNORDERED_EXPR, ORDERED_EXPR, ORDERED_EXPR);
	  if (res) return res;
	}
        break;
      }
    case ORDERED_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, ORDERED_EXPR, UNORDERED_EXPR, UNORDERED_EXPR);
	  if (res) return res;
	}
        break;
      }
    case UNLT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, UNLT_EXPR, GE_EXPR, GE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case UNLE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, UNLE_EXPR, GT_EXPR, GT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case UNGT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, UNGT_EXPR, LE_EXPR, LE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case UNGE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, UNGE_EXPR, LT_EXPR, LT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case UNEQ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, UNEQ_EXPR, LTGT_EXPR, LTGT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case LTGT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1800 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  tree res = generic_simplify_57 (loc, type, op0, captures, LTGT_EXPR, UNEQ_EXPR, UNEQ_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_CONVERT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  {
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if ((0 && useless_type_conversion_p (type, TREE_TYPE (captures[0]))) || (1 && type == TREE_TYPE (captures[0])))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1420, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[0];
	return res;
      }
  }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  {
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inside_type = TREE_TYPE (captures[1]);
 tree inter_type = TREE_TYPE (captures[0]);
 int inside_int = INTEGRAL_TYPE_P (inside_type);
 int inside_ptr = POINTER_TYPE_P (inside_type);
 int inside_float = FLOAT_TYPE_P (inside_type);
 int inside_vec = VECTOR_TYPE_P (inside_type);
 unsigned int inside_prec = TYPE_PRECISION (inside_type);
 int inside_unsignedp = TYPE_UNSIGNED (inside_type);
 int inter_int = INTEGRAL_TYPE_P (inter_type);
 int inter_ptr = POINTER_TYPE_P (inter_type);
 int inter_float = FLOAT_TYPE_P (inter_type);
 int inter_vec = VECTOR_TYPE_P (inter_type);
 unsigned int inter_prec = TYPE_PRECISION (inter_type);
 int inter_unsignedp = TYPE_UNSIGNED (inter_type);
 int final_int = INTEGRAL_TYPE_P (type);
 int final_ptr = POINTER_TYPE_P (type);
 int final_float = FLOAT_TYPE_P (type);
 int final_vec = VECTOR_TYPE_P (type);
 unsigned int final_prec = TYPE_PRECISION (type);
 int final_unsignedp = TYPE_UNSIGNED (type);
/* #line 1487 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (((0 && useless_type_conversion_p (type, inside_type)) || (1 && TYPE_MAIN_VARIANT (type) == TYPE_MAIN_VARIANT (inside_type))) && (((inter_int || inter_ptr) && final_int) || (inter_float && final_float)) && inter_prec >= final_prec)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1493, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res;
		  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		  return res;
		}
	      else
		{
/* #line 1501 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (((inter_int && inside_int) || (inter_float && inside_float)) && (final_int || final_float) && inter_prec >= inside_prec && (inter_float || inter_unsignedp == inside_unsignedp) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1507, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		      return res;
		    }
		  else
		    {
/* #line 1513 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (inside_int && inter_int && final_int && ((inside_prec < inter_prec && inter_prec < final_prec && inside_unsignedp && !inter_unsignedp) || final_prec == inter_prec))
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1517, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[1];
			  tree res;
			  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
			  return res;
			}
		      else
			{
/* #line 1530 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! inside_float && ! inter_float && ! final_float && ! inside_vec && ! inter_vec && ! final_vec && (inter_prec >= inside_prec || inter_prec >= final_prec) && ! (inside_int && inter_int && inter_unsignedp != inside_unsignedp && inter_prec < final_prec) && ((inter_unsignedp && inter_prec > inside_prec) == (final_unsignedp && final_prec > inter_prec)) && ! (inside_ptr && inter_prec != final_prec) && ! (final_ptr && inside_prec != inter_prec) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1542, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[1];
			      tree res;
			      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
			      return res;
			    }
			  else
			    {
/* #line 1546 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (0 && final_int && inter_int && inside_int && final_prec == inside_prec && final_prec > inter_prec && inter_unsignedp)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1551, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  {
				    tree ops1[2], res;
				    ops1[0] = captures[1];
				    ops1[1] =  wide_int_to_tree (inside_type, wi::mask (inter_prec, false, TYPE_PRECISION (inside_type)));
				    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				    res_op0 = res;
				  }
				  tree res;
				  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				  return res;
				}
			      else
				{
/* #line 1559 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (0 && inside_int && inter_float && final_int && (unsigned) significand_size (TYPE_MODE (inter_type)) >= inside_prec - !inside_unsignedp)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1563, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      return res;
				    }
				}
			    }
			}
		    }
		}
	  }
	}
        break;
      }
    case FLOAT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  {
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inside_type = TREE_TYPE (captures[1]);
 tree inter_type = TREE_TYPE (captures[0]);
 int inside_int = INTEGRAL_TYPE_P (inside_type);
 int inside_ptr = POINTER_TYPE_P (inside_type);
 int inside_float = FLOAT_TYPE_P (inside_type);
 int inside_vec = VECTOR_TYPE_P (inside_type);
 unsigned int inside_prec = TYPE_PRECISION (inside_type);
 int inside_unsignedp = TYPE_UNSIGNED (inside_type);
 int inter_int = INTEGRAL_TYPE_P (inter_type);
 int inter_ptr = POINTER_TYPE_P (inter_type);
 int inter_float = FLOAT_TYPE_P (inter_type);
 int inter_vec = VECTOR_TYPE_P (inter_type);
 unsigned int inter_prec = TYPE_PRECISION (inter_type);
 int inter_unsignedp = TYPE_UNSIGNED (inter_type);
 int final_int = INTEGRAL_TYPE_P (type);
 int final_ptr = POINTER_TYPE_P (type);
 int final_float = FLOAT_TYPE_P (type);
 int final_vec = VECTOR_TYPE_P (type);
 unsigned int final_prec = TYPE_PRECISION (type);
 int final_unsignedp = TYPE_UNSIGNED (type);
/* #line 1487 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (((0 && useless_type_conversion_p (type, inside_type)) || (1 && TYPE_MAIN_VARIANT (type) == TYPE_MAIN_VARIANT (inside_type))) && (((inter_int || inter_ptr) && final_int) || (inter_float && final_float)) && inter_prec >= final_prec)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1493, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res;
		  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		  return res;
		}
	      else
		{
/* #line 1501 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (((inter_int && inside_int) || (inter_float && inside_float)) && (final_int || final_float) && inter_prec >= inside_prec && (inter_float || inter_unsignedp == inside_unsignedp) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1507, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		      return res;
		    }
		  else
		    {
/* #line 1513 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (inside_int && inter_int && final_int && ((inside_prec < inter_prec && inter_prec < final_prec && inside_unsignedp && !inter_unsignedp) || final_prec == inter_prec))
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1517, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[1];
			  tree res;
			  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
			  return res;
			}
		      else
			{
/* #line 1530 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! inside_float && ! inter_float && ! final_float && ! inside_vec && ! inter_vec && ! final_vec && (inter_prec >= inside_prec || inter_prec >= final_prec) && ! (inside_int && inter_int && inter_unsignedp != inside_unsignedp && inter_prec < final_prec) && ((inter_unsignedp && inter_prec > inside_prec) == (final_unsignedp && final_prec > inter_prec)) && ! (inside_ptr && inter_prec != final_prec) && ! (final_ptr && inside_prec != inter_prec) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1542, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[1];
			      tree res;
			      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
			      return res;
			    }
			  else
			    {
/* #line 1546 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (0 && final_int && inter_int && inside_int && final_prec == inside_prec && final_prec > inter_prec && inter_unsignedp)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1551, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  {
				    tree ops1[2], res;
				    ops1[0] = captures[1];
				    ops1[1] =  wide_int_to_tree (inside_type, wi::mask (inter_prec, false, TYPE_PRECISION (inside_type)));
				    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				    res_op0 = res;
				  }
				  tree res;
				  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				  return res;
				}
			      else
				{
/* #line 1559 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (0 && inside_int && inter_float && final_int && (unsigned) significand_size (TYPE_MODE (inter_type)) >= inside_prec - !inside_unsignedp)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1563, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      return res;
				    }
				}
			    }
			}
		    }
		}
	  }
	}
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 1570 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 1570 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		if (INTEGRAL_TYPE_P (type) && INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_PRECISION (type) <= TYPE_PRECISION (TREE_TYPE (captures[0])) && operand_equal_p (captures[1], build_low_bits_mask (TREE_TYPE (captures[1]), TYPE_PRECISION (type)), 0))
		  {
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1575, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    res_op0 = captures[0];
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (o21, 0);
		    {
/* #line 2968 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o21, o50 };
		      tree res = generic_simplify_47 (loc, type, op0, captures, PLUS_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (o21, 0);
		    {
/* #line 2968 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o21, o50 };
		      tree res = generic_simplify_47 (loc, type, op0, captures, MINUS_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_VIEW_CONVERT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  {
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if ((0 && useless_type_conversion_p (type, TREE_TYPE (captures[0]))) || (1 && type == TREE_TYPE (captures[0])))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1420, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[0];
	return res;
      }
  }
  switch (TREE_CODE (op0))
    {
    case VIEW_CONVERT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1425 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1425, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res;
	  res = fold_build1_loc (loc, VIEW_CONVERT_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    default:;
    }
  {
/* #line 1431 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1431 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if ((INTEGRAL_TYPE_P (type) || POINTER_TYPE_P (type)) && (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) || POINTER_TYPE_P (TREE_TYPE (captures[0]))) && TYPE_PRECISION (type) == TYPE_PRECISION (TREE_TYPE (captures[0])))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1434, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	return res;
      }
  }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1439 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
/* #line 1439 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) || POINTER_TYPE_P (TREE_TYPE (captures[0]))) && (INTEGRAL_TYPE_P (TREE_TYPE (captures[1])) || POINTER_TYPE_P (TREE_TYPE (captures[1]))) && (TYPE_PRECISION (TREE_TYPE (captures[0])) == TYPE_PRECISION (TREE_TYPE (captures[1]))) && (TYPE_SIZE (TREE_TYPE (captures[0])) == TYPE_SIZE (TREE_TYPE (captures[1]))))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1443, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res;
	      res = fold_build1_loc (loc, VIEW_CONVERT_EXPR, type, res_op0);
	      return res;
	    }
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_FLOAT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  {
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if ((0 && useless_type_conversion_p (type, TREE_TYPE (captures[0]))) || (1 && type == TREE_TYPE (captures[0])))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1420, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[0];
	return res;
      }
  }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  {
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inside_type = TREE_TYPE (captures[1]);
 tree inter_type = TREE_TYPE (captures[0]);
 int inside_int = INTEGRAL_TYPE_P (inside_type);
 int inside_ptr = POINTER_TYPE_P (inside_type);
 int inside_float = FLOAT_TYPE_P (inside_type);
 int inside_vec = VECTOR_TYPE_P (inside_type);
 unsigned int inside_prec = TYPE_PRECISION (inside_type);
 int inside_unsignedp = TYPE_UNSIGNED (inside_type);
 int inter_int = INTEGRAL_TYPE_P (inter_type);
 int inter_ptr = POINTER_TYPE_P (inter_type);
 int inter_float = FLOAT_TYPE_P (inter_type);
 int inter_vec = VECTOR_TYPE_P (inter_type);
 unsigned int inter_prec = TYPE_PRECISION (inter_type);
 int inter_unsignedp = TYPE_UNSIGNED (inter_type);
 int final_int = INTEGRAL_TYPE_P (type);
 int final_ptr = POINTER_TYPE_P (type);
 int final_float = FLOAT_TYPE_P (type);
 int final_vec = VECTOR_TYPE_P (type);
 unsigned int final_prec = TYPE_PRECISION (type);
 int final_unsignedp = TYPE_UNSIGNED (type);
/* #line 1487 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (((0 && useless_type_conversion_p (type, inside_type)) || (1 && TYPE_MAIN_VARIANT (type) == TYPE_MAIN_VARIANT (inside_type))) && (((inter_int || inter_ptr) && final_int) || (inter_float && final_float)) && inter_prec >= final_prec)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1493, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res;
		  res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
		  return res;
		}
	      else
		{
/* #line 1501 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (((inter_int && inside_int) || (inter_float && inside_float)) && (final_int || final_float) && inter_prec >= inside_prec && (inter_float || inter_unsignedp == inside_unsignedp) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1507, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
		      return res;
		    }
		  else
		    {
/* #line 1513 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (inside_int && inter_int && final_int && ((inside_prec < inter_prec && inter_prec < final_prec && inside_unsignedp && !inter_unsignedp) || final_prec == inter_prec))
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1517, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[1];
			  tree res;
			  res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
			  return res;
			}
		      else
			{
/* #line 1530 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! inside_float && ! inter_float && ! final_float && ! inside_vec && ! inter_vec && ! final_vec && (inter_prec >= inside_prec || inter_prec >= final_prec) && ! (inside_int && inter_int && inter_unsignedp != inside_unsignedp && inter_prec < final_prec) && ((inter_unsignedp && inter_prec > inside_prec) == (final_unsignedp && final_prec > inter_prec)) && ! (inside_ptr && inter_prec != final_prec) && ! (final_ptr && inside_prec != inter_prec) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1542, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[1];
			      tree res;
			      res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
			      return res;
			    }
			  else
			    {
/* #line 1546 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (0 && final_int && inter_int && inside_int && final_prec == inside_prec && final_prec > inter_prec && inter_unsignedp)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1551, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  {
				    tree ops1[2], res;
				    ops1[0] = captures[1];
				    ops1[1] =  wide_int_to_tree (inside_type, wi::mask (inter_prec, false, TYPE_PRECISION (inside_type)));
				    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				    res_op0 = res;
				  }
				  tree res;
				  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				  return res;
				}
			      else
				{
/* #line 1559 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (0 && inside_int && inter_float && final_int && (unsigned) significand_size (TYPE_MODE (inter_type)) >= inside_prec - !inside_unsignedp)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1563, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      return res;
				    }
				}
			    }
			}
		    }
		}
	  }
	}
        break;
      }
    case FLOAT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  {
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inside_type = TREE_TYPE (captures[1]);
 tree inter_type = TREE_TYPE (captures[0]);
 int inside_int = INTEGRAL_TYPE_P (inside_type);
 int inside_ptr = POINTER_TYPE_P (inside_type);
 int inside_float = FLOAT_TYPE_P (inside_type);
 int inside_vec = VECTOR_TYPE_P (inside_type);
 unsigned int inside_prec = TYPE_PRECISION (inside_type);
 int inside_unsignedp = TYPE_UNSIGNED (inside_type);
 int inter_int = INTEGRAL_TYPE_P (inter_type);
 int inter_ptr = POINTER_TYPE_P (inter_type);
 int inter_float = FLOAT_TYPE_P (inter_type);
 int inter_vec = VECTOR_TYPE_P (inter_type);
 unsigned int inter_prec = TYPE_PRECISION (inter_type);
 int inter_unsignedp = TYPE_UNSIGNED (inter_type);
 int final_int = INTEGRAL_TYPE_P (type);
 int final_ptr = POINTER_TYPE_P (type);
 int final_float = FLOAT_TYPE_P (type);
 int final_vec = VECTOR_TYPE_P (type);
 unsigned int final_prec = TYPE_PRECISION (type);
 int final_unsignedp = TYPE_UNSIGNED (type);
/* #line 1487 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (((0 && useless_type_conversion_p (type, inside_type)) || (1 && TYPE_MAIN_VARIANT (type) == TYPE_MAIN_VARIANT (inside_type))) && (((inter_int || inter_ptr) && final_int) || (inter_float && final_float)) && inter_prec >= final_prec)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1493, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res;
		  res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
		  return res;
		}
	      else
		{
/* #line 1501 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (((inter_int && inside_int) || (inter_float && inside_float)) && (final_int || final_float) && inter_prec >= inside_prec && (inter_float || inter_unsignedp == inside_unsignedp) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1507, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
		      return res;
		    }
		  else
		    {
/* #line 1513 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (inside_int && inter_int && final_int && ((inside_prec < inter_prec && inter_prec < final_prec && inside_unsignedp && !inter_unsignedp) || final_prec == inter_prec))
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1517, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[1];
			  tree res;
			  res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
			  return res;
			}
		      else
			{
/* #line 1530 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! inside_float && ! inter_float && ! final_float && ! inside_vec && ! inter_vec && ! final_vec && (inter_prec >= inside_prec || inter_prec >= final_prec) && ! (inside_int && inter_int && inter_unsignedp != inside_unsignedp && inter_prec < final_prec) && ((inter_unsignedp && inter_prec > inside_prec) == (final_unsignedp && final_prec > inter_prec)) && ! (inside_ptr && inter_prec != final_prec) && ! (final_ptr && inside_prec != inter_prec) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1542, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[1];
			      tree res;
			      res = fold_build1_loc (loc, FLOAT_EXPR, type, res_op0);
			      return res;
			    }
			  else
			    {
/* #line 1546 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (0 && final_int && inter_int && inside_int && final_prec == inside_prec && final_prec > inter_prec && inter_unsignedp)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1551, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  {
				    tree ops1[2], res;
				    ops1[0] = captures[1];
				    ops1[1] =  wide_int_to_tree (inside_type, wi::mask (inter_prec, false, TYPE_PRECISION (inside_type)));
				    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				    res_op0 = res;
				  }
				  tree res;
				  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				  return res;
				}
			      else
				{
/* #line 1559 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (0 && inside_int && inter_float && final_int && (unsigned) significand_size (TYPE_MODE (inter_type)) >= inside_prec - !inside_unsignedp)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1563, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      return res;
				    }
				}
			    }
			}
		    }
		}
	  }
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_FIX_TRUNC_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  {
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1418 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if ((0 && useless_type_conversion_p (type, TREE_TYPE (captures[0]))) || (1 && type == TREE_TYPE (captures[0])))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1420, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[0];
	return res;
      }
  }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  {
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inside_type = TREE_TYPE (captures[1]);
 tree inter_type = TREE_TYPE (captures[0]);
 int inside_int = INTEGRAL_TYPE_P (inside_type);
 int inside_ptr = POINTER_TYPE_P (inside_type);
 int inside_float = FLOAT_TYPE_P (inside_type);
 int inside_vec = VECTOR_TYPE_P (inside_type);
 unsigned int inside_prec = TYPE_PRECISION (inside_type);
 int inside_unsignedp = TYPE_UNSIGNED (inside_type);
 int inter_int = INTEGRAL_TYPE_P (inter_type);
 int inter_ptr = POINTER_TYPE_P (inter_type);
 int inter_float = FLOAT_TYPE_P (inter_type);
 int inter_vec = VECTOR_TYPE_P (inter_type);
 unsigned int inter_prec = TYPE_PRECISION (inter_type);
 int inter_unsignedp = TYPE_UNSIGNED (inter_type);
 int final_int = INTEGRAL_TYPE_P (type);
 int final_ptr = POINTER_TYPE_P (type);
 int final_float = FLOAT_TYPE_P (type);
 int final_vec = VECTOR_TYPE_P (type);
 unsigned int final_prec = TYPE_PRECISION (type);
 int final_unsignedp = TYPE_UNSIGNED (type);
/* #line 1487 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (((0 && useless_type_conversion_p (type, inside_type)) || (1 && TYPE_MAIN_VARIANT (type) == TYPE_MAIN_VARIANT (inside_type))) && (((inter_int || inter_ptr) && final_int) || (inter_float && final_float)) && inter_prec >= final_prec)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1493, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res;
		  res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
		  return res;
		}
	      else
		{
/* #line 1501 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (((inter_int && inside_int) || (inter_float && inside_float)) && (final_int || final_float) && inter_prec >= inside_prec && (inter_float || inter_unsignedp == inside_unsignedp) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1507, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
		      return res;
		    }
		  else
		    {
/* #line 1513 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (inside_int && inter_int && final_int && ((inside_prec < inter_prec && inter_prec < final_prec && inside_unsignedp && !inter_unsignedp) || final_prec == inter_prec))
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1517, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[1];
			  tree res;
			  res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
			  return res;
			}
		      else
			{
/* #line 1530 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! inside_float && ! inter_float && ! final_float && ! inside_vec && ! inter_vec && ! final_vec && (inter_prec >= inside_prec || inter_prec >= final_prec) && ! (inside_int && inter_int && inter_unsignedp != inside_unsignedp && inter_prec < final_prec) && ((inter_unsignedp && inter_prec > inside_prec) == (final_unsignedp && final_prec > inter_prec)) && ! (inside_ptr && inter_prec != final_prec) && ! (final_ptr && inside_prec != inter_prec) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1542, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[1];
			      tree res;
			      res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
			      return res;
			    }
			  else
			    {
/* #line 1546 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (0 && final_int && inter_int && inside_int && final_prec == inside_prec && final_prec > inter_prec && inter_unsignedp)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1551, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  {
				    tree ops1[2], res;
				    ops1[0] = captures[1];
				    ops1[1] =  wide_int_to_tree (inside_type, wi::mask (inter_prec, false, TYPE_PRECISION (inside_type)));
				    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				    res_op0 = res;
				  }
				  tree res;
				  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				  return res;
				}
			      else
				{
/* #line 1559 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (0 && inside_int && inter_float && final_int && (unsigned) significand_size (TYPE_MODE (inter_type)) >= inside_prec - !inside_unsignedp)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1563, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      return res;
				    }
				}
			    }
			}
		    }
		}
	  }
	}
        break;
      }
    case FLOAT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  {
/* #line 1459 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inside_type = TREE_TYPE (captures[1]);
 tree inter_type = TREE_TYPE (captures[0]);
 int inside_int = INTEGRAL_TYPE_P (inside_type);
 int inside_ptr = POINTER_TYPE_P (inside_type);
 int inside_float = FLOAT_TYPE_P (inside_type);
 int inside_vec = VECTOR_TYPE_P (inside_type);
 unsigned int inside_prec = TYPE_PRECISION (inside_type);
 int inside_unsignedp = TYPE_UNSIGNED (inside_type);
 int inter_int = INTEGRAL_TYPE_P (inter_type);
 int inter_ptr = POINTER_TYPE_P (inter_type);
 int inter_float = FLOAT_TYPE_P (inter_type);
 int inter_vec = VECTOR_TYPE_P (inter_type);
 unsigned int inter_prec = TYPE_PRECISION (inter_type);
 int inter_unsignedp = TYPE_UNSIGNED (inter_type);
 int final_int = INTEGRAL_TYPE_P (type);
 int final_ptr = POINTER_TYPE_P (type);
 int final_float = FLOAT_TYPE_P (type);
 int final_vec = VECTOR_TYPE_P (type);
 unsigned int final_prec = TYPE_PRECISION (type);
 int final_unsignedp = TYPE_UNSIGNED (type);
/* #line 1487 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (((0 && useless_type_conversion_p (type, inside_type)) || (1 && TYPE_MAIN_VARIANT (type) == TYPE_MAIN_VARIANT (inside_type))) && (((inter_int || inter_ptr) && final_int) || (inter_float && final_float)) && inter_prec >= final_prec)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1493, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[1];
		  tree res;
		  res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
		  return res;
		}
	      else
		{
/* #line 1501 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (((inter_int && inside_int) || (inter_float && inside_float)) && (final_int || final_float) && inter_prec >= inside_prec && (inter_float || inter_unsignedp == inside_unsignedp) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1507, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
		      return res;
		    }
		  else
		    {
/* #line 1513 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (inside_int && inter_int && final_int && ((inside_prec < inter_prec && inter_prec < final_prec && inside_unsignedp && !inter_unsignedp) || final_prec == inter_prec))
			{
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1517, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[1];
			  tree res;
			  res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
			  return res;
			}
		      else
			{
/* #line 1530 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (! inside_float && ! inter_float && ! final_float && ! inside_vec && ! inter_vec && ! final_vec && (inter_prec >= inside_prec || inter_prec >= final_prec) && ! (inside_int && inter_int && inter_unsignedp != inside_unsignedp && inter_prec < final_prec) && ((inter_unsignedp && inter_prec > inside_prec) == (final_unsignedp && final_prec > inter_prec)) && ! (inside_ptr && inter_prec != final_prec) && ! (final_ptr && inside_prec != inter_prec) && ! (final_prec != GET_MODE_PRECISION (TYPE_MODE (type)) && TYPE_MODE (type) == TYPE_MODE (inter_type)))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1542, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[1];
			      tree res;
			      res = fold_build1_loc (loc, FIX_TRUNC_EXPR, type, res_op0);
			      return res;
			    }
			  else
			    {
/* #line 1546 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (0 && final_int && inter_int && inside_int && final_prec == inside_prec && final_prec > inter_prec && inter_unsignedp)
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1551, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  {
				    tree ops1[2], res;
				    ops1[0] = captures[1];
				    ops1[1] =  wide_int_to_tree (inside_type, wi::mask (inter_prec, false, TYPE_PRECISION (inside_type)));
				    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				    res_op0 = res;
				  }
				  tree res;
				  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				  return res;
				}
			      else
				{
/* #line 1559 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (0 && inside_int && inter_float && final_int && (unsigned) significand_size (TYPE_MODE (inter_type)) >= inside_prec - !inside_unsignedp)
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1563, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      return res;
				    }
				}
			    }
			}
		    }
		}
	  }
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_PAREN_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    case PAREN_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1452 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1452, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[0];
	  return res;
	}
        break;
      }
    default:;
    }
if (CONSTANT_CLASS_P (op0))
  {
    {
/* #line 1449 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1449, %s:%d\n", __FILE__, __LINE__);
      tree res;
      res = captures[0];
      return res;
    }
  }
  return NULL_TREE;
}

static tree
generic_simplify_REALPART_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    case COMPLEX_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1628, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[0];
	  if (TREE_SIDE_EFFECTS (captures[1]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	  return res;
	}
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case CONJ_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 1636 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1636, %s:%d\n", __FILE__, __LINE__);
		tree res_op0;
		{
		  tree ops1[1], res;
		  ops1[0] = captures[2];
		  res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops1[0])), ops1[0]);
		  res_op0 = res;
		}
		tree res;
		res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		return res;
	      }
	      break;
	    }
	  case PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      {
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o30, o31 };
		enum tree_code op = PLUS_EXPR;
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
		tree res_op0;
		{
		  tree ops1[2], res;
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[2];
		    res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[0] = res;
		  }
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[3];
		    res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[1] = res;
		  }
		  res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		  res_op0 = res;
		}
		tree res;
		res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		return res;
	      }
	      break;
	    }
	  case MINUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      {
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o30, o31 };
		enum tree_code op = MINUS_EXPR;
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
		tree res_op0;
		{
		  tree ops1[2], res;
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[2];
		    res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[0] = res;
		  }
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[3];
		    res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[1] = res;
		  }
		  res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		  res_op0 = res;
		}
		tree res;
		res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		return res;
	      }
	      break;
	    }
	  case CALL_EXPR:
	    switch (get_call_combined_fn (o20))
	      {
	      case CFN_BUILT_IN_CEXPIF:
	        {
		  tree o30 = CALL_EXPR_ARG (o20, 0);
		  {
/* #line 1647 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1647, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      {
		        res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_COSF, TREE_TYPE (ops1[0]), 1, ops1[0]);
		        if (!res)
		          return NULL_TREE;
		      }
		      res_op0 = res;
		    }
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	          break;
	        }
	      case CFN_BUILT_IN_CEXPI:
	        {
		  tree o30 = CALL_EXPR_ARG (o20, 0);
		  {
/* #line 1647 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1647, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      {
		        res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_COS, TREE_TYPE (ops1[0]), 1, ops1[0]);
		        if (!res)
		          return NULL_TREE;
		      }
		      res_op0 = res;
		    }
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	          break;
	        }
	      case CFN_BUILT_IN_CEXPIL:
	        {
		  tree o30 = CALL_EXPR_ARG (o20, 0);
		  {
/* #line 1647 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1647, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      {
		        res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_COSL, TREE_TYPE (ops1[0]), 1, ops1[0]);
		        if (!res)
		          return NULL_TREE;
		      }
		      res_op0 = res;
		    }
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
          default:;
          }
        break;
      }
    case CONJ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1636 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1636, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[1], res;
	    ops1[0] = captures[2];
	    res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops1[0])), ops1[0]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, op0, o20, o21 };
	  enum tree_code op = PLUS_EXPR;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[0] = res;
	    }
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[3];
	      res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[1] = res;
	    }
	    res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, op0, o20, o21 };
	  enum tree_code op = MINUS_EXPR;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[0] = res;
	    }
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[3];
	      res = fold_build1_loc (loc, REALPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[1] = res;
	    }
	    res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_CEXPIF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    {
/* #line 1647 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1647, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		{
		  res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_COSF, TREE_TYPE (ops1[0]), 1, ops1[0]);
		  if (!res)
		    return NULL_TREE;
		}
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	    }
	    break;
	  }
	case CFN_BUILT_IN_CEXPI:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    {
/* #line 1647 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1647, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		{
		  res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_COS, TREE_TYPE (ops1[0]), 1, ops1[0]);
		  if (!res)
		    return NULL_TREE;
		}
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	    }
	    break;
	  }
	case CFN_BUILT_IN_CEXPIL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    {
/* #line 1647 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1647, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		{
		  res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_COSL, TREE_TYPE (ops1[0]), 1, ops1[0]);
		  if (!res)
		    return NULL_TREE;
		}
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	    }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_IMAGPART_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    case COMPLEX_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1631 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1631, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[1];
	  if (TREE_SIDE_EFFECTS (captures[0]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	  return res;
	}
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case CONJ_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 1639 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1639, %s:%d\n", __FILE__, __LINE__);
		tree res_op0;
		{
		  tree ops1[1], res;
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[2];
		    res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[0] = res;
		  }
		  res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
		  res_op0 = res;
		}
		tree res;
		res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		return res;
	      }
	      break;
	    }
	  case PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      {
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o30, o31 };
		enum tree_code op = PLUS_EXPR;
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
		tree res_op0;
		{
		  tree ops1[2], res;
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[2];
		    res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[0] = res;
		  }
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[3];
		    res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[1] = res;
		  }
		  res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		  res_op0 = res;
		}
		tree res;
		res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		return res;
	      }
	      break;
	    }
	  case MINUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      {
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o30, o31 };
		enum tree_code op = MINUS_EXPR;
		if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
		tree res_op0;
		{
		  tree ops1[2], res;
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[2];
		    res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[0] = res;
		  }
		  {
		    tree ops2[1], res;
		    ops2[0] = captures[3];
		    res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
		    ops1[1] = res;
		  }
		  res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		  res_op0 = res;
		}
		tree res;
		res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		return res;
	      }
	      break;
	    }
	  case CALL_EXPR:
	    switch (get_call_combined_fn (o20))
	      {
	      case CFN_BUILT_IN_CEXPIF:
	        {
		  tree o30 = CALL_EXPR_ARG (o20, 0);
		  {
/* #line 1650 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1650, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      {
		        res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SINF, TREE_TYPE (ops1[0]), 1, ops1[0]);
		        if (!res)
		          return NULL_TREE;
		      }
		      res_op0 = res;
		    }
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	          break;
	        }
	      case CFN_BUILT_IN_CEXPI:
	        {
		  tree o30 = CALL_EXPR_ARG (o20, 0);
		  {
/* #line 1650 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1650, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      {
		        res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SIN, TREE_TYPE (ops1[0]), 1, ops1[0]);
		        if (!res)
		          return NULL_TREE;
		      }
		      res_op0 = res;
		    }
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	          break;
	        }
	      case CFN_BUILT_IN_CEXPIL:
	        {
		  tree o30 = CALL_EXPR_ARG (o20, 0);
		  {
/* #line 1650 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o30 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1650, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      {
		        res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SINL, TREE_TYPE (ops1[0]), 1, ops1[0]);
		        if (!res)
		          return NULL_TREE;
		      }
		      res_op0 = res;
		    }
		    tree res;
		    res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
		    return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
          default:;
          }
        break;
      }
    case CONJ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1639 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1639, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[1], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[0] = res;
	    }
	    res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, op0, o20, o21 };
	  enum tree_code op = PLUS_EXPR;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[0] = res;
	    }
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[3];
	      res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[1] = res;
	    }
	    res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1644 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, op0, o20, o21 };
	  enum tree_code op = MINUS_EXPR;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1644, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  {
	    tree ops1[2], res;
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[2];
	      res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[0] = res;
	    }
	    {
	      tree ops2[1], res;
	      ops2[0] = captures[3];
	      res = fold_build1_loc (loc, IMAGPART_EXPR, TREE_TYPE (TREE_TYPE (ops2[0])), ops2[0]);
	      ops1[1] = res;
	    }
	    res = fold_build2_loc (loc, op, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op0 = res;
	  }
	  tree res;
	  res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	  return res;
	}
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_CEXPIF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    {
/* #line 1650 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1650, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		{
		  res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SINF, TREE_TYPE (ops1[0]), 1, ops1[0]);
		  if (!res)
		    return NULL_TREE;
		}
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	    }
	    break;
	  }
	case CFN_BUILT_IN_CEXPI:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    {
/* #line 1650 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1650, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		{
		  res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SIN, TREE_TYPE (ops1[0]), 1, ops1[0]);
		  if (!res)
		    return NULL_TREE;
		}
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	    }
	    break;
	  }
	case CFN_BUILT_IN_CEXPIL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    {
/* #line 1650 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1650, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		{
		  res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SINL, TREE_TYPE (ops1[0]), 1, ops1[0]);
		  if (!res)
		    return NULL_TREE;
		}
		res_op0 = res;
	      }
	      tree res;
	      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
	      return res;
	    }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_CONJ_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0)
{
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case CONJ_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 1655 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		tree res = generic_simplify_125 (loc, type, op0, captures);
		if (res) return res;
	      }
	      break;
	    }
	  case COMPLEX_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      {
/* #line 1661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o30, o31 };
		{
/* #line 1661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree itype = TREE_TYPE (type);
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1662, %s:%d\n", __FILE__, __LINE__);
		    tree res_op0;
		    {
		      tree ops1[1], res;
		      ops1[0] = captures[2];
		      if (TREE_TYPE (ops1[0]) != itype)
			res = fold_build1_loc (loc, NOP_EXPR, itype, ops1[0]);
		      else
		        res = ops1[0];
		      res_op0 = res;
		    }
		    tree res_op1;
		    {
		      tree ops1[1], res;
		      {
			tree ops2[1], res;
			ops2[0] = captures[3];
			if (TREE_TYPE (ops2[0]) != itype)
			  res = fold_build1_loc (loc, NOP_EXPR, itype, ops2[0]);
			else
			  res = ops2[0];
			ops1[0] = res;
		      }
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
		      res_op1 = res;
		    }
		    tree res;
		    res = fold_build2_loc (loc, COMPLEX_EXPR, type, res_op0, res_op1);
		    return res;
		}
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case CONJ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 1655 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  tree res = generic_simplify_125 (loc, type, op0, captures);
	  if (res) return res;
	}
        break;
      }
    case COMPLEX_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 1661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, op0, o20, o21 };
	  {
/* #line 1661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree itype = TREE_TYPE (type);
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1662, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[1], res;
		ops1[0] = captures[2];
		if (TREE_TYPE (ops1[0]) != itype)
		  res = fold_build1_loc (loc, NOP_EXPR, itype, ops1[0]);
		else
		  res = ops1[0];
		res_op0 = res;
	      }
	      tree res_op1;
	      {
		tree ops1[1], res;
		{
		  tree ops2[1], res;
		  ops2[0] = captures[3];
		  if (TREE_TYPE (ops2[0]) != itype)
		    res = fold_build1_loc (loc, NOP_EXPR, itype, ops2[0]);
		  else
		    res = ops2[0];
		  ops1[0] = res;
		}
		res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
		res_op1 = res;
	      }
	      tree res;
	      res = fold_build2_loc (loc, COMPLEX_EXPR, type, res_op0, res_op1);
	      return res;
	  }
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

tree
generic_simplify (location_t loc, enum tree_code code, tree type ATTRIBUTE_UNUSED, tree op0)
{
  switch (code)
    {
    case ABS_EXPR:
      return generic_simplify_ABS_EXPR (loc, code, type, op0);
    case NEGATE_EXPR:
      return generic_simplify_NEGATE_EXPR (loc, code, type, op0);
    case BIT_NOT_EXPR:
      return generic_simplify_BIT_NOT_EXPR (loc, code, type, op0);
    CASE_CONVERT:
      return generic_simplify_CONVERT_EXPR (loc, code, type, op0);
    case VIEW_CONVERT_EXPR:
      return generic_simplify_VIEW_CONVERT_EXPR (loc, code, type, op0);
    case FLOAT_EXPR:
      return generic_simplify_FLOAT_EXPR (loc, code, type, op0);
    case FIX_TRUNC_EXPR:
      return generic_simplify_FIX_TRUNC_EXPR (loc, code, type, op0);
    case PAREN_EXPR:
      return generic_simplify_PAREN_EXPR (loc, code, type, op0);
    case REALPART_EXPR:
      return generic_simplify_REALPART_EXPR (loc, code, type, op0);
    case IMAGPART_EXPR:
      return generic_simplify_IMAGPART_EXPR (loc, code, type, op0);
    case CONJ_EXPR:
      return generic_simplify_CONJ_EXPR (loc, code, type, op0);
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_PLUS_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op1))
    {
      {
/* #line 83 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:83, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = non_lvalue_loc (loc, res_op0);
	return res;
      }
    }
  if (real_zerop (op1))
    {
      {
/* #line 94 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_3 (loc, type, op0, op1, captures);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
			  tree res = generic_simplify_104 (loc, type, op0, op1, captures, PLUS_EXPR);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    if (o50 == o30 || operand_equal_p (o50, o30, 0))
		      {
			{
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o30 };
			  tree res = generic_simplify_104 (loc, type, op0, op1, captures, PLUS_EXPR);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
if (real_zerop (op0))
  {
    {
/* #line 94 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[2] ATTRIBUTE_UNUSED = { op1, op0 };
      tree res = generic_simplify_3 (loc, type, op0, op1, captures);
      if (res) return res;
    }
  }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_104 (loc, type, op0, op1, captures, PLUS_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_104 (loc, type, op0, op1, captures, PLUS_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_AND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    if (integer_onep (o31))
	      {
		{
/* #line 548 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o31 };
		  tree res = generic_simplify_112 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_onep (o21))
	  {
	    if (op1 == o20 || operand_equal_p (op1, o20, 0))
	      {
		{
/* #line 548 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, op0, o21 };
		  tree res = generic_simplify_112 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	      }
	  }
	switch (TREE_CODE (op1))
	  {
	  case BIT_XOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 581 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_120 (loc, type, op0, op1, captures, PLUS_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case BIT_IOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 586 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_101 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o50))
		      {
		      case BIT_AND_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  tree o61 = TREE_OPERAND (o50, 1);
			  switch (TREE_CODE (o61))
			    {
			    case INTEGER_CST:
			      {
				{
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o21, o50, o60, o61 };
				  tree res = generic_simplify_37 (loc, type, op0, op1, captures, PLUS_EXPR);
				  if (res) return res;
				}
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case BIT_AND_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    tree o51 = TREE_OPERAND (op1, 1);
		    switch (TREE_CODE (o51))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o50, o51 };
			    tree res = generic_simplify_37 (loc, type, op0, op1, captures, PLUS_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 581 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_120 (loc, type, op0, op1, captures, PLUS_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 586 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_101 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      CASE_CONVERT:
		        {
			  tree o60 = TREE_OPERAND (op1, 0);
			  switch (TREE_CODE (o60))
			    {
			    case BIT_AND_EXPR:
			      {
				tree o70 = TREE_OPERAND (o60, 0);
				tree o71 = TREE_OPERAND (o60, 1);
				switch (TREE_CODE (o71))
				  {
				  case INTEGER_CST:
				    {
				      {
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					tree captures[6] ATTRIBUTE_UNUSED = { o20, o30, o31, o60, o70, o71 };
					tree res = generic_simplify_37 (loc, type, op0, op1, captures, PLUS_EXPR);
					if (res) return res;
				      }
				      break;
				    }
			          default:;
			          }
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      case BIT_AND_EXPR:
		        {
			  tree o60 = TREE_OPERAND (op1, 0);
			  tree o61 = TREE_OPERAND (op1, 1);
			  switch (TREE_CODE (o61))
			    {
			    case INTEGER_CST:
			      {
				{
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  tree captures[6] ATTRIBUTE_UNUSED = { o20, o30, o31, op1, o60, o61 };
				  tree res = generic_simplify_37 (loc, type, op0, op1, captures, PLUS_EXPR);
				  if (res) return res;
				}
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op0, o40 };
		tree res = generic_simplify_98 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op1, o30 };
		tree res = generic_simplify_98 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case NEGATE_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	  tree res = generic_simplify_98 (loc, type, op0, op1, captures);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op1, o20 };
	  tree res = generic_simplify_98 (loc, type, op0, op1, captures);
	  if (res) return res;
	}
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_61 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case MINUS_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o30, op0 };
	      tree res = generic_simplify_61 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_56 (loc, type, op0, op1, captures, PLUS_EXPR, PLUS_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_56 (loc, type, op0, op1, captures, MINUS_EXPR, PLUS_EXPR);
		  if (res) return res;
		}
	      }
	  }
	if (CONSTANT_CLASS_P (o20))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_59 (loc, type, op0, op1, captures, PLUS_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_92 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_92 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      if (integer_each_onep (op1))
		{
		  {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		    tree res = generic_simplify_36 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (integer_each_onep (op1))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_36 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1589 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 1589 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (REAL_VALUE_NEGATIVE (TREE_REAL_CST (captures[1])))
	    {
	      {
/* #line 1590 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_unop (NEGATE_EXPR, type, captures[1]);
/* #line 1591 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (!TREE_OVERFLOW (tem) || !flag_trapping_math)
		    {
		      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1592, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[0];
		      tree res_op1;
		      res_op1 =  tem;
		      tree res;
		      res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
		      return res;
		    }
	      }
	    }
	}
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1597 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1597 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (SCALAR_FLOAT_TYPE_P (type))
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1598, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res_op1;
	    res_op1 =  build_real (type, dconst2);
	    tree res;
	    res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
	    return res;
	  }
      }
    }
  switch (TREE_CODE (op1))
    {
    case VIEW_CONVERT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case VEC_COND_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      tree o42 = TREE_OPERAND (o30, 2);
	      if (integer_each_onep (o41))
		{
		  if (integer_zerop (o42))
		    {
		      {
/* #line 1751 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[5] ATTRIBUTE_UNUSED = { op0, o30, o40, o41, o42 };
			tree res = generic_simplify_133 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case VIEW_CONVERT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case VEC_COND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      tree o32 = TREE_OPERAND (o20, 2);
	      if (integer_each_onep (o31))
		{
		  if (integer_zerop (o32))
		    {
		      {
/* #line 1751 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[5] ATTRIBUTE_UNUSED = { op1, o20, o30, o31, o32 };
			tree res = generic_simplify_133 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case VEC_COND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	tree o32 = TREE_OPERAND (op1, 2);
	if (integer_each_onep (o31))
	  {
	    if (integer_zerop (o32))
	      {
		{
/* #line 1751 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o31, o32 };
		  tree res = generic_simplify_133 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case VEC_COND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	tree o22 = TREE_OPERAND (op0, 2);
	if (integer_each_onep (o21))
	  {
	    if (integer_zerop (o22))
	      {
		{
/* #line 1751 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[5] ATTRIBUTE_UNUSED = { op1, op0, o20, o21, o22 };
		  tree res = generic_simplify_133 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_POINTER_PLUS_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op1))
    {
      {
/* #line 83 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:83, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = non_lvalue_loc (loc, res_op0);
	return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case POINTER_PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 922 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:922, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[1];
	  tree res_op1;
	  {
	    tree ops1[2], res;
	    ops1[0] = captures[2];
	    ops1[1] = captures[3];
	    res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
	    res_op1 = res;
	  }
	  tree res;
	  res = fold_build2_loc (loc, POINTER_PLUS_EXPR, type, res_op0, res_op1);
	  return res;
	}
        break;
      }
    default:;
    }
if (integer_zerop (op0))
  {
    {
/* #line 88 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[1] ATTRIBUTE_UNUSED = { op1 };
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:88, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      {
	tree ops1[1], res;
	ops1[0] = captures[0];
	if (TREE_TYPE (ops1[0]) != type)
	  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
	else
	  res = ops1[0];
	res_op0 = res;
      }
      tree res;
      res = non_lvalue_loc (loc, res_op0);
      return res;
    }
  }
  switch (TREE_CODE (op1))
    {
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case MINUS_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      switch (TREE_CODE (o40))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    switch (TREE_CODE (o41))
		      {
		      CASE_CONVERT:
		        {
			  tree o70 = TREE_OPERAND (o41, 0);
			  if (o70 == op0 || operand_equal_p (o70, op0, 0))
			    {
			      {
/* #line 935 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o50 };
/* #line 935 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				if (TYPE_PRECISION (TREE_TYPE (captures[1])) == TYPE_PRECISION (TREE_TYPE (captures[2])) && ((0 && useless_type_conversion_p (type, TREE_TYPE (captures[3]))) || (1 && type == TREE_TYPE (captures[3]))))
				  {
				    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:938, %s:%d\n", __FILE__, __LINE__);
				    tree res;
				    res = captures[3];
				    if (TREE_SIDE_EFFECTS (captures[0]))
				      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				    return res;
				  }
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	switch (TREE_CODE (o30))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      switch (TREE_CODE (o31))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (o31, 0);
		    if (o60 == op0 || operand_equal_p (o60, op0, 0))
		      {
			{
/* #line 935 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, op1, o40 };
/* #line 935 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (TYPE_PRECISION (TREE_TYPE (captures[1])) == TYPE_PRECISION (TREE_TYPE (captures[2])) && ((0 && useless_type_conversion_p (type, TREE_TYPE (captures[3]))) || (1 && type == TREE_TYPE (captures[3]))))
			    {
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:938, %s:%d\n", __FILE__, __LINE__);
			      tree res;
			      res = captures[3];
			      if (TREE_SIDE_EFFECTS (captures[0]))
				res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
			      return res;
			    }
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      switch (TREE_CODE (o40))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    if (o50 == op0 || operand_equal_p (o50, op0, 0))
		      {
			switch (TREE_CODE (o41))
			  {
			  case INTEGER_CST:
			    {
			      {
/* #line 949 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[2] ATTRIBUTE_UNUSED = { op0, o41 };
				{
/* #line 949 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree algn = wide_int_to_tree (TREE_TYPE (captures[0]), wi::bit_not (captures[1]));
				    if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
				    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:950, %s:%d\n", __FILE__, __LINE__);
				    tree res_op0;
				    res_op0 = captures[0];
				    tree res_op1;
				    res_op1 =  algn;
				    tree res;
				    res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
				    return res;
				}
			      }
			      break;
			    }
		          default:;
		          }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_MINUS_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op1))
    {
      {
/* #line 83 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:83, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = non_lvalue_loc (loc, res_op0);
	return res;
      }
    }
  if (real_zerop (op1))
    {
      {
/* #line 100 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 100 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (fold_real_zero_addition_p (type, captures[1], 1))
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:101, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = non_lvalue_loc (loc, res_op0);
	    if (TREE_SIDE_EFFECTS (captures[1]))
	      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	    return res;
	  }
      }
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 110 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 110 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!FLOAT_TYPE_P (type) || !HONOR_NANS (type))
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:111, %s:%d\n", __FILE__, __LINE__);
	    tree res;
	    res =  build_zero_cst (type);
	    if (TREE_SIDE_EFFECTS (captures[0]))
	      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	    return res;
	  }
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case MULT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    switch (TREE_CODE (o50))
		      {
		      case TRUNC_DIV_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  tree o61 = TREE_OPERAND (o50, 1);
			  if (o51 == o61 || operand_equal_p (o51, o61, 0))
			    {
			      {
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o20, o60, o61 };
				tree res = generic_simplify_76 (loc, type, op0, op1, captures);
				if (res) return res;
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    switch (TREE_CODE (o51))
		      {
		      case TRUNC_DIV_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o51, 0);
			  tree o71 = TREE_OPERAND (o51, 1);
			  if (o71 == o50 || operand_equal_p (o71, o50, 0))
			    {
			      {
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o20, o70, o50 };
				tree res = generic_simplify_76 (loc, type, op0, op1, captures);
				if (res) return res;
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case MULT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      tree o41 = TREE_OPERAND (op1, 1);
	      switch (TREE_CODE (o40))
	        {
		case TRUNC_DIV_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    if (o41 == o51 || operand_equal_p (o41, o51, 0))
		      {
			{
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[3] ATTRIBUTE_UNUSED = { o20, o50, o51 };
			  tree res = generic_simplify_76 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o41))
	        {
		case TRUNC_DIV_EXPR:
		  {
		    tree o60 = TREE_OPERAND (o41, 0);
		    tree o61 = TREE_OPERAND (o41, 1);
		    if (o61 == o40 || operand_equal_p (o61, o40, 0))
		      {
			{
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[3] ATTRIBUTE_UNUSED = { o20, o60, o40 };
			  tree res = generic_simplify_76 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case MULT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      switch (TREE_CODE (o40))
	        {
		case TRUNC_DIV_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    if (o41 == o51 || operand_equal_p (o41, o51, 0))
		      {
			{
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[3] ATTRIBUTE_UNUSED = { op0, o50, o51 };
			  tree res = generic_simplify_76 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o41))
	        {
		case TRUNC_DIV_EXPR:
		  {
		    tree o60 = TREE_OPERAND (o41, 0);
		    tree o61 = TREE_OPERAND (o41, 1);
		    if (o61 == o40 || operand_equal_p (o61, o40, 0))
		      {
			{
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[3] ATTRIBUTE_UNUSED = { op0, o60, o40 };
			  tree res = generic_simplify_76 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MULT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	switch (TREE_CODE (o30))
	  {
	  case TRUNC_DIV_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      if (o31 == o41 || operand_equal_p (o31, o41, 0))
		{
		  {
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o40, o41 };
		    tree res = generic_simplify_76 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o31))
	  {
	  case TRUNC_DIV_EXPR:
	    {
	      tree o50 = TREE_OPERAND (o31, 0);
	      tree o51 = TREE_OPERAND (o31, 1);
	      if (o51 == o30 || operand_equal_p (o51, o30, 0))
		{
		  {
/* #line 313 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o50, o30 };
		    tree res = generic_simplify_76 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o20 || operand_equal_p (o60, o20, 0))
		      {
			if (o61 == o40 || operand_equal_p (o61, o40, 0))
			  {
			    {
/* #line 474 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o40, op1 };
			      tree res = generic_simplify_85 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    if (o60 == o40 || operand_equal_p (o60, o40, 0))
		      {
			if (o61 == o20 || operand_equal_p (o61, o20, 0))
			  {
			    {
/* #line 474 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o40, op1 };
			      tree res = generic_simplify_85 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o21 || operand_equal_p (o60, o21, 0))
		      {
			if (o61 == o30 || operand_equal_p (o61, o30, 0))
			  {
			    {
/* #line 474 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[4] ATTRIBUTE_UNUSED = { op0, o21, o30, op1 };
			      tree res = generic_simplify_85 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			if (o61 == o21 || operand_equal_p (o61, o21, 0))
			  {
			    {
/* #line 474 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[4] ATTRIBUTE_UNUSED = { op0, o21, o30, op1 };
			      tree res = generic_simplify_85 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    tree o51 = TREE_OPERAND (op1, 1);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			switch (TREE_CODE (o51))
			  {
			  case INTEGER_CST:
			    {
			      {
/* #line 477 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
/* #line 477 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				if (wi::bit_not (captures[2]) == captures[4])
				  {
				    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
				    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:478, %s:%d\n", __FILE__, __LINE__);
				    if (! tree_invariant_p (captures[4])) return NULL_TREE;
				    tree res_op0;
				    {
				      tree ops1[2], res;
				      ops1[0] = captures[1];
				      ops1[1] = unshare_expr (captures[4]);
				      res = fold_build2_loc (loc, BIT_XOR_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
				      res_op0 = res;
				    }
				    tree res_op1;
				    res_op1 = captures[4];
				    tree res;
				    res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
				    return res;
				  }
			      }
			      break;
			    }
		          default:;
		          }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  switch (TREE_CODE (o51))
		    {
		    case BIT_NOT_EXPR:
		      {
			tree o70 = TREE_OPERAND (o51, 0);
			if (o70 == o21 || operand_equal_p (o70, o21, 0))
			  {
			    {
/* #line 483 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
			      tree res = generic_simplify_91 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		        break;
		      }
		    default:;
		    }
	        }
	      switch (TREE_CODE (o50))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o60 = TREE_OPERAND (o50, 0);
		    if (o60 == o21 || operand_equal_p (o60, o21, 0))
		      {
			if (o51 == o20 || operand_equal_p (o51, o20, 0))
			  {
			    {
/* #line 483 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
			      tree res = generic_simplify_91 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 591 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 591 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (!TYPE_OVERFLOW_SANITIZED (type) && !TYPE_OVERFLOW_TRAPS (type) && !TYPE_SATURATING (type))
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:593, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    res_op0 = captures[0];
			    tree res_op1;
			    res_op1 = captures[1];
			    tree res;
			    res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
			    return res;
			  }
		      }
		    }
	        }
	      break;
	    }
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 598 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 598 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (!TYPE_OVERFLOW_SANITIZED (type) && !TYPE_OVERFLOW_TRAPS (type) && !TYPE_SATURATING (type))
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:600, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    res_op0 = captures[0];
			    tree res_op1;
			    res_op1 = captures[1];
			    tree res;
			    res = fold_build2_loc (loc, BIT_IOR_EXPR, type, res_op0, res_op1);
			    return res;
			  }
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_XOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 605 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:605, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			res_op1 = captures[1];
			tree res;
			res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
			return res;
		      }
		    }
	        }
	      break;
	    }
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 610 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:610, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			res_op1 = captures[1];
			tree res;
			res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
			return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (tree_negate_expr_p (op1))
    {
      {
/* #line 731 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 731 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!FIXED_POINT_TYPE_P (type))
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:732, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res_op1;
	    {
	      tree ops1[1], res;
	      ops1[0] = captures[1];
	      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
	      res_op1 = res;
	    }
	    tree res;
	    res = fold_build2_loc (loc, PLUS_EXPR, type, res_op0, res_op1);
	    return res;
	  }
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 870 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[4] ATTRIBUTE_UNUSED = { o20, op1, o40, o51 };
			  tree res = generic_simplify_168 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o51 == o20 || operand_equal_p (o51, o20, 0))
		      {
			{
/* #line 870 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[4] ATTRIBUTE_UNUSED = { o20, op1, o40, o50 };
			  tree res = generic_simplify_168 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_AND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 870 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, op1, o31 };
	      tree res = generic_simplify_105 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 870 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, op1, o30 };
	      tree res = generic_simplify_105 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    {
/* #line 955 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
/* #line 955 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
			{
			  {
/* #line 956 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 HOST_WIDE_INT diff;
/* #line 957 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (ptr_difference_const (captures[0], captures[1], &diff))
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:958, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  build_int_cst_type (type, diff);
				  if (TREE_SIDE_EFFECTS (captures[1]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
				  return res;
				}
			  }
			}
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 961 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
/* #line 961 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (tree_nop_conversion_p (type, TREE_TYPE (captures[0])))
			{
			  {
/* #line 962 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 HOST_WIDE_INT diff;
/* #line 963 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (ptr_difference_const (captures[0], captures[1], &diff))
				{
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:964, %s:%d\n", __FILE__, __LINE__);
				  tree res;
				  res =  build_int_cst_type (type, diff);
				  if (TREE_SIDE_EFFECTS (captures[0]))
				    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				  return res;
				}
			  }
			}
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op0, o40 };
		tree res = generic_simplify_84 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	  tree res = generic_simplify_84 (loc, type, op0, op1, captures);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_41 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_41 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (!TYPE_SATURATING (type))
		{
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1037, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[1];
		      tree res;
		      res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
		      if (TREE_SIDE_EFFECTS (captures[0]))
			res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		      return res;
		    }
		}
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case PLUS_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
	      tree res = generic_simplify_79 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_79 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MINUS_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (!TYPE_SATURATING (type))
		{
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1046, %s:%d\n", __FILE__, __LINE__);
		      tree res;
		      res = captures[1];
		      if (TREE_SIDE_EFFECTS (captures[0]))
			res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
		      return res;
		    }
		}
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_56 (loc, type, op0, op1, captures, PLUS_EXPR, MINUS_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_56 (loc, type, op0, op1, captures, MINUS_EXPR, MINUS_EXPR);
		  if (res) return res;
		}
	      }
	  }
	if (CONSTANT_CLASS_P (o20))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_59 (loc, type, op0, op1, captures, MINUS_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      if (integer_each_onep (op1))
		{
		  {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[1] ATTRIBUTE_UNUSED = { o30 };
		    tree res = generic_simplify_52 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
	  case PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o30, o31 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (!TYPE_SATURATING (type))
			    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
				{
/* #line 1098 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (element_precision (type) <= element_precision (TREE_TYPE (captures[1])) || (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))) || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && TREE_CODE (captures[1]) == INTEGER_CST && tree_int_cst_sign_bit (captures[1]) == 0))
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1115, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      if (TREE_SIDE_EFFECTS (captures[0]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				      return res;
				    }
				}
			    }
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case POINTER_PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o30, o31 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (!TYPE_SATURATING (type))
			    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
				{
/* #line 1098 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (element_precision (type) <= element_precision (TREE_TYPE (captures[1])) || (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))) || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && TREE_CODE (captures[1]) == INTEGER_CST && tree_int_cst_sign_bit (captures[1]) == 0))
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1115, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      res_op0 = captures[1];
				      tree res;
				      res = fold_build1_loc (loc, NOP_EXPR, type, res_op0);
				      if (TREE_SIDE_EFFECTS (captures[0]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				      return res;
				    }
				}
			    }
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case PLUS_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o20, o51 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (!TYPE_SATURATING (type))
			    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
				{
/* #line 1122 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (element_precision (type) <= element_precision (TREE_TYPE (captures[1])) || (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))) || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && TREE_CODE (captures[1]) == INTEGER_CST && tree_int_cst_sign_bit (captures[1]) == 0))
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1139, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      {
					tree ops1[1], res;
					ops1[0] = captures[1];
					if (TREE_TYPE (ops1[0]) != type)
					  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					else
					  res = ops1[0];
					res_op0 = res;
				      }
				      tree res;
				      res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
				      if (TREE_SIDE_EFFECTS (captures[0]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				      return res;
				    }
				}
			    }
			}
		      }
		    break;
		  }
		case POINTER_PLUS_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o20, o51 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (!TYPE_SATURATING (type))
			    {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
				{
/* #line 1122 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  if (element_precision (type) <= element_precision (TREE_TYPE (captures[1])) || (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))) || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && TREE_CODE (captures[1]) == INTEGER_CST && tree_int_cst_sign_bit (captures[1]) == 0))
				    {
				      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1139, %s:%d\n", __FILE__, __LINE__);
				      tree res_op0;
				      {
					tree ops1[1], res;
					ops1[0] = captures[1];
					if (TREE_TYPE (ops1[0]) != type)
					  res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					else
					  res = ops1[0];
					res_op0 = res;
				      }
				      tree res;
				      res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
				      if (TREE_SIDE_EFFECTS (captures[0]))
					res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
				      return res;
				    }
				}
			    }
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o60))
		      {
		      case PLUS_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o60, 0);
			  tree o71 = TREE_OPERAND (o60, 1);
			  if (o70 == o30 || operand_equal_p (o70, o30, 0))
			    {
			      {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, o71 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				if (!TYPE_SATURATING (type))
				  {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				    if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
				      {
/* #line 1146 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					if (element_precision (type) <= element_precision (TREE_TYPE (captures[1])) || (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))) || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && TREE_CODE (captures[1]) == INTEGER_CST && tree_int_cst_sign_bit (captures[1]) == 0 && TREE_CODE (captures[2]) == INTEGER_CST && tree_int_cst_sign_bit (captures[2]) == 0))
					  {
					    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1165, %s:%d\n", __FILE__, __LINE__);
					    tree res_op0;
					    {
					      tree ops1[1], res;
					      ops1[0] = captures[1];
					      if (TREE_TYPE (ops1[0]) != type)
						res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					      else
					        res = ops1[0];
					      res_op0 = res;
					    }
					    tree res_op1;
					    {
					      tree ops1[1], res;
					      ops1[0] = captures[2];
					      if (TREE_TYPE (ops1[0]) != type)
						res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					      else
					        res = ops1[0];
					      res_op1 = res;
					    }
					    tree res;
					    res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
					    if (TREE_SIDE_EFFECTS (captures[0]))
					      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
					    return res;
					  }
				      }
				  }
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case POINTER_PLUS_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o60))
		      {
		      case POINTER_PLUS_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o60, 0);
			  tree o71 = TREE_OPERAND (o60, 1);
			  if (o70 == o30 || operand_equal_p (o70, o30, 0))
			    {
			      {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, o71 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				if (!TYPE_SATURATING (type))
				  {
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				    if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
				      {
/* #line 1146 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					if (element_precision (type) <= element_precision (TREE_TYPE (captures[1])) || (INTEGRAL_TYPE_P (TREE_TYPE (captures[0])) && TYPE_OVERFLOW_UNDEFINED (TREE_TYPE (captures[0]))) || (POINTER_TYPE_P (TREE_TYPE (captures[0])) && TREE_CODE (captures[1]) == INTEGER_CST && tree_int_cst_sign_bit (captures[1]) == 0 && TREE_CODE (captures[2]) == INTEGER_CST && tree_int_cst_sign_bit (captures[2]) == 0))
					  {
					    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1165, %s:%d\n", __FILE__, __LINE__);
					    tree res_op0;
					    {
					      tree ops1[1], res;
					      ops1[0] = captures[1];
					      if (TREE_TYPE (ops1[0]) != type)
						res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					      else
					        res = ops1[0];
					      res_op0 = res;
					    }
					    tree res_op1;
					    {
					      tree ops1[1], res;
					      ops1[0] = captures[2];
					      if (TREE_TYPE (ops1[0]) != type)
						res = fold_build1_loc (loc, NOP_EXPR, type, ops1[0]);
					      else
					        res = ops1[0];
					      res_op1 = res;
					    }
					    tree res;
					    res = fold_build2_loc (loc, MINUS_EXPR, type, res_op0, res_op1);
					    if (TREE_SIDE_EFFECTS (captures[0]))
					      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
					    return res;
					  }
				      }
				  }
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (integer_each_onep (op1))
	  {
	    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_52 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
if (integer_all_onesp (op0))
  {
    {
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[1] ATTRIBUTE_UNUSED = { op1 };
/* #line 984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!TYPE_SATURATING (type))
	{
/* #line 1023 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if ((!FLOAT_TYPE_P (type) || flag_associative_math) && !FIXED_POINT_TYPE_P (type))
	    {
	      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1091, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res;
	      res = fold_build1_loc (loc, BIT_NOT_EXPR, type, res_op0);
	      return res;
	    }
	}
    }
  }
if (integer_zerop (op0))
  {
    {
/* #line 1602 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[1] ATTRIBUTE_UNUSED = { op1 };
      if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1602, %s:%d\n", __FILE__, __LINE__);
      tree res_op0;
      res_op0 = captures[0];
      tree res;
      res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
      return res;
    }
  }
if (real_zerop (op0))
  {
    {
/* #line 1609 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 1609 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (fold_real_zero_addition_p (type, captures[0], 0))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1610, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[1];
	  tree res;
	  res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
	  if (TREE_SIDE_EFFECTS (captures[0]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	  return res;
	}
    }
  }
  switch (TREE_CODE (op1))
    {
    case VIEW_CONVERT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case VEC_COND_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      tree o42 = TREE_OPERAND (o30, 2);
	      if (integer_each_onep (o41))
		{
		  if (integer_zerop (o42))
		    {
		      {
/* #line 1760 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[5] ATTRIBUTE_UNUSED = { op0, o30, o40, o41, o42 };
			tree res = generic_simplify_147 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case VEC_COND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	tree o32 = TREE_OPERAND (op1, 2);
	if (integer_each_onep (o31))
	  {
	    if (integer_zerop (o32))
	      {
		{
/* #line 1760 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o31, o32 };
		  tree res = generic_simplify_147 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_BIT_IOR_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op1))
    {
      {
/* #line 83 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:83, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = non_lvalue_loc (loc, res_op0);
	return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    switch (TREE_CODE (o60))
		      {
		      case BIT_NOT_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o60, 0);
			  if (o70 == o20 || operand_equal_p (o70, o20, 0))
			    {
			      if (o61 == o40 || operand_equal_p (o61, o40, 0))
				{
				  {
/* #line 488 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				    tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
				    tree res = generic_simplify_94 (loc, type, op0, op1, captures);
				    if (res) return res;
				  }
			        }
			    }
		          break;
		        }
		      default:;
		      }
		    if (o60 == o40 || operand_equal_p (o60, o40, 0))
		      {
			switch (TREE_CODE (o61))
			  {
			  case BIT_NOT_EXPR:
			    {
			      tree o80 = TREE_OPERAND (o61, 0);
			      if (o80 == o20 || operand_equal_p (o80, o20, 0))
				{
				  {
/* #line 488 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				    tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
				    tree res = generic_simplify_94 (loc, type, op0, op1, captures);
				    if (res) return res;
				  }
			        }
			      break;
			    }
		          default:;
		          }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    switch (TREE_CODE (o60))
		      {
		      case BIT_NOT_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o60, 0);
			  if (o70 == o21 || operand_equal_p (o70, o21, 0))
			    {
			      if (o61 == o30 || operand_equal_p (o61, o30, 0))
				{
				  {
/* #line 488 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				    tree captures[2] ATTRIBUTE_UNUSED = { o21, o30 };
				    tree res = generic_simplify_94 (loc, type, op0, op1, captures);
				    if (res) return res;
				  }
			        }
			    }
		          break;
		        }
		      default:;
		      }
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			switch (TREE_CODE (o61))
			  {
			  case BIT_NOT_EXPR:
			    {
			      tree o80 = TREE_OPERAND (o61, 0);
			      if (o80 == o21 || operand_equal_p (o80, o21, 0))
				{
				  {
/* #line 488 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				    tree captures[2] ATTRIBUTE_UNUSED = { o21, o30 };
				    tree res = generic_simplify_94 (loc, type, op0, op1, captures);
				    if (res) return res;
				  }
			        }
			      break;
			    }
		          default:;
		          }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    tree o51 = TREE_OPERAND (op1, 1);
		    switch (TREE_CODE (o50))
		      {
		      case BIT_NOT_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  if (o60 == o20 || operand_equal_p (o60, o20, 0))
			    {
			      switch (TREE_CODE (o51))
			        {
				case INTEGER_CST:
				  {
				    {
/* #line 491 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, o51 };
/* #line 491 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (wi::bit_not (captures[1]) == captures[2])
					{
					  if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:492, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 = captures[2];
					  tree res;
					  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
					  return res;
					}
				    }
				    break;
				  }
			        default:;
			        }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case BIT_AND_EXPR:
		        {
			  tree o60 = TREE_OPERAND (op1, 0);
			  tree o61 = TREE_OPERAND (op1, 1);
			  if (o60 == o30 || operand_equal_p (o60, o30, 0))
			    {
			      switch (TREE_CODE (o61))
			        {
				case INTEGER_CST:
				  {
				    {
/* #line 491 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      tree captures[3] ATTRIBUTE_UNUSED = { o30, o61, o21 };
/* #line 491 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				      if (wi::bit_not (captures[1]) == captures[2])
					{
					  if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
					  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:492, %s:%d\n", __FILE__, __LINE__);
					  tree res_op0;
					  res_op0 = captures[0];
					  tree res_op1;
					  res_op1 = captures[2];
					  tree res;
					  res = fold_build2_loc (loc, BIT_XOR_EXPR, type, res_op0, res_op1);
					  return res;
					}
				    }
				    break;
				  }
			        default:;
			        }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (integer_all_onesp (op1))
    {
      {
/* #line 509 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:509, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
			  tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    if (o50 == o30 || operand_equal_p (o50, o30, 0))
		      {
			{
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o30 };
			  tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 543 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_110 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      if (o40 == op0 || operand_equal_p (o40, op0, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o30, o41 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o41 == op0 || operand_equal_p (o41, op0, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o30, o40 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (op1 == o30 || operand_equal_p (op1, o30, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o30, o20, o31 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (op1 == o31 || operand_equal_p (op1, o31, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o31, o20, o30 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      tree o41 = TREE_OPERAND (op1, 1);
	      if (o40 == o20 || operand_equal_p (o40, o20, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o41, op0 };
		    tree res = generic_simplify_116 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o41 == o20 || operand_equal_p (o41, o20, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o40, op0 };
		    tree res = generic_simplify_116 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o20, o50 };
		      tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		    tree res = generic_simplify_89 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, op1 };
		    tree res = generic_simplify_89 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 581 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_120 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, o51 };
		    tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, o51 };
		    tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
	      if (res) return res;
	    }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 581 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_120 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o50))
		      {
		      case BIT_NOT_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[2] ATTRIBUTE_UNUSED = { o30, o60 };
			    tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o30, o50 };
		      tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o60))
		      {
		      case BIT_AND_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o60, 0);
			  tree o71 = TREE_OPERAND (o60, 1);
			  if (o70 == o30 || operand_equal_p (o70, o30, 0))
			    {
			      {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, o71 };
				tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
				if (res) return res;
			      }
			    }
			  if (o70 == o31 || operand_equal_p (o70, o31, 0))
			    {
			      {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o31, o30, o71 };
				tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
				if (res) return res;
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_58 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	  tree res = generic_simplify_58 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_AND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      if (op1 == o30 || operand_equal_p (op1, o30, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o30, o21 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      if (op1 == o40 || operand_equal_p (op1, o40, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o40, o20 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_AND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	switch (TREE_CODE (o30))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      if (o40 == op0 || operand_equal_p (o40, op0, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o31))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (o31, 0);
	      if (o50 == op0 || operand_equal_p (o50, op0, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o51 == o21 || operand_equal_p (o51, o21, 0))
		{
		  {
/* #line 781 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, o50 };
		    tree res = generic_simplify_6 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o51 == o20 || operand_equal_p (o51, o20, 0))
		{
		  {
/* #line 781 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, o50 };
		    tree res = generic_simplify_6 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o61 == o40 || operand_equal_p (o61, o40, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o40, op1, o60 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o60 == o40 || operand_equal_p (o60, o40, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o40, op1, o61 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o61 == o30 || operand_equal_p (o61, o30, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op0, o21, o30, op1, o60 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op0, o21, o30, op1, o61 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      switch (TREE_CODE (o51))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o70 = TREE_OPERAND (o51, 0);
		    if (o70 == o21 || operand_equal_p (o70, o21, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op1, o50, o21, op0, o20 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o70 == o20 || operand_equal_p (o70, o20, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op1, o50, o20, op0, o21 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o50))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o60 = TREE_OPERAND (o50, 0);
		    if (o60 == o21 || operand_equal_p (o60, o21, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op1, o51, o21, op0, o20 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o60 == o20 || operand_equal_p (o60, o20, 0))
		      {
			{
/* #line 865 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[5] ATTRIBUTE_UNUSED = { op1, o51, o20, op0, o21 };
			  tree res = generic_simplify_29 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 792 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_10 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 891 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		      tree res = generic_simplify_159 (loc, type, op0, op1, captures, BIT_XOR_EXPR, BIT_IOR_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case UNORDERED_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (o21 == o20 || operand_equal_p (o21, o20, 0))
	  {
	    switch (TREE_CODE (op1))
	      {
	      case UNORDERED_EXPR:
	        {
		  tree o50 = TREE_OPERAND (op1, 0);
		  tree o51 = TREE_OPERAND (op1, 1);
		  if (o51 == o50 || operand_equal_p (o51, o50, 0))
		    {
		      {
/* #line 2098 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o50 };
/* #line 2098 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (types_match (captures[0], captures[1]))
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2099, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    res_op0 = captures[0];
			    tree res_op1;
			    res_op1 = captures[1];
			    tree res;
			    res = fold_build2_loc (loc, UNORDERED_EXPR, type, res_op0, res_op1);
			    return res;
			  }
		      }
		    }
		  if (o50 == o20 || operand_equal_p (o50, o20, 0))
		    {
		      {
/* #line 2106 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, op1, o51 };
			tree res = generic_simplify_27 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
		  if (o51 == o20 || operand_equal_p (o51, o20, 0))
		    {
		      {
/* #line 2106 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, op1, o50 };
			tree res = generic_simplify_27 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	          break;
	        }
	      default:;
	      }
	  }
	switch (TREE_CODE (op1))
	  {
	  case UNORDERED_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o20 || operand_equal_p (o51, o20, 0))
		    {
		      {
/* #line 2106 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, op0, o21 };
			tree res = generic_simplify_39 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2106 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o21, op0, o20 };
			tree res = generic_simplify_39 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case GE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LT_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case GT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LE_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case GE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LE_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case NE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LE_EXPR, NE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case EQ_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LE_EXPR, NE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case GE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, GE_EXPR, NE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case GE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case NE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, GE_EXPR, NE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LT_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LE_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case GT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case LE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, LE_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case EQ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case NE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2117 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_107 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
tree op0_pops[1];
if (tree_logical_inverted_value (op0, op0_pops))
  {
    tree o20 = op0_pops[0];
    if (op1 == o20 || operand_equal_p (op1, o20, 0))
      {
	if (tree_truth_valued_p (op1))
	  {
	    {
/* #line 824 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_81 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
      }
}
if (tree_truth_valued_p (op0))
  {
    tree op1_pops[1];
    if (tree_logical_inverted_value (op1, op1_pops))
      {
	tree o30 = op1_pops[0];
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 824 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_81 (loc, type, op0, op1, captures, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
}
  }
  return NULL_TREE;
}

static tree
generic_simplify_BIT_XOR_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op1))
    {
      {
/* #line 83 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:83, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = non_lvalue_loc (loc, res_op0);
	return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
			  tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    if (o50 == o30 || operand_equal_p (o50, o30, 0))
		      {
			{
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o30 };
			  tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 522 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_104 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 527 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:527, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res =  build_zero_cst (type);
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
    }
  if (integer_all_onesp (op1))
    {
      {
/* #line 532 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:532, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = fold_build1_loc (loc, BIT_NOT_EXPR, type, res_op0);
	if (TREE_SIDE_EFFECTS (captures[1]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 568 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_117 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 581 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_120 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o50))
		      {
		      case BIT_AND_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  tree o61 = TREE_OPERAND (o50, 1);
			  switch (TREE_CODE (o61))
			    {
			    case INTEGER_CST:
			      {
				{
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o21, o50, o60, o61 };
				  tree res = generic_simplify_37 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
				  if (res) return res;
				}
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case BIT_AND_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    tree o51 = TREE_OPERAND (op1, 1);
		    switch (TREE_CODE (o51))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o50, o51 };
			    tree res = generic_simplify_37 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 568 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_117 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 573 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_118 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_5 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_5 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 573 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_118 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 581 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_120 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      CASE_CONVERT:
		        {
			  tree o60 = TREE_OPERAND (op1, 0);
			  switch (TREE_CODE (o60))
			    {
			    case BIT_AND_EXPR:
			      {
				tree o70 = TREE_OPERAND (o60, 0);
				tree o71 = TREE_OPERAND (o60, 1);
				switch (TREE_CODE (o71))
				  {
				  case INTEGER_CST:
				    {
				      {
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
					tree captures[6] ATTRIBUTE_UNUSED = { o20, o30, o31, o60, o70, o71 };
					tree res = generic_simplify_37 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
					if (res) return res;
				      }
				      break;
				    }
			          default:;
			          }
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      case BIT_AND_EXPR:
		        {
			  tree o60 = TREE_OPERAND (op1, 0);
			  tree o61 = TREE_OPERAND (op1, 1);
			  switch (TREE_CODE (o61))
			    {
			    case INTEGER_CST:
			      {
				{
/* #line 640 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  tree captures[6] ATTRIBUTE_UNUSED = { o20, o30, o31, op1, o60, o61 };
				  tree res = generic_simplify_37 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
				  if (res) return res;
				}
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			{
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o30, o31 };
			  tree res = generic_simplify_5 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o60 == o31 || operand_equal_p (o60, o31, 0))
		      {
			{
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o31, o30 };
			  tree res = generic_simplify_5 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_IOR_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    tree o51 = TREE_OPERAND (o40, 1);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o20, o51 };
			  tree res = generic_simplify_5 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    if (o51 == o20 || operand_equal_p (o51, o20, 0))
		      {
			{
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o20, o50 };
			  tree res = generic_simplify_5 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_IOR_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
	      tree res = generic_simplify_5 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 648 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_5 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o50))
		      {
		      case BIT_NOT_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  {
/* #line 654 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[2] ATTRIBUTE_UNUSED = { o30, o60 };
			    tree res = generic_simplify_32 (loc, type, op0, op1, captures);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    {
/* #line 654 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o30, o50 };
		      tree res = generic_simplify_32 (loc, type, op0, op1, captures);
		      if (res) return res;
		    }
		    break;
		  }
		case INTEGER_CST:
		  {
		    {
/* #line 661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o30, op1 };
		      tree res = generic_simplify_17 (loc, type, op0, op1, captures);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    {
/* #line 654 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o20, o50 };
		      tree res = generic_simplify_32 (loc, type, op0, op1, captures);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 654 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_32 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
	  case INTEGER_CST:
	    {
	      {
/* #line 661 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		tree res = generic_simplify_17 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 667 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_151 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 667 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_151 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_AND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 667 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o30, op0 };
	      tree res = generic_simplify_151 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 667 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o31, op0 };
	      tree res = generic_simplify_151 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_58 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	  tree res = generic_simplify_58 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
	  if (res) return res;
	}
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o51 == o21 || operand_equal_p (o51, o21, 0))
		{
		  {
/* #line 781 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, o50 };
		    tree res = generic_simplify_6 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o51 == o20 || operand_equal_p (o51, o20, 0))
		{
		  {
/* #line 781 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, o50 };
		    tree res = generic_simplify_6 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 792 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_10 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 891 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		      tree res = generic_simplify_159 (loc, type, op0, op1, captures, BIT_IOR_EXPR, BIT_XOR_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, LT_EXPR, GE_EXPR, UNGE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case LE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, LE_EXPR, GT_EXPR, UNGT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case EQ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, EQ_EXPR, NE_EXPR, NE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case NE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR, EQ_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case GE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, GE_EXPR, LT_EXPR, UNLT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case GT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, GT_EXPR, LE_EXPR, UNLE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case UNORDERED_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, UNORDERED_EXPR, ORDERED_EXPR, ORDERED_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case ORDERED_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, ORDERED_EXPR, UNORDERED_EXPR, UNORDERED_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case UNLT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, UNLT_EXPR, GE_EXPR, GE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case UNLE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, UNLE_EXPR, GT_EXPR, GT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case UNGT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, UNGT_EXPR, LE_EXPR, LE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case UNGE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, UNGE_EXPR, LT_EXPR, LT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case UNEQ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, UNEQ_EXPR, LTGT_EXPR, LTGT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case LTGT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_truep (op1))
	  {
	    {
/* #line 1814 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_150 (loc, type, op0, op1, captures, LTGT_EXPR, UNEQ_EXPR, UNEQ_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
tree op0_pops[1];
if (tree_logical_inverted_value (op0, op0_pops))
  {
    tree o20 = op0_pops[0];
    if (op1 == o20 || operand_equal_p (op1, o20, 0))
      {
	if (tree_truth_valued_p (op1))
	  {
	    {
/* #line 824 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_81 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
	      if (res) return res;
	    }
	  }
      }
}
if (tree_truth_valued_p (op0))
  {
    tree op1_pops[1];
    if (tree_logical_inverted_value (op1, op1_pops))
      {
	tree o30 = op1_pops[0];
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 824 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_81 (loc, type, op0, op1, captures, BIT_XOR_EXPR);
	      if (res) return res;
	    }
	  }
}
  }
  return NULL_TREE;
}

static tree
generic_simplify_MULT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op1))
    {
      {
/* #line 115 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:115, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
    }
  if (real_zerop (op1))
    {
      {
/* #line 123 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 123 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!HONOR_NANS (type) && !HONOR_SIGNED_ZEROS (type))
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:124, %s:%d\n", __FILE__, __LINE__);
	    tree res;
	    res = captures[1];
	    if (TREE_SIDE_EFFECTS (captures[0]))
	      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	    return res;
	  }
      }
    }
  if (real_onep (op1))
    {
      {
/* #line 130 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 130 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!HONOR_SNANS (type) && (!HONOR_SIGNED_ZEROS (type) || !COMPLEX_FLOAT_TYPE_P (type)))
	  {
	    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:133, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = non_lvalue_loc (loc, res_op0);
	    return res;
	  }
      }
    }
  if (real_minus_onep (op1))
    {
      {
/* #line 138 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 138 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!HONOR_SNANS (type) && (!HONOR_SIGNED_ZEROS (type) || !COMPLEX_FLOAT_TYPE_P (type)))
	  {
	    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:141, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
	    return res;
	  }
      }
    }
  if (integer_onep (op1))
    {
      {
/* #line 148 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_1 (loc, type, op0, op1, captures, MULT_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case TRUNC_DIV_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_pow2p (o21))
	  {
	    if (op1 == o21 || operand_equal_p (op1, o21, 0))
	      {
		{
/* #line 345 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 345 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (TYPE_UNSIGNED (TREE_TYPE (captures[0])))
		    {
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:346, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[0];
		      tree res_op1;
		      {
			tree ops1[1], res;
			ops1[0] = captures[1];
			res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
			res_op1 = res;
		      }
		      tree res;
		      res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
		      return res;
		    }
		}
	      }
	  }
        break;
      }
    case ABS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == op0 || operand_equal_p (op1, op0, 0))
	  {
	    {
/* #line 386 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:386, %s:%d\n", __FILE__, __LINE__);
	      if (! tree_invariant_p (captures[1])) return NULL_TREE;
	      tree res_op0;
	      res_op0 = unshare_expr (captures[1]);
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res;
	      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
	      return res;
	    }
	  }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_COPYSIGNF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 425 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
		  tree res = generic_simplify_74 (loc, type, op0, op1, captures, CFN_BUILT_IN_COPYSIGNF);
		  if (res) return res;
		}
	      }
	    break;
	  }
	case CFN_BUILT_IN_COPYSIGN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 425 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
		  tree res = generic_simplify_74 (loc, type, op0, op1, captures, CFN_BUILT_IN_COPYSIGN);
		  if (res) return res;
		}
	      }
	    break;
	  }
	case CFN_BUILT_IN_COPYSIGNL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 425 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
		  tree res = generic_simplify_74 (loc, type, op0, op1, captures, CFN_BUILT_IN_COPYSIGNL);
		  if (res) return res;
		}
	      }
	    break;
	  }
	case CFN_COPYSIGN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 425 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
		  tree res = generic_simplify_74 (loc, type, op0, op1, captures, CFN_COPYSIGN);
		  if (res) return res;
		}
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case LSHIFT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      if (integer_onep (o40))
		{
		  {
/* #line 443 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o40, o41 };
		    tree res = generic_simplify_138 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case LSHIFT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (integer_onep (o30))
		{
		  {
/* #line 443 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op1, o30, o31 };
		    tree res = generic_simplify_138 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case LSHIFT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (integer_onep (o30))
	  {
	    {
/* #line 443 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o30, o31 };
	      tree res = generic_simplify_138 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case LSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_onep (o20))
	  {
	    {
/* #line 443 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op1, o20, o21 };
	      tree res = generic_simplify_138 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    case RDIV_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 450 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
/* #line 450 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (flag_associative_math && single_use (captures[0]))
			{
			  {
/* #line 452 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (MULT_EXPR, type, captures[1], captures[3]);
/* #line 454 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (tem)
				{
				  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
				  if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:455, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 =  tem;
				  tree res_op1;
				  res_op1 = captures[2];
				  tree res;
				  res = fold_build2_loc (loc, RDIV_EXPR, type, res_op0, res_op1);
				  return res;
				}
			  }
			}
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    if (tree_negate_expr_p (o50))
		      {
			{
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[2] ATTRIBUTE_UNUSED = { o30, o50 };
			  tree res = generic_simplify_20 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	    if (tree_negate_expr_p (op1))
	      {
		{
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { o30, op1 };
		  tree res = generic_simplify_20 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	      }
	      break;
	    }
	  case EXACT_DIV_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (op1 == o31 || operand_equal_p (op1, o31, 0))
		{
		  {
/* #line 1582 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o30, o31 };
		    tree res = generic_simplify_22 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
      if (tree_negate_expr_p (o20))
	{
	  switch (TREE_CODE (op1))
	    {
	    CASE_CONVERT:
	      {
		tree o40 = TREE_OPERAND (op1, 0);
		switch (TREE_CODE (o40))
		  {
		  case NEGATE_EXPR:
		    {
		      tree o50 = TREE_OPERAND (o40, 0);
		      {
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o50, o20 };
			tree res = generic_simplify_20 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		      break;
		    }
	          default:;
	          }
	        break;
	      }
	    case NEGATE_EXPR:
	      {
		tree o40 = TREE_OPERAND (op1, 0);
		{
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { o40, o20 };
		  tree res = generic_simplify_20 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	        break;
	      }
	    default:;
	    }
        }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      if (tree_negate_expr_p (o40))
		{
		  {
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		    tree res = generic_simplify_20 (loc, type, op0, op1, captures);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
      if (tree_negate_expr_p (op1))
	{
	  {
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_20 (loc, type, op0, op1, captures);
	    if (res) return res;
	  }
        }
        break;
      }
    case EXACT_DIV_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 1582 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_22 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
if (tree_negate_expr_p (op0))
  {
    switch (TREE_CODE (op1))
      {
      CASE_CONVERT:
        {
	  tree o30 = TREE_OPERAND (op1, 0);
	  switch (TREE_CODE (o30))
	    {
	    case NEGATE_EXPR:
	      {
		tree o40 = TREE_OPERAND (o30, 0);
		{
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { o40, op0 };
		  tree res = generic_simplify_20 (loc, type, op0, op1, captures);
		  if (res) return res;
		}
	        break;
	      }
	    default:;
	    }
          break;
        }
      case NEGATE_EXPR:
        {
	  tree o30 = TREE_OPERAND (op1, 0);
	  {
/* #line 717 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o30, op0 };
	    tree res = generic_simplify_20 (loc, type, op0, op1, captures);
	    if (res) return res;
	  }
          break;
        }
      default:;
      }
  }
  if (integer_minus_onep (op1))
    {
      {
/* #line 1615 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1615, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
	return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
		  tree res = generic_simplify_67 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF);
		  if (res) return res;
		}
	      }
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SQRTF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SQRTF, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
		  tree res = generic_simplify_67 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT);
		  if (res) return res;
		}
	      }
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SQRT:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SQRT, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
		  tree res = generic_simplify_67 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL);
		  if (res) return res;
		}
	      }
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SQRTL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SQRTL, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    if (op1 == op0 || operand_equal_p (op1, op0, 0))
	      {
		{
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { op0, o20 };
		  tree res = generic_simplify_67 (loc, type, op0, op1, captures, CFN_SQRT);
		  if (res) return res;
		}
	      }
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_SQRT:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_SQRT, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_CBRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_CBRTF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_CBRTF, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_CBRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_CBRT:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_CBRT, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_CBRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_CBRTL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2476, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_CBRTL, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXPF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXPF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXPF, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXPL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXPL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXPL, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_EXP:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_EXP:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_EXP, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP2F:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP2F:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP2F, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP2:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP2:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP2, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP2L:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP2L:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP2L, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_EXP2:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_EXP2:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_EXP2, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP10F:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP10F:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP10F, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP10:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP10:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP10, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXP10L:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_EXP10L:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP10L, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_EXP10:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_EXP10:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_EXP10, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POW10F:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_POW10F:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_POW10F, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POW10:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_POW10:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_POW10, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POW10L:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_POW10L:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (flag_unsafe_math_optimizations)
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2482, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    {
			      tree ops1[2], res;
			      ops1[0] = captures[1];
			      ops1[1] = captures[3];
			      res = fold_build2_loc (loc, PLUS_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			      res_op0 = res;
			    }
			    tree res;
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_POW10L, type, 1, res_op0);
			    if (!res)
			      return NULL_TREE;
			    return res;
			  }
		      }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_TANF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_COSF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_BUILT_IN_TANF, CFN_BUILT_IN_COSF, CFN_BUILT_IN_SINF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_TAN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_COS:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_BUILT_IN_TAN, CFN_BUILT_IN_COS, CFN_BUILT_IN_SIN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_TANL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_COSL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_BUILT_IN_TANL, CFN_BUILT_IN_COSL, CFN_BUILT_IN_SINL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_TAN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_COS:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_TAN, CFN_COS, CFN_SIN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_COSF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_TANF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op1, o20, op0 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_BUILT_IN_TANF, CFN_BUILT_IN_COSF, CFN_BUILT_IN_SINF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_COS:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_TAN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op1, o20, op0 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_BUILT_IN_TAN, CFN_BUILT_IN_COS, CFN_BUILT_IN_SIN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_COSL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_TANL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op1, o20, op0 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_BUILT_IN_TANL, CFN_BUILT_IN_COSL, CFN_BUILT_IN_SINL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_COS:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_TAN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op1, o20, op0 };
			    tree res = generic_simplify_97 (loc, type, op0, op1, captures, CFN_TAN, CFN_COS, CFN_SIN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case CALL_EXPR:
      switch (get_call_combined_fn (op1))
        {
	case CFN_BUILT_IN_POWF:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    if (o30 == op0 || operand_equal_p (o30, op0, 0))
	      {
		switch (TREE_CODE (o31))
		  {
		  case REAL_CST:
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o31 };
			tree res = generic_simplify_149 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWF);
			if (res) return res;
		      }
		      break;
		    }
	          default:;
	          }
	      }
	    break;
	  }
	case CFN_BUILT_IN_POW:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    if (o30 == op0 || operand_equal_p (o30, op0, 0))
	      {
		switch (TREE_CODE (o31))
		  {
		  case REAL_CST:
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o31 };
			tree res = generic_simplify_149 (loc, type, op0, op1, captures, CFN_BUILT_IN_POW);
			if (res) return res;
		      }
		      break;
		    }
	          default:;
	          }
	      }
	    break;
	  }
	case CFN_BUILT_IN_POWL:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    if (o30 == op0 || operand_equal_p (o30, op0, 0))
	      {
		switch (TREE_CODE (o31))
		  {
		  case REAL_CST:
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o31 };
			tree res = generic_simplify_149 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWL);
			if (res) return res;
		      }
		      break;
		    }
	          default:;
	          }
	      }
	    break;
	  }
	case CFN_POW:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    if (o30 == op0 || operand_equal_p (o30, op0, 0))
	      {
		switch (TREE_CODE (o31))
		  {
		  case REAL_CST:
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o31 };
			tree res = generic_simplify_149 (loc, type, op0, op1, captures, CFN_POW);
			if (res) return res;
		      }
		      break;
		    }
	          default:;
	          }
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_POWF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_POWF:
		    {
		      tree o50 = CALL_EXPR_ARG (op1, 0);
		      tree o51 = CALL_EXPR_ARG (op1, 1);
		      if (o50 == o20 || operand_equal_p (o50, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
			    tree res = generic_simplify_129 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWF);
			    if (res) return res;
			  }
		        }
		      if (o51 == o21 || operand_equal_p (o51, o21, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o50 };
			    tree res = generic_simplify_164 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POW:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_POW:
		    {
		      tree o50 = CALL_EXPR_ARG (op1, 0);
		      tree o51 = CALL_EXPR_ARG (op1, 1);
		      if (o50 == o20 || operand_equal_p (o50, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
			    tree res = generic_simplify_129 (loc, type, op0, op1, captures, CFN_BUILT_IN_POW);
			    if (res) return res;
			  }
		        }
		      if (o51 == o21 || operand_equal_p (o51, o21, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o50 };
			    tree res = generic_simplify_164 (loc, type, op0, op1, captures, CFN_BUILT_IN_POW);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POWL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_POWL:
		    {
		      tree o50 = CALL_EXPR_ARG (op1, 0);
		      tree o51 = CALL_EXPR_ARG (op1, 1);
		      if (o50 == o20 || operand_equal_p (o50, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
			    tree res = generic_simplify_129 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWL);
			    if (res) return res;
			  }
		        }
		      if (o51 == o21 || operand_equal_p (o51, o21, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o50 };
			    tree res = generic_simplify_164 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_POW:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_POW:
		    {
		      tree o50 = CALL_EXPR_ARG (op1, 0);
		      tree o51 = CALL_EXPR_ARG (op1, 1);
		      if (o50 == o20 || operand_equal_p (o50, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
			    tree res = generic_simplify_129 (loc, type, op0, op1, captures, CFN_POW);
			    if (res) return res;
			  }
		        }
		      if (o51 == o21 || operand_equal_p (o51, o21, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o50 };
			    tree res = generic_simplify_164 (loc, type, op0, op1, captures, CFN_POW);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_TRUNC_DIV_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_onep (op1))
    {
      {
/* #line 148 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_1 (loc, type, op0, op1, captures, TRUNC_DIV_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 154 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_83 (loc, type, op0, op1, captures, TRUNC_DIV_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case TRUNC_DIV_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 170 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_86 (loc, type, op0, op1, captures, TRUNC_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, op1 };
			    tree res = generic_simplify_68 (loc, type, op0, op1, captures, TRUNC_DIV_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_68 (loc, type, op0, op1, captures, TRUNC_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_pow2p (o21))
	  {
	    if (op1 == o21 || operand_equal_p (op1, o21, 0))
	      {
		{
/* #line 337 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 337 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (TYPE_UNSIGNED (TREE_TYPE (captures[0])))
		    {
		      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:338, %s:%d\n", __FILE__, __LINE__);
		      tree res_op0;
		      res_op0 = captures[0];
		      tree res_op1;
		      res_op1 =  wide_int_to_tree (type, wi::mask (TYPE_PRECISION (type) - wi::exact_log2 (captures[1]), false, TYPE_PRECISION (type)));
		      tree res;
		      res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
		      return res;
		    }
		}
	      }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 352 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_55 (loc, type, op0, op1, captures, TRUNC_DIV_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_CEIL_DIV_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_onep (op1))
    {
      {
/* #line 148 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_1 (loc, type, op0, op1, captures, CEIL_DIV_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 154 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_83 (loc, type, op0, op1, captures, CEIL_DIV_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, op1 };
			    tree res = generic_simplify_68 (loc, type, op0, op1, captures, CEIL_DIV_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_68 (loc, type, op0, op1, captures, CEIL_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 352 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_55 (loc, type, op0, op1, captures, CEIL_DIV_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_FLOOR_DIV_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_onep (op1))
    {
      {
/* #line 148 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_1 (loc, type, op0, op1, captures, FLOOR_DIV_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 154 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_83 (loc, type, op0, op1, captures, FLOOR_DIV_EXPR);
	if (res) return res;
      }
    }
  {
/* #line 161 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 161 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if ((INTEGRAL_TYPE_P (type) || VECTOR_INTEGER_TYPE_P (type)) && TYPE_UNSIGNED (type))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:163, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res_op1;
	res_op1 = captures[1];
	tree res;
	res = fold_build2_loc (loc, TRUNC_DIV_EXPR, type, res_op0, res_op1);
	return res;
      }
  }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, op1 };
			    tree res = generic_simplify_68 (loc, type, op0, op1, captures, FLOOR_DIV_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_68 (loc, type, op0, op1, captures, FLOOR_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 352 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_55 (loc, type, op0, op1, captures, FLOOR_DIV_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_ROUND_DIV_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_onep (op1))
    {
      {
/* #line 148 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_1 (loc, type, op0, op1, captures, ROUND_DIV_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 154 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_83 (loc, type, op0, op1, captures, ROUND_DIV_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, op1 };
			    tree res = generic_simplify_68 (loc, type, op0, op1, captures, ROUND_DIV_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_68 (loc, type, op0, op1, captures, ROUND_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 352 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_55 (loc, type, op0, op1, captures, ROUND_DIV_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_EXACT_DIV_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_onep (op1))
    {
      {
/* #line 148 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_1 (loc, type, op0, op1, captures, EXACT_DIV_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 154 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_83 (loc, type, op0, op1, captures, EXACT_DIV_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case EXACT_DIV_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 170 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_86 (loc, type, op0, op1, captures, EXACT_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, op1 };
			    tree res = generic_simplify_68 (loc, type, op0, op1, captures, EXACT_DIV_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_68 (loc, type, op0, op1, captures, EXACT_DIV_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 352 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_55 (loc, type, op0, op1, captures, EXACT_DIV_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_RDIV_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 184 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 184 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (FLOAT_TYPE_P (type) && ! HONOR_NANS (type) && ! HONOR_INFINITIES (type))
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:187, %s:%d\n", __FILE__, __LINE__);
	    tree res;
	    res =  build_one_cst (type);
	    if (TREE_SIDE_EFFECTS (captures[0]))
	      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	    return res;
	  }
      }
    }
  switch (TREE_CODE (op1))
    {
    case NEGATE_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 193 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_66 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 193 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_66 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  if (real_onep (op1))
    {
      {
/* #line 201 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 201 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!HONOR_SNANS (type))
	  {
	    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:202, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = non_lvalue_loc (loc, res_op0);
	    return res;
	  }
      }
    }
  if (real_minus_onep (op1))
    {
      {
/* #line 207 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 207 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!HONOR_SNANS (type))
	  {
	    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:208, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = fold_build1_loc (loc, NEGATE_EXPR, type, res_op0);
	    return res;
	  }
      }
    }
  switch (TREE_CODE (op0))
    {
    case RDIV_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	{
/* #line 210 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
/* #line 210 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (flag_reciprocal_math)
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:214, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[1];
	      tree res_op1;
	      {
		tree ops1[2], res;
		ops1[0] = captures[2];
		ops1[1] = captures[3];
		res = fold_build2_loc (loc, MULT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op1 = res;
	      }
	      tree res;
	      res = fold_build2_loc (loc, RDIV_EXPR, type, res_op0, res_op1);
	      return res;
	    }
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case RDIV_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	{
/* #line 210 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o31 };
/* #line 210 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (flag_reciprocal_math)
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:219, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      {
		tree ops1[2], res;
		ops1[0] = captures[0];
		ops1[1] = captures[2];
		res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		res_op0 = res;
	      }
	      tree res_op1;
	      res_op1 = captures[3];
	      tree res;
	      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
	      return res;
	    }
	}
        break;
      }
    case REAL_CST:
      {
	{
/* #line 240 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 240 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (optimize)
	    {
/* #line 241 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_reciprocal_math && !real_zerop (captures[1]))
		{
		  {
/* #line 243 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (RDIV_EXPR, type, build_one_cst (type), captures[1]);
/* #line 245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (tem)
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:246, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  tem;
			  tree res;
			  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			  return res;
			}
		  }
		}
	      else
		{
/* #line 247 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (REAL_CST != COMPLEX_CST)
		    {
		      {
/* #line 248 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inverse = exact_inverse (type, captures[1]);
/* #line 249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (inverse)
			    {
			      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:250, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  inverse;
			      tree res;
			      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			      return res;
			    }
		      }
		    }
		}
	    }
	}
        break;
      }
    case COMPLEX_CST:
      {
	{
/* #line 240 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 240 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (optimize)
	    {
/* #line 241 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_reciprocal_math && !real_zerop (captures[1]))
		{
		  {
/* #line 243 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (RDIV_EXPR, type, build_one_cst (type), captures[1]);
/* #line 245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (tem)
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:246, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  tem;
			  tree res;
			  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			  return res;
			}
		  }
		}
	      else
		{
/* #line 247 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (COMPLEX_CST != COMPLEX_CST)
		    {
		      {
/* #line 248 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inverse = exact_inverse (type, captures[1]);
/* #line 249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (inverse)
			    {
			      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:250, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  inverse;
			      tree res;
			      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			      return res;
			    }
		      }
		    }
		}
	    }
	}
        break;
      }
    case VECTOR_CST:
      {
	{
/* #line 240 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 240 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (optimize)
	    {
/* #line 241 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_reciprocal_math && !real_zerop (captures[1]))
		{
		  {
/* #line 243 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (RDIV_EXPR, type, build_one_cst (type), captures[1]);
/* #line 245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (tem)
			{
			  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:246, %s:%d\n", __FILE__, __LINE__);
			  tree res_op0;
			  res_op0 = captures[0];
			  tree res_op1;
			  res_op1 =  tem;
			  tree res;
			  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			  return res;
			}
		  }
		}
	      else
		{
/* #line 247 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  if (VECTOR_CST != COMPLEX_CST)
		    {
		      {
/* #line 248 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree inverse = exact_inverse (type, captures[1]);
/* #line 249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  if (inverse)
			    {
			      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
			      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:250, %s:%d\n", __FILE__, __LINE__);
			      tree res_op0;
			      res_op0 = captures[0];
			      tree res_op1;
			      res_op1 =  inverse;
			      tree res;
			      res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			      return res;
			    }
		      }
		    }
		}
	    }
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case REAL_CST:
      {
	switch (TREE_CODE (op1))
	  {
	  case MULT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      tree o31 = TREE_OPERAND (op1, 1);
	      switch (TREE_CODE (o31))
	        {
		case REAL_CST:
		  {
		    {
/* #line 460 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o30, o31 };
/* #line 460 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      if (flag_reciprocal_math)
			{
			  {
/* #line 461 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
 tree tem = const_binop (RDIV_EXPR, type, captures[0], captures[2]);
/* #line 463 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      if (tem)
				{
				  if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
				  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
				  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:464, %s:%d\n", __FILE__, __LINE__);
				  tree res_op0;
				  res_op0 =  tem;
				  tree res_op1;
				  res_op1 = captures[1];
				  tree res;
				  res = fold_build2_loc (loc, RDIV_EXPR, type, res_op0, res_op1);
				  return res;
				}
			  }
			}
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case CALL_EXPR:
      switch (get_call_combined_fn (op1))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SQRTF, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SQRT, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_SQRTL, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_SQRT, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_CBRTF:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_CBRTF, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_CBRT:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_CBRT, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_CBRTL:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    switch (TREE_CODE (o30))
	      {
	      case RDIV_EXPR:
	        {
		  tree o40 = TREE_OPERAND (o30, 0);
		  tree o41 = TREE_OPERAND (o30, 1);
		  {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o30, o40, o41 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (flag_unsafe_math_optimizations)
		      {
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2488, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[1], res;
			  {
			    tree ops2[2], res;
			    ops2[0] = captures[4];
			    ops2[1] = captures[3];
			    res = fold_build2_loc (loc, RDIV_EXPR, TREE_TYPE (ops2[0]), ops2[0], ops2[1]);
			    ops1[0] = res;
			  }
			  {
			    res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_CBRTL, TREE_TYPE (ops1[0]), 1, ops1[0]);
			    if (!res)
			      return NULL_TREE;
			  }
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_EXPF:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXPF, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXPL:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXPL, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_EXP:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_EXP, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP2F:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP2F, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP2:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP2, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP2L:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP2L, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_EXP2:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_EXP2, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP10F:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP10F, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP10:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP10, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_EXP10L:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_EXP10L, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_EXP10:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_EXP10, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_POW10F:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_POW10F, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_POW10:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_POW10, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	case CFN_BUILT_IN_POW10L:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    {
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, o30 };
/* #line 2465 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (flag_unsafe_math_optimizations)
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2494, %s:%d\n", __FILE__, __LINE__);
		  tree res_op0;
		  res_op0 = captures[0];
		  tree res_op1;
		  {
		    tree ops1[1], res;
		    {
		      tree ops2[1], res;
		      ops2[0] = captures[2];
		      res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops2[0]), ops2[0]);
		      ops1[0] = res;
		    }
		    {
		      res = maybe_build_call_expr_loc (loc, CFN_BUILT_IN_POW10L, TREE_TYPE (ops1[0]), 1, ops1[0]);
		      if (!res)
		        return NULL_TREE;
		    }
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, MULT_EXPR, type, res_op0, res_op1);
		  return res;
		}
	    }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SINF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_COSF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_65 (loc, type, op0, op1, captures, CFN_BUILT_IN_SINF, CFN_BUILT_IN_COSF, CFN_BUILT_IN_TANF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  case CFN_BUILT_IN_TANF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_90 (loc, type, op0, op1, captures, CFN_BUILT_IN_SINF, CFN_BUILT_IN_TANF, CFN_BUILT_IN_COSF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SIN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_COS:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_65 (loc, type, op0, op1, captures, CFN_BUILT_IN_SIN, CFN_BUILT_IN_COS, CFN_BUILT_IN_TAN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  case CFN_BUILT_IN_TAN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_90 (loc, type, op0, op1, captures, CFN_BUILT_IN_SIN, CFN_BUILT_IN_TAN, CFN_BUILT_IN_COS);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SINL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_COSL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_65 (loc, type, op0, op1, captures, CFN_BUILT_IN_SINL, CFN_BUILT_IN_COSL, CFN_BUILT_IN_TANL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  case CFN_BUILT_IN_TANL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_90 (loc, type, op0, op1, captures, CFN_BUILT_IN_SINL, CFN_BUILT_IN_TANL, CFN_BUILT_IN_COSL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_SIN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_COS:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_65 (loc, type, op0, op1, captures, CFN_SIN, CFN_COS, CFN_TAN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  case CFN_TAN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_90 (loc, type, op0, op1, captures, CFN_SIN, CFN_TAN, CFN_COS);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_COSF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SINF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_102 (loc, type, op0, op1, captures, CFN_BUILT_IN_COSF, CFN_BUILT_IN_SINF, CFN_BUILT_IN_TANF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_COS:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SIN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_102 (loc, type, op0, op1, captures, CFN_BUILT_IN_COS, CFN_BUILT_IN_SIN, CFN_BUILT_IN_TAN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_COSL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SINL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_102 (loc, type, op0, op1, captures, CFN_BUILT_IN_COSL, CFN_BUILT_IN_SINL, CFN_BUILT_IN_TANL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_COS:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_SIN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_102 (loc, type, op0, op1, captures, CFN_COS, CFN_SIN, CFN_TAN);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_TANF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SINF:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_171 (loc, type, op0, op1, captures, CFN_BUILT_IN_TANF, CFN_BUILT_IN_SINF, CFN_BUILT_IN_COSF);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_TAN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SIN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_171 (loc, type, op0, op1, captures, CFN_BUILT_IN_TAN, CFN_BUILT_IN_SIN, CFN_BUILT_IN_COS);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_TANL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_BUILT_IN_SINL:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_171 (loc, type, op0, op1, captures, CFN_BUILT_IN_TANL, CFN_BUILT_IN_SINL, CFN_BUILT_IN_COSL);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_TAN:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case CALL_EXPR:
	        switch (get_call_combined_fn (op1))
	          {
		  case CFN_SIN:
		    {
		      tree o40 = CALL_EXPR_ARG (op1, 0);
		      if (o40 == o20 || operand_equal_p (o40, o20, 0))
			{
			  {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
			    tree res = generic_simplify_171 (loc, type, op0, op1, captures, CFN_TAN, CFN_SIN, CFN_COS);
			    if (res) return res;
			  }
		        }
		      break;
		    }
		  default:;
	          }
	        break;
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POWF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (o21))
	      {
	      case REAL_CST:
	        {
		  if (op1 == o20 || operand_equal_p (op1, o20, 0))
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
			tree res = generic_simplify_48 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWF);
			if (res) return res;
		      }
		    }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POW:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (o21))
	      {
	      case REAL_CST:
	        {
		  if (op1 == o20 || operand_equal_p (op1, o20, 0))
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
			tree res = generic_simplify_48 (loc, type, op0, op1, captures, CFN_BUILT_IN_POW);
			if (res) return res;
		      }
		    }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_POWL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (o21))
	      {
	      case REAL_CST:
	        {
		  if (op1 == o20 || operand_equal_p (op1, o20, 0))
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
			tree res = generic_simplify_48 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWL);
			if (res) return res;
		      }
		    }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_POW:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    tree o21 = CALL_EXPR_ARG (op0, 1);
	    switch (TREE_CODE (o21))
	      {
	      case REAL_CST:
	        {
		  if (op1 == o20 || operand_equal_p (op1, o20, 0))
		    {
		      {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
			tree res = generic_simplify_48 (loc, type, op0, op1, captures, CFN_POW);
			if (res) return res;
		      }
		    }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case CALL_EXPR:
      switch (get_call_combined_fn (op1))
        {
	case CFN_BUILT_IN_POWF:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o31 };
	      tree res = generic_simplify_115 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWF);
	      if (res) return res;
	    }
	    break;
	  }
	case CFN_BUILT_IN_POW:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o31 };
	      tree res = generic_simplify_115 (loc, type, op0, op1, captures, CFN_BUILT_IN_POW);
	      if (res) return res;
	    }
	    break;
	  }
	case CFN_BUILT_IN_POWL:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o31 };
	      tree res = generic_simplify_115 (loc, type, op0, op1, captures, CFN_BUILT_IN_POWL);
	      if (res) return res;
	    }
	    break;
	  }
	case CFN_POW:
	  {
	    tree o30 = CALL_EXPR_ARG (op1, 0);
	    tree o31 = CALL_EXPR_ARG (op1, 1);
	    {
/* #line 2657 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o31 };
	      tree res = generic_simplify_115 (loc, type, op0, op1, captures, CFN_POW);
	      if (res) return res;
	    }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_CEIL_MOD_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op0))
    {
      {
/* #line 259 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_122 (loc, type, op0, op1, captures, CEIL_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_onep (op1))
    {
      {
/* #line 264 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_146 (loc, type, op0, op1, captures, CEIL_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 268 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_145 (loc, type, op0, op1, captures, CEIL_MOD_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case CEIL_MOD_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 273 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
	      tree res = generic_simplify_72 (loc, type, op0, op1, captures, CEIL_MOD_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_165 (loc, type, op0, op1, captures, CEIL_MOD_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_FLOOR_MOD_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op0))
    {
      {
/* #line 259 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_122 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_onep (op1))
    {
      {
/* #line 264 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_146 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 268 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_145 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case FLOOR_MOD_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 273 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
	      tree res = generic_simplify_72 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_165 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o30_pops[1];
	if (tree_power_of_two_cand (o30, o30_pops))
	  {
	    tree o40 = o30_pops[0];
	    {
/* #line 328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o40 };
	      tree res = generic_simplify_18 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
	      if (res) return res;
	    }
}
        break;
      }
    default:;
    }
tree op1_pops[1];
if (tree_power_of_two_cand (op1, op1_pops))
  {
    tree o30 = op1_pops[0];
    {
/* #line 328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, op1, o30 };
      tree res = generic_simplify_53 (loc, type, op0, op1, captures, FLOOR_MOD_EXPR);
      if (res) return res;
    }
}
  return NULL_TREE;
}

static tree
generic_simplify_ROUND_MOD_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op0))
    {
      {
/* #line 259 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_122 (loc, type, op0, op1, captures, ROUND_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_onep (op1))
    {
      {
/* #line 264 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_146 (loc, type, op0, op1, captures, ROUND_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 268 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_145 (loc, type, op0, op1, captures, ROUND_MOD_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case ROUND_MOD_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 273 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
	      tree res = generic_simplify_72 (loc, type, op0, op1, captures, ROUND_MOD_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_165 (loc, type, op0, op1, captures, ROUND_MOD_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_TRUNC_MOD_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_zerop (op0))
    {
      {
/* #line 259 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_122 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_onep (op1))
    {
      {
/* #line 264 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_146 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
	if (res) return res;
      }
    }
  if (integer_minus_onep (op1))
    {
      {
/* #line 268 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_145 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case TRUNC_MOD_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 273 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
	      tree res = generic_simplify_72 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 277 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_165 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 285 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 285 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (TYPE_SIGN (type) == SIGNED && !TREE_OVERFLOW (captures[1]) && wi::neg_p (captures[1]) && !TYPE_OVERFLOW_TRAPS (type) && !sign_bit_p (captures[1], captures[1]))
	    {
	      if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:291, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      {
		tree ops1[1], res;
		ops1[0] = captures[1];
		res = fold_build1_loc (loc, NEGATE_EXPR, TREE_TYPE (ops1[0]), ops1[0]);
		res_op1 = res;
	      }
	      tree res;
	      res = fold_build2_loc (loc, TRUNC_MOD_EXPR, type, res_op0, res_op1);
	      return res;
	    }
	}
        break;
      }
    CASE_CONVERT:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      {
/* #line 296 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op0, o40 };
		tree res = generic_simplify_49 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      tree o30_pops[1];
      if (tree_power_of_two_cand (o30, o30_pops))
        {
	  tree o40 = o30_pops[0];
	  {
/* #line 328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o30, o40 };
	    tree res = generic_simplify_18 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
	    if (res) return res;
	  }
}
        break;
      }
    case NEGATE_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	{
/* #line 296 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	  tree res = generic_simplify_49 (loc, type, op0, op1, captures);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
tree op1_pops[1];
if (tree_power_of_two_cand (op1, op1_pops))
  {
    tree o30 = op1_pops[0];
    {
/* #line 328 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, op1, o30 };
      tree res = generic_simplify_53 (loc, type, op0, op1, captures, TRUNC_MOD_EXPR);
      if (res) return res;
    }
}
  return NULL_TREE;
}

static tree
generic_simplify_BIT_AND_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    if (o50 == o20 || operand_equal_p (o50, o20, 0))
		      {
			{
/* #line 469 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
			  tree res = generic_simplify_7 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    if (o50 == o30 || operand_equal_p (o50, o30, 0))
		      {
			{
/* #line 469 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			  tree captures[1] ATTRIBUTE_UNUSED = { o30 };
			  tree res = generic_simplify_7 (loc, type, op0, op1, captures);
			  if (res) return res;
			}
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 469 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_7 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 469 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_7 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  if (integer_zerop (op1))
    {
      {
/* #line 514 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:514, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
    }
  if (integer_all_onesp (op1))
    {
      {
/* #line 537 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:537, %s:%d\n", __FILE__, __LINE__);
	tree res_op0;
	res_op0 = captures[0];
	tree res;
	res = non_lvalue_loc (loc, res_op0);
	return res;
      }
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 543 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_110 (loc, type, op0, op1, captures, BIT_AND_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op1))
    {
    case BIT_NOT_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	switch (TREE_CODE (o30))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      tree o41 = TREE_OPERAND (o30, 1);
	      if (o40 == op0 || operand_equal_p (o40, op0, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o30, o41 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o41 == op0 || operand_equal_p (o41, op0, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { op0, o30, o40 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (op1 == o30 || operand_equal_p (op1, o30, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o30, o20, o31 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      if (op1 == o31 || operand_equal_p (op1, o31, 0))
		{
		  {
/* #line 555 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o31, o20, o30 };
		    tree res = generic_simplify_114 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      tree o41 = TREE_OPERAND (op1, 1);
	      if (o40 == o20 || operand_equal_p (o40, o20, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o41, op0 };
		    tree res = generic_simplify_116 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o41 == o20 || operand_equal_p (o41, o20, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o40, op0 };
		    tree res = generic_simplify_116 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		case BIT_IOR_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			if (o61 == o31 || operand_equal_p (o61, o31, 0))
			  {
			    {
/* #line 615 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o30, o31 };
			      tree res = generic_simplify_131 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o40))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (o40, 0);
		    {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o20, o50 };
		      tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		    tree res = generic_simplify_89 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  {
/* #line 563 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, op1 };
		    tree res = generic_simplify_89 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      switch (TREE_CODE (o50))
	        {
		case BIT_AND_EXPR:
		  {
		    tree o60 = TREE_OPERAND (o50, 0);
		    tree o61 = TREE_OPERAND (o50, 1);
		    if (o60 == o20 || operand_equal_p (o60, o20, 0))
		      {
			if (o61 == o21 || operand_equal_p (o61, o21, 0))
			  {
			    {
/* #line 615 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			      tree res = generic_simplify_131 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  switch (TREE_CODE (o51))
		    {
		    case BIT_NOT_EXPR:
		      {
			tree o70 = TREE_OPERAND (o51, 0);
			if (o70 == o20 || operand_equal_p (o70, o20, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		        break;
		      }
		    default:;
		    }
	        }
	      switch (TREE_CODE (o50))
	        {
		case BIT_NOT_EXPR:
		  {
		    tree o60 = TREE_OPERAND (o50, 0);
		    if (o60 == o20 || operand_equal_p (o60, o20, 0))
		      {
			if (o51 == o21 || operand_equal_p (o51, o21, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    if (o60 == o21 || operand_equal_p (o60, o21, 0))
		      {
			if (o51 == o20 || operand_equal_p (o51, o20, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  switch (TREE_CODE (o51))
		    {
		    case BIT_NOT_EXPR:
		      {
			tree o70 = TREE_OPERAND (o51, 0);
			if (o70 == o21 || operand_equal_p (o70, o21, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		        break;
		      }
		    default:;
		    }
	        }
	      break;
	    }
	  case BIT_IOR_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, o51 };
		    tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, o51 };
		    tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_IOR_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o40 || operand_equal_p (o60, o40, 0))
		      {
			if (o61 == o20 || operand_equal_p (o61, o20, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o40, o20 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_IOR_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o30 || operand_equal_p (o60, o30, 0))
		      {
			if (o61 == o21 || operand_equal_p (o61, o21, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o30, o21 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_IOR_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o20 || operand_equal_p (o60, o20, 0))
		      {
			if (o61 == o40 || operand_equal_p (o61, o40, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o40, o20 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		case BIT_IOR_EXPR:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    tree o61 = TREE_OPERAND (op1, 1);
		    if (o60 == o21 || operand_equal_p (o60, o21, 0))
		      {
			if (o61 == o30 || operand_equal_p (o61, o30, 0))
			  {
			    {
/* #line 620 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			      tree captures[2] ATTRIBUTE_UNUSED = { o30, o21 };
			      tree res = generic_simplify_135 (loc, type, op0, op1, captures);
			      if (res) return res;
			    }
			  }
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o50))
		      {
		      case BIT_NOT_EXPR:
		        {
			  tree o60 = TREE_OPERAND (o50, 0);
			  {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[2] ATTRIBUTE_UNUSED = { o30, o60 };
			    tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case BIT_NOT_EXPR:
		  {
		    tree o50 = TREE_OPERAND (op1, 0);
		    {
/* #line 628 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[2] ATTRIBUTE_UNUSED = { o30, o50 };
		      tree res = generic_simplify_34 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o60 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o60))
		      {
		      case BIT_IOR_EXPR:
		        {
			  tree o70 = TREE_OPERAND (o60, 0);
			  tree o71 = TREE_OPERAND (o60, 1);
			  if (o70 == o30 || operand_equal_p (o70, o30, 0))
			    {
			      {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o30, o31, o71 };
				tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
				if (res) return res;
			      }
			    }
			  if (o70 == o31 || operand_equal_p (o70, o31, 0))
			    {
			      {
/* #line 679 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				tree captures[3] ATTRIBUTE_UNUSED = { o31, o30, o71 };
				tree res = generic_simplify_54 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
				if (res) return res;
			      }
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_58 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	  tree res = generic_simplify_58 (loc, type, op0, op1, captures, BIT_AND_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_IOR_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 770 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_136 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      if (op1 == o30 || operand_equal_p (op1, o30, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o30, o21 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o21, 0);
	      if (op1 == o40 || operand_equal_p (op1, o40, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o40, o20 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_IOR_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	switch (TREE_CODE (o30))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (o30, 0);
	      if (o40 == op0 || operand_equal_p (o40, op0, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o31))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (o31, 0);
	      if (o50 == op0 || operand_equal_p (o50, op0, 0))
		{
		  {
/* #line 775 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
		    tree res = generic_simplify_4 (loc, type, op0, op1, captures, BIT_AND_EXPR, BIT_IOR_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o51 == o21 || operand_equal_p (o51, o21, 0))
		{
		  {
/* #line 781 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, o50 };
		    tree res = generic_simplify_6 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      if (o51 == o20 || operand_equal_p (o51, o20, 0))
		{
		  {
/* #line 781 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[3] ATTRIBUTE_UNUSED = { o21, o20, o50 };
		    tree res = generic_simplify_6 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 792 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  tree res = generic_simplify_10 (loc, type, op0, op1, captures, BIT_AND_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (CONSTANT_CLASS_P (o21))
	  {
	    if (CONSTANT_CLASS_P (op1))
	      {
		{
/* #line 786 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:786, %s:%d\n", __FILE__, __LINE__);
		  if (! tree_invariant_p (captures[2])) return NULL_TREE;
		  tree res_op0;
		  {
		    tree ops1[2], res;
		    ops1[0] = captures[0];
		    ops1[1] = unshare_expr (captures[2]);
		    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		    res_op0 = res;
		  }
		  tree res_op1;
		  {
		    tree ops1[2], res;
		    ops1[0] = captures[1];
		    ops1[1] = captures[2];
		    res = fold_build2_loc (loc, BIT_AND_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
		    res_op1 = res;
		  }
		  tree res;
		  res = fold_build2_loc (loc, BIT_IOR_EXPR, type, res_op0, res_op1);
		  return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  tree op1_pops[1];
  if (tree_logical_inverted_value (op1, op1_pops))
    {
      tree o30 = op1_pops[0];
      if (o30 == op0 || operand_equal_p (o30, op0, 0))
	{
	  {
/* #line 819 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	    tree res = generic_simplify_153 (loc, type, op0, op1, captures);
	    if (res) return res;
	  }
        }
}
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 971 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		tree res = generic_simplify_166 (loc, type, op0, op1, captures);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
tree op0_pops[1];
if (tree_logical_inverted_value (op0, op0_pops))
  {
    tree o20 = op0_pops[0];
    if (op1 == o20 || operand_equal_p (op1, o20, 0))
      {
	{
/* #line 819 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	  tree res = generic_simplify_153 (loc, type, op0, op1, captures);
	  if (res) return res;
	}
      }
}
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 971 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_166 (loc, type, op0, op1, captures);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case LSHIFT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o30))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (o30, 0);
		    switch (TREE_CODE (o31))
		      {
		      case INTEGER_CST:
		        {
			  switch (TREE_CODE (op1))
			    {
			    case INTEGER_CST:
			      {
				{
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o30, o40, o31, op1 };
				  tree res = generic_simplify_75 (loc, type, op0, op1, captures, LSHIFT_EXPR);
				  if (res) return res;
				}
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o30, o30, o31, op1 };
			    tree res = generic_simplify_51 (loc, type, op0, op1, captures, LSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case RSHIFT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o30))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (o30, 0);
		    switch (TREE_CODE (o31))
		      {
		      case INTEGER_CST:
		        {
			  switch (TREE_CODE (op1))
			    {
			    case INTEGER_CST:
			      {
				{
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
				  tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o30, o40, o31, op1 };
				  tree res = generic_simplify_75 (loc, type, op0, op1, captures, RSHIFT_EXPR);
				  if (res) return res;
				}
			        break;
			      }
			    default:;
			    }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o30, o30, o31, op1 };
			    tree res = generic_simplify_51 (loc, type, op0, op1, captures, RSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, op0, o20, o30, o21, op1 };
			    tree res = generic_simplify_33 (loc, type, op0, op1, captures, LSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[6] ATTRIBUTE_UNUSED = { op0, op0, o20, o20, o21, op1 };
		      tree res = generic_simplify_62 (loc, type, op0, op1, captures, LSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case RSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, op0, o20, o30, o21, op1 };
			    tree res = generic_simplify_33 (loc, type, op0, op1, captures, RSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1318 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[6] ATTRIBUTE_UNUSED = { op0, op0, o20, o20, o21, op1 };
		      tree res = generic_simplify_62 (loc, type, op0, op1, captures, RSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case ORDERED_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (o21 == o20 || operand_equal_p (o21, o20, 0))
	  {
	    switch (TREE_CODE (op1))
	      {
	      case ORDERED_EXPR:
	        {
		  tree o50 = TREE_OPERAND (op1, 0);
		  tree o51 = TREE_OPERAND (op1, 1);
		  if (o51 == o50 || operand_equal_p (o51, o50, 0))
		    {
		      {
/* #line 2102 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o50 };
/* #line 2102 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			if (types_match (captures[0], captures[1]))
			  {
			    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2103, %s:%d\n", __FILE__, __LINE__);
			    tree res_op0;
			    res_op0 = captures[0];
			    tree res_op1;
			    res_op1 = captures[1];
			    tree res;
			    res = fold_build2_loc (loc, ORDERED_EXPR, type, res_op0, res_op1);
			    return res;
			  }
		      }
		    }
		  if (o50 == o20 || operand_equal_p (o50, o20, 0))
		    {
		      {
/* #line 2109 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, op1, o51 };
			tree res = generic_simplify_80 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
		  if (o51 == o20 || operand_equal_p (o51, o20, 0))
		    {
		      {
/* #line 2109 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, op1, o50 };
			tree res = generic_simplify_80 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	          break;
	        }
	      default:;
	      }
	  }
	switch (TREE_CODE (op1))
	  {
	  case ORDERED_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o20 || operand_equal_p (o51, o20, 0))
		    {
		      {
/* #line 2109 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, op0, o21 };
			tree res = generic_simplify_158 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      if (o50 == o21 || operand_equal_p (o50, o21, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2109 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o21, op0, o20 };
			tree res = generic_simplify_158 (loc, type, op0, op1, captures);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case GE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LT_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case GT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LT_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case EQ_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LT_EXPR, EQ_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 3031 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
		    tree res = generic_simplify_31 (loc, type, op0, op1, captures, LT_EXPR, MIN_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case GT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LE_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 3031 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
		    tree res = generic_simplify_31 (loc, type, op0, op1, captures, LE_EXPR, MIN_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case EQ_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case EQ_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case GT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, EQ_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LT_EXPR, EQ_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case NE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case GE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case LT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LT_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case GE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 3031 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
		    tree res = generic_simplify_31 (loc, type, op0, op1, captures, GE_EXPR, MAX_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case GT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (op1))
	  {
	  case LT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LT_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case LE_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, LE_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case EQ_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  if (o51 == o21 || operand_equal_p (o51, o21, 0))
		    {
		      {
/* #line 2125 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
			tree res = generic_simplify_163 (loc, type, op0, op1, captures, EQ_EXPR, GT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
	  case GT_EXPR:
	    {
	      tree o50 = TREE_OPERAND (op1, 0);
	      tree o51 = TREE_OPERAND (op1, 1);
	      if (o50 == o20 || operand_equal_p (o50, o20, 0))
		{
		  {
/* #line 3031 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o21, op1, o51 };
		    tree res = generic_simplify_31 (loc, type, op0, op1, captures, GT_EXPR, MAX_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (o21, 0);
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 2998 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o30, o21, o50, op1 };
			    tree res = generic_simplify_13 (loc, type, op0, op1, captures, MINUS_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      switch (TREE_CODE (o21))
	        {
		CASE_CONVERT:
		  {
		    tree o50 = TREE_OPERAND (o21, 0);
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 2998 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[6] ATTRIBUTE_UNUSED = { op0, o20, o30, o21, o50, op1 };
			    tree res = generic_simplify_13 (loc, type, op0, op1, captures, PLUS_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_LT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case TRUNC_MOD_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 498 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_100 (loc, type, op0, op1, captures, LT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 1782 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_108 (loc, type, op0, op1, captures, LT_EXPR, LE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (integer_zerop (op1))
		{
		  {
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		    tree res = generic_simplify_8 (loc, type, op0, op1, captures, LT_EXPR, GT_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1864 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_69 (loc, type, op0, op1, captures, LT_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_11 (loc, type, op0, op1, captures, LT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	    tree res = generic_simplify_127 (loc, type, op0, op1, captures, LT_EXPR, GT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
		tree res = generic_simplify_14 (loc, type, op0, op1, captures, LT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	  tree res = generic_simplify_14 (loc, type, op0, op1, captures, LT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_143 (loc, type, op0, op1, captures, LT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, PLUS_EXPR, LT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, MINUS_EXPR, LT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_169 (loc, type, op0, op1, captures, LT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, LT_EXPR, GT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, LT_EXPR, GT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_111 (loc, type, op0, op1, captures, LT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, op1 };
	  tree res = generic_simplify_172 (loc, type, op0, op1, captures, LT_EXPR);
	  if (res) return res;
	}
	switch (TREE_CODE (o20))
	  {
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o40))
		      {
		      case ADDR_EXPR:
		        {
			  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
			    tree res = generic_simplify_157 (loc, type, op0, op1, captures, LT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		      tree res = generic_simplify_157 (loc, type, op0, op1, captures, LT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		tree res = generic_simplify_128 (loc, type, op0, op1, captures, LT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o30))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o30 };
		      tree res = generic_simplify_40 (loc, type, op0, op1, captures, LT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
		tree res = generic_simplify_40 (loc, type, op0, op1, captures, LT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF, LT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT, LT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL, LT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_SQRT, LT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
	  tree res = generic_simplify_26 (loc, type, op0, op1, captures, LT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_GE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case TRUNC_MOD_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 498 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_100 (loc, type, op0, op1, captures, GE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 1782 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_108 (loc, type, op0, op1, captures, GE_EXPR, GT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (integer_zerop (op1))
		{
		  {
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		    tree res = generic_simplify_8 (loc, type, op0, op1, captures, GE_EXPR, LE_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1856 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_154 (loc, type, op0, op1, captures, GE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_11 (loc, type, op0, op1, captures, GE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	    tree res = generic_simplify_127 (loc, type, op0, op1, captures, GE_EXPR, LE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
		tree res = generic_simplify_14 (loc, type, op0, op1, captures, GE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	  tree res = generic_simplify_14 (loc, type, op0, op1, captures, GE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_143 (loc, type, op0, op1, captures, GE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, PLUS_EXPR, GE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, MINUS_EXPR, GE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_169 (loc, type, op0, op1, captures, GE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, GE_EXPR, LE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, GE_EXPR, LE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_111 (loc, type, op0, op1, captures, GE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, op1 };
	  tree res = generic_simplify_172 (loc, type, op0, op1, captures, GE_EXPR);
	  if (res) return res;
	}
	switch (TREE_CODE (o20))
	  {
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o40))
		      {
		      case ADDR_EXPR:
		        {
			  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
			    tree res = generic_simplify_157 (loc, type, op0, op1, captures, GE_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		      tree res = generic_simplify_157 (loc, type, op0, op1, captures, GE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		tree res = generic_simplify_128 (loc, type, op0, op1, captures, GE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o30))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o30 };
		      tree res = generic_simplify_40 (loc, type, op0, op1, captures, GE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
		tree res = generic_simplify_40 (loc, type, op0, op1, captures, GE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF, GE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT, GE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL, GE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_SQRT, GE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
	  tree res = generic_simplify_26 (loc, type, op0, op1, captures, GE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_GT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op1))
    {
    case TRUNC_MOD_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 503 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_44 (loc, type, op0, op1, captures, GT_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case INTEGER_CST:
      {
	{
/* #line 1776 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_148 (loc, type, op0, op1, captures, GT_EXPR, GE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (integer_zerop (op1))
		{
		  {
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		    tree res = generic_simplify_8 (loc, type, op0, op1, captures, GT_EXPR, LT_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1864 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_69 (loc, type, op0, op1, captures, GT_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_11 (loc, type, op0, op1, captures, GT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	    tree res = generic_simplify_127 (loc, type, op0, op1, captures, GT_EXPR, LT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
		tree res = generic_simplify_14 (loc, type, op0, op1, captures, GT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	  tree res = generic_simplify_14 (loc, type, op0, op1, captures, GT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_143 (loc, type, op0, op1, captures, GT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, PLUS_EXPR, GT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, MINUS_EXPR, GT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_169 (loc, type, op0, op1, captures, GT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, GT_EXPR, LT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, GT_EXPR, LT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_111 (loc, type, op0, op1, captures, GT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, op1 };
	  tree res = generic_simplify_172 (loc, type, op0, op1, captures, GT_EXPR);
	  if (res) return res;
	}
	switch (TREE_CODE (o20))
	  {
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o40))
		      {
		      case ADDR_EXPR:
		        {
			  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
			    tree res = generic_simplify_157 (loc, type, op0, op1, captures, GT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		      tree res = generic_simplify_157 (loc, type, op0, op1, captures, GT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		tree res = generic_simplify_128 (loc, type, op0, op1, captures, GT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o30))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o30 };
		      tree res = generic_simplify_40 (loc, type, op0, op1, captures, GT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
		tree res = generic_simplify_40 (loc, type, op0, op1, captures, GT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF, GT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT, GT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL, GT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_SQRT, GT_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
	  tree res = generic_simplify_26 (loc, type, op0, op1, captures, GT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_LE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op1))
    {
    case TRUNC_MOD_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 503 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_44 (loc, type, op0, op1, captures, LE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case INTEGER_CST:
      {
	{
/* #line 1776 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_148 (loc, type, op0, op1, captures, LE_EXPR, LT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (integer_zerop (op1))
		{
		  {
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		    tree res = generic_simplify_8 (loc, type, op0, op1, captures, LE_EXPR, GE_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1856 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_154 (loc, type, op0, op1, captures, LE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_11 (loc, type, op0, op1, captures, LE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	    tree res = generic_simplify_127 (loc, type, op0, op1, captures, LE_EXPR, GE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
		tree res = generic_simplify_14 (loc, type, op0, op1, captures, LE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	  tree res = generic_simplify_14 (loc, type, op0, op1, captures, LE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_143 (loc, type, op0, op1, captures, LE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, PLUS_EXPR, LE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, MINUS_EXPR, LE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_169 (loc, type, op0, op1, captures, LE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, LE_EXPR, GE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, LE_EXPR, GE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_111 (loc, type, op0, op1, captures, LE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, op1 };
	  tree res = generic_simplify_172 (loc, type, op0, op1, captures, LE_EXPR);
	  if (res) return res;
	}
	switch (TREE_CODE (o20))
	  {
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o40))
		      {
		      case ADDR_EXPR:
		        {
			  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
			    tree res = generic_simplify_157 (loc, type, op0, op1, captures, LE_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		      tree res = generic_simplify_157 (loc, type, op0, op1, captures, LE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (op1))
	  {
	  case INTEGER_CST:
	    {
	      {
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		tree res = generic_simplify_128 (loc, type, op0, op1, captures, LE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o30))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o30 };
		      tree res = generic_simplify_40 (loc, type, op0, op1, captures, LE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
		tree res = generic_simplify_40 (loc, type, op0, op1, captures, LE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF, LE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT, LE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL, LE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_SQRT, LE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case INTEGER_CST:
      {
	{
/* #line 2357 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
	  tree res = generic_simplify_26 (loc, type, op0, op1, captures, LE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_EQ_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case LSHIFT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (integer_onep (o30))
		{
		  if (integer_onep (o21))
		    {
		      if (integer_zerop (op1))
			{
			  {
/* #line 1294 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[1] ATTRIBUTE_UNUSED = { o31 };
			    tree res = generic_simplify_155 (loc, type, op0, op1, captures, EQ_EXPR, NE_EXPR);
			    if (res) return res;
			  }
		        }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1302 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_73 (loc, type, op0, op1, captures, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_zerop (op1))
	  {
	    {
/* #line 1829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
	      tree res = generic_simplify_113 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (integer_zerop (op1))
		{
		  {
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		    tree res = generic_simplify_8 (loc, type, op0, op1, captures, EQ_EXPR, EQ_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
tree op0_pops[1];
if (tree_logical_inverted_value (op0, op0_pops))
  {
    tree o20 = op0_pops[0];
    if (op1 == o20 || operand_equal_p (op1, o20, 0))
      {
	if (tree_truth_valued_p (op1))
	  {
	    {
/* #line 829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_24 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
      }
}
if (tree_truth_valued_p (op0))
  {
    tree op1_pops[1];
    if (tree_logical_inverted_value (op1, op1_pops))
      {
	tree o30 = op1_pops[0];
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_24 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
}
  }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1856 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_154 (loc, type, op0, op1, captures, EQ_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_11 (loc, type, op0, op1, captures, EQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	    tree res = generic_simplify_127 (loc, type, op0, op1, captures, EQ_EXPR, EQ_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
		tree res = generic_simplify_14 (loc, type, op0, op1, captures, EQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	  tree res = generic_simplify_14 (loc, type, op0, op1, captures, EQ_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_143 (loc, type, op0, op1, captures, EQ_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, PLUS_EXPR, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, MINUS_EXPR, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_169 (loc, type, op0, op1, captures, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, EQ_EXPR, EQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, EQ_EXPR, EQ_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    case ABS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (zerop (op1))
	  {
	    {
/* #line 2151 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	      tree res = generic_simplify_109 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_111 (loc, type, op0, op1, captures, EQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, op1 };
	  tree res = generic_simplify_172 (loc, type, op0, op1, captures, EQ_EXPR);
	  if (res) return res;
	}
	switch (TREE_CODE (o20))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 2232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[4] ATTRIBUTE_UNUSED = { op0, o30, o31, op1 };
			    tree res = generic_simplify_12 (loc, type, op0, op1, captures, EQ_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  case SSA_NAME:
	    {
	      {
/* #line 2216 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
		tree res = generic_simplify_9 (loc, type, op0, op1, captures, EQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 2232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		      tree res = generic_simplify_12 (loc, type, op0, op1, captures, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_zerop (op1))
	  {
	    {
/* #line 2239 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_161 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF, EQ_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT, EQ_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL, EQ_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_SQRT, EQ_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_XOR_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, EQ_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_XOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 2250 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[4] ATTRIBUTE_UNUSED = { op0, o30, o31, op1 };
			    tree res = generic_simplify_45 (loc, type, op0, op1, captures, EQ_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o40))
		      {
		      case ADDR_EXPR:
		        {
			  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
			    tree res = generic_simplify_157 (loc, type, op0, op1, captures, EQ_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		      tree res = generic_simplify_157 (loc, type, op0, op1, captures, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	    if (integer_zerop (op1))
	      {
		{
/* #line 2255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
		  tree res = generic_simplify_160 (loc, type, op0, op1, captures, EQ_EXPR);
		  if (res) return res;
		}
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 2250 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		      tree res = generic_simplify_45 (loc, type, op0, op1, captures, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o30))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o30 };
		      tree res = generic_simplify_40 (loc, type, op0, op1, captures, EQ_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
		tree res = generic_simplify_40 (loc, type, op0, op1, captures, EQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (integer_zerop (op1))
	{
	  {
/* #line 2255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	    tree res = generic_simplify_160 (loc, type, op0, op1, captures, EQ_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_pow2p (o21))
	  {
	    if (op1 == o21 || operand_equal_p (op1, o21, 0))
	      {
		{
/* #line 2264 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
		  tree res = generic_simplify_173 (loc, type, op0, op1, captures, EQ_EXPR, NE_EXPR);
		  if (res) return res;
		}
	      }
	  }
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      if (integer_pow2p (o21))
		{
		  if (integer_zerop (op1))
		    {
		      {
/* #line 2272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, o30, o21 };
			tree res = generic_simplify_15 (loc, type, op0, op1, captures, EQ_EXPR, GE_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
	if (integer_pow2p (o21))
	  {
	    if (integer_zerop (op1))
	      {
		{
/* #line 2272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o20, o21 };
		  tree res = generic_simplify_60 (loc, type, op0, op1, captures, EQ_EXPR, GE_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  if (integer_onep (op1))
    {
      {
/* #line 2435 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 2435 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (TREE_CODE (TREE_TYPE (captures[0])) == BOOLEAN_TYPE && types_match (type, TREE_TYPE (captures[0])))
	  {
	    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2437, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = non_lvalue_loc (loc, res_op0);
	    return res;
	  }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_NE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case LSHIFT_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      if (integer_onep (o30))
		{
		  if (integer_onep (o21))
		    {
		      if (integer_zerop (op1))
			{
			  {
/* #line 1294 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[1] ATTRIBUTE_UNUSED = { o31 };
			    tree res = generic_simplify_155 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR);
			    if (res) return res;
			  }
		        }
		    }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case LSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o20))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1302 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_73 (loc, type, op0, op1, captures, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_zerop (op1))
	  {
	    {
/* #line 1829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
	      tree res = generic_simplify_113 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case MULT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (integer_zerop (op1))
		{
		  {
/* #line 1841 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		    tree res = generic_simplify_8 (loc, type, op0, op1, captures, NE_EXPR, NE_EXPR);
		    if (res) return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
tree op0_pops[1];
if (tree_logical_inverted_value (op0, op0_pops))
  {
    tree o20 = op0_pops[0];
    if (op1 == o20 || operand_equal_p (op1, o20, 0))
      {
	if (tree_truth_valued_p (op1))
	  {
	    {
/* #line 829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { o20 };
	      tree res = generic_simplify_24 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
      }
}
if (tree_truth_valued_p (op0))
  {
    tree op1_pops[1];
    if (tree_logical_inverted_value (op1, op1_pops))
      {
	tree o30 = op1_pops[0];
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 829 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	      tree res = generic_simplify_24 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
}
  }
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1864 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_69 (loc, type, op0, op1, captures, NE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case BIT_NOT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case BIT_NOT_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1881 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_11 (loc, type, op0, op1, captures, NE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 1889 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	    tree res = generic_simplify_127 (loc, type, op0, op1, captures, NE_EXPR, NE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
		tree res = generic_simplify_14 (loc, type, op0, op1, captures, NE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 1897 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
	  tree res = generic_simplify_14 (loc, type, op0, op1, captures, NE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 1927 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_143 (loc, type, op0, op1, captures, NE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case PLUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, PLUS_EXPR, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case MINUS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 1984 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_167 (loc, type, op0, op1, captures, MINUS_EXPR, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
	switch (TREE_CODE (o20))
	  {
	  case REAL_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case REAL_CST:
		  {
		    {
/* #line 2000 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_169 (loc, type, op0, op1, captures, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, NE_EXPR, NE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, NE_EXPR, NE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    case ABS_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	if (zerop (op1))
	  {
	    {
/* #line 2151 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	      tree res = generic_simplify_109 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, o40 };
		tree res = generic_simplify_111 (loc, type, op0, op1, captures, NE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
	{
/* #line 2157 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, op1, op1 };
	  tree res = generic_simplify_172 (loc, type, op0, op1, captures, NE_EXPR);
	  if (res) return res;
	}
	switch (TREE_CODE (o20))
	  {
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 2232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[4] ATTRIBUTE_UNUSED = { op0, o30, o31, op1 };
			    tree res = generic_simplify_12 (loc, type, op0, op1, captures, NE_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  case SSA_NAME:
	    {
	      {
/* #line 2216 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
		tree res = generic_simplify_9 (loc, type, op0, op1, captures, NE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 2232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		      tree res = generic_simplify_12 (loc, type, op0, op1, captures, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_zerop (op1))
	  {
	    {
/* #line 2239 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_161 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    case CALL_EXPR:
      switch (get_call_combined_fn (op0))
        {
	case CFN_BUILT_IN_SQRTF:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTF, NE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRT, NE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_BUILT_IN_SQRTL:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_BUILT_IN_SQRTL, NE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	case CFN_SQRT:
	  {
	    tree o20 = CALL_EXPR_ARG (op0, 0);
	    switch (TREE_CODE (op1))
	      {
	      case REAL_CST:
	        {
		  {
/* #line 2008 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
		    tree res = generic_simplify_170 (loc, type, op0, op1, captures, CFN_SQRT, NE_EXPR);
		    if (res) return res;
		  }
	          break;
	        }
	      default:;
	      }
	    break;
	  }
	default:;
        }
      break;
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case BIT_XOR_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o31 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 2245 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { op0, o30 };
	      tree res = generic_simplify_19 (loc, type, op0, op1, captures, NE_EXPR);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_XOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 2250 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[4] ATTRIBUTE_UNUSED = { op0, o30, o31, op1 };
			    tree res = generic_simplify_45 (loc, type, op0, op1, captures, NE_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      switch (TREE_CODE (op1))
	        {
		CASE_CONVERT:
		  {
		    tree o40 = TREE_OPERAND (op1, 0);
		    switch (TREE_CODE (o40))
		      {
		      case ADDR_EXPR:
		        {
			  {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o40 };
			    tree res = generic_simplify_157 (loc, type, op0, op1, captures, NE_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, op1 };
		      tree res = generic_simplify_157 (loc, type, op0, op1, captures, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	    if (integer_zerop (op1))
	      {
		{
/* #line 2255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[1] ATTRIBUTE_UNUSED = { o20 };
		  tree res = generic_simplify_160 (loc, type, op0, op1, captures, NE_EXPR);
		  if (res) return res;
		}
	      }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 2250 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[4] ATTRIBUTE_UNUSED = { op0, o20, o21, op1 };
		      tree res = generic_simplify_45 (loc, type, op0, op1, captures, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case ADDR_EXPR:
      {
	switch (TREE_CODE (op1))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (op1, 0);
	      switch (TREE_CODE (o30))
	        {
		case ADDR_EXPR:
		  {
		    {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, o30 };
		      tree res = generic_simplify_40 (loc, type, op0, op1, captures, NE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case ADDR_EXPR:
	    {
	      {
/* #line 2287 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[3] ATTRIBUTE_UNUSED = { op0, op0, op1 };
		tree res = generic_simplify_40 (loc, type, op0, op1, captures, NE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (integer_zerop (op1))
	{
	  {
/* #line 2255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	    tree res = generic_simplify_160 (loc, type, op0, op1, captures, NE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (integer_pow2p (o21))
	  {
	    if (op1 == o21 || operand_equal_p (op1, o21, 0))
	      {
		{
/* #line 2264 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { op0, o20, o21 };
		  tree res = generic_simplify_173 (loc, type, op0, op1, captures, NE_EXPR, EQ_EXPR);
		  if (res) return res;
		}
	      }
	  }
	switch (TREE_CODE (o20))
	  {
	  CASE_CONVERT:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      if (integer_pow2p (o21))
		{
		  if (integer_zerop (op1))
		    {
		      {
/* #line 2272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			tree captures[3] ATTRIBUTE_UNUSED = { o20, o30, o21 };
			tree res = generic_simplify_15 (loc, type, op0, op1, captures, NE_EXPR, LT_EXPR);
			if (res) return res;
		      }
		    }
	        }
	      break;
	    }
          default:;
          }
	if (integer_pow2p (o21))
	  {
	    if (integer_zerop (op1))
	      {
		{
/* #line 2272 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		  tree captures[3] ATTRIBUTE_UNUSED = { o20, o20, o21 };
		  tree res = generic_simplify_60 (loc, type, op0, op1, captures, NE_EXPR, LT_EXPR);
		  if (res) return res;
		}
	      }
	  }
        break;
      }
    default:;
    }
  if (integer_zerop (op1))
    {
      {
/* #line 2429 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 2429 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (TREE_CODE (TREE_TYPE (captures[0])) == BOOLEAN_TYPE && types_match (type, TREE_TYPE (captures[0])))
	  {
	    if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:2431, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res;
	    res = non_lvalue_loc (loc, res_op0);
	    return res;
	  }
      }
    }
  return NULL_TREE;
}

static tree
generic_simplify_MIN_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1173 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_42 (loc, type, op0, op1, captures);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case MAX_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 1177 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_140 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 1177 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_140 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case MAX_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 1177 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o30, op0 };
	      tree res = generic_simplify_140 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 1177 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o31, op0 };
	      tree res = generic_simplify_140 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  {
/* #line 1184 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 1184 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if (INTEGRAL_TYPE_P (type) && TYPE_MIN_VALUE (type) && operand_equal_p (captures[1], TYPE_MIN_VALUE (type), OEP_ONLY_CONST))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1187, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
  }
  return NULL_TREE;
}

static tree
generic_simplify_MAX_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1173 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_42 (loc, type, op0, op1, captures);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case MIN_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	if (op1 == o21 || operand_equal_p (op1, o21, 0))
	  {
	    {
/* #line 1181 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
	      tree res = generic_simplify_43 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (op1 == o20 || operand_equal_p (op1, o20, 0))
	  {
	    {
/* #line 1181 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o21, o20 };
	      tree res = generic_simplify_43 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case MIN_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	if (o31 == op0 || operand_equal_p (o31, op0, 0))
	  {
	    {
/* #line 1181 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o30, op0 };
	      tree res = generic_simplify_43 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 1181 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[2] ATTRIBUTE_UNUSED = { o31, op0 };
	      tree res = generic_simplify_43 (loc, type, op0, op1, captures);
	      if (res) return res;
	    }
	  }
        break;
      }
    default:;
    }
  {
/* #line 1190 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 1190 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
    if (INTEGRAL_TYPE_P (type) && TYPE_MAX_VALUE (type) && operand_equal_p (captures[1], TYPE_MAX_VALUE (type), OEP_ONLY_CONST))
      {
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1193, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
  }
  return NULL_TREE;
}

static tree
generic_simplify_LROTATE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_all_onesp (op0))
    {
      {
/* #line 1220 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_28 (loc, type, op0, op1, captures, LROTATE_EXPR);
	if (res) return res;
      }
    }
  if (integer_zerop (op1))
    {
      {
/* #line 1246 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_142 (loc, type, op0, op1, captures, LROTATE_EXPR);
	if (res) return res;
      }
    }
  if (integer_zerop (op0))
    {
      {
/* #line 1249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_16 (loc, type, op0, op1, captures, LROTATE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op1))
    {
    case VECTOR_CST:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_99 (loc, type, op0, op1, captures, LROTATE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case CONSTRUCTOR:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_93 (loc, type, op0, op1, captures, LROTATE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case INTEGER_CST:
      {
	{
/* #line 1263 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1263, %s:%d\n", __FILE__, __LINE__);
	  tree res_op0;
	  res_op0 = captures[0];
	  tree res_op1;
	  res_op1 =  const_binop (MINUS_EXPR, TREE_TYPE (captures[1]), build_int_cst (TREE_TYPE (captures[1]), element_precision (type)), captures[1]);
	  tree res;
	  res = fold_build2_loc (loc, RROTATE_EXPR, type, res_op0, res_op1);
	  return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case LROTATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1271 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_96 (loc, type, op0, op1, captures, LROTATE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_RROTATE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (integer_all_onesp (op0))
    {
      {
/* #line 1220 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_28 (loc, type, op0, op1, captures, RROTATE_EXPR);
	if (res) return res;
      }
    }
  if (integer_zerop (op1))
    {
      {
/* #line 1246 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_142 (loc, type, op0, op1, captures, RROTATE_EXPR);
	if (res) return res;
      }
    }
  if (integer_zerop (op0))
    {
      {
/* #line 1249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_16 (loc, type, op0, op1, captures, RROTATE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op1))
    {
    case VECTOR_CST:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_99 (loc, type, op0, op1, captures, RROTATE_EXPR);
	  if (res) return res;
	}
        break;
      }
    case CONSTRUCTOR:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_93 (loc, type, op0, op1, captures, RROTATE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case RROTATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1271 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_96 (loc, type, op0, op1, captures, RROTATE_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_RSHIFT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case LSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (op1 == o21 || operand_equal_p (op1, o21, 0))
		{
		  {
/* #line 1239 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 1239 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (TYPE_UNSIGNED (type) && (wi::ltu_p (captures[1], element_precision (type))))
		      {
			if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1241, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[2], res;
			  ops1[0] =  build_minus_one_cst (type);
			  ops1[1] = captures[1];
			  res = fold_build2_loc (loc, RSHIFT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
if (integer_all_onesp (op0))
  {
    {
/* #line 1225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
/* #line 1225 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
      if (!TYPE_UNSIGNED (type) && tree_expr_nonnegative_p (captures[1]))
	{
	  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1227, %s:%d\n", __FILE__, __LINE__);
	  tree res;
	  res = captures[0];
	  if (TREE_SIDE_EFFECTS (captures[1]))
	    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	  return res;
	}
    }
  }
  if (integer_zerop (op1))
    {
      {
/* #line 1246 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_142 (loc, type, op0, op1, captures, RSHIFT_EXPR);
	if (res) return res;
      }
    }
  if (integer_zerop (op0))
    {
      {
/* #line 1249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_16 (loc, type, op0, op1, captures, RSHIFT_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op1))
    {
    case VECTOR_CST:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_99 (loc, type, op0, op1, captures, RSHIFT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case CONSTRUCTOR:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_93 (loc, type, op0, op1, captures, RSHIFT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case RSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1271 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_96 (loc, type, op0, op1, captures, RSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o31, op1 };
			    tree res = generic_simplify_103 (loc, type, op0, op1, captures, BIT_AND_EXPR, RSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o31, op1 };
			    tree res = generic_simplify_103 (loc, type, op0, op1, captures, BIT_XOR_EXPR, RSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o31, op1 };
			    tree res = generic_simplify_103 (loc, type, op0, op1, captures, BIT_IOR_EXPR, RSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, op0, o20, o21, op1 };
		      tree res = generic_simplify_132 (loc, type, op0, op1, captures, BIT_AND_EXPR, RSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, op0, o20, o21, op1 };
		      tree res = generic_simplify_132 (loc, type, op0, op1, captures, BIT_XOR_EXPR, RSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, op0, o20, o21, op1 };
		      tree res = generic_simplify_132 (loc, type, op0, op1, captures, BIT_IOR_EXPR, RSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_LSHIFT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case RSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      if (op1 == o21 || operand_equal_p (op1, o21, 0))
		{
		  {
/* #line 1232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[2] ATTRIBUTE_UNUSED = { o20, o21 };
/* #line 1232 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    if (wi::ltu_p (captures[1], element_precision (type)))
		      {
			if (TREE_SIDE_EFFECTS (op0)) return NULL_TREE;
			if (TREE_SIDE_EFFECTS (op1)) return NULL_TREE;
			if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1233, %s:%d\n", __FILE__, __LINE__);
			tree res_op0;
			res_op0 = captures[0];
			tree res_op1;
			{
			  tree ops1[2], res;
			  ops1[0] =  build_minus_one_cst (type);
			  ops1[1] = captures[1];
			  res = fold_build2_loc (loc, LSHIFT_EXPR, TREE_TYPE (ops1[0]), ops1[0], ops1[1]);
			  res_op1 = res;
			}
			tree res;
			res = fold_build2_loc (loc, BIT_AND_EXPR, type, res_op0, res_op1);
			return res;
		      }
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  if (integer_zerop (op1))
    {
      {
/* #line 1246 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_142 (loc, type, op0, op1, captures, LSHIFT_EXPR);
	if (res) return res;
      }
    }
  if (integer_zerop (op0))
    {
      {
/* #line 1249 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	tree res = generic_simplify_16 (loc, type, op0, op1, captures, LSHIFT_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op1))
    {
    case VECTOR_CST:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_99 (loc, type, op0, op1, captures, LSHIFT_EXPR);
	  if (res) return res;
	}
        break;
      }
    case CONSTRUCTOR:
      {
	{
/* #line 1255 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_93 (loc, type, op0, op1, captures, LSHIFT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op0))
    {
    case LSHIFT_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1271 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[3] ATTRIBUTE_UNUSED = { o20, o21, op1 };
		      tree res = generic_simplify_96 (loc, type, op0, op1, captures, LSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    CASE_CONVERT:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (o20))
	  {
	  case BIT_AND_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o31, op1 };
			    tree res = generic_simplify_103 (loc, type, op0, op1, captures, BIT_AND_EXPR, LSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_XOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o31, op1 };
			    tree res = generic_simplify_103 (loc, type, op0, op1, captures, BIT_XOR_EXPR, LSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
	  case BIT_IOR_EXPR:
	    {
	      tree o30 = TREE_OPERAND (o20, 0);
	      tree o31 = TREE_OPERAND (o20, 1);
	      switch (TREE_CODE (o31))
	        {
		case INTEGER_CST:
		  {
		    switch (TREE_CODE (op1))
		      {
		      case INTEGER_CST:
		        {
			  {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
			    tree captures[5] ATTRIBUTE_UNUSED = { op0, o20, o30, o31, op1 };
			    tree res = generic_simplify_103 (loc, type, op0, op1, captures, BIT_IOR_EXPR, LSHIFT_EXPR);
			    if (res) return res;
			  }
		          break;
		        }
		      default:;
		      }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_AND_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, op0, o20, o21, op1 };
		      tree res = generic_simplify_132 (loc, type, op0, op1, captures, BIT_AND_EXPR, LSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_XOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, op0, o20, o21, op1 };
		      tree res = generic_simplify_132 (loc, type, op0, op1, captures, BIT_XOR_EXPR, LSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    case BIT_IOR_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	tree o21 = TREE_OPERAND (op0, 1);
	switch (TREE_CODE (o21))
	  {
	  case INTEGER_CST:
	    {
	      switch (TREE_CODE (op1))
	        {
		case INTEGER_CST:
		  {
		    {
/* #line 1407 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		      tree captures[5] ATTRIBUTE_UNUSED = { op0, op0, o20, o21, op1 };
		      tree res = generic_simplify_132 (loc, type, op0, op1, captures, BIT_IOR_EXPR, LSHIFT_EXPR);
		      if (res) return res;
		    }
		    break;
		  }
	        default:;
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_COMPLEX_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case REALPART_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case IMAGPART_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      if (o40 == o20 || operand_equal_p (o40, o20, 0))
		{
		  {
/* #line 1625 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		    tree captures[1] ATTRIBUTE_UNUSED = { o20 };
		    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1625, %s:%d\n", __FILE__, __LINE__);
		    tree res;
		    res = captures[0];
		    return res;
		  }
	        }
	      break;
	    }
          default:;
          }
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_UNLE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1871 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_141 (loc, type, op0, op1, captures, UNLE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, UNLE_EXPR, UNGE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, UNLE_EXPR, UNGE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, UNLE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_UNGE_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1871 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_141 (loc, type, op0, op1, captures, UNGE_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, UNGE_EXPR, UNLE_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, UNGE_EXPR, UNLE_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, UNGE_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_UNEQ_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1871 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
	tree res = generic_simplify_141 (loc, type, op0, op1, captures, UNEQ_EXPR);
	if (res) return res;
      }
    }
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, UNEQ_EXPR, UNEQ_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, UNEQ_EXPR, UNEQ_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, UNEQ_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_LTGT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  if (op1 == op0 || operand_equal_p (op1, op0, 0))
    {
      {
/* #line 1874 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[1] ATTRIBUTE_UNUSED = { op0 };
/* #line 1874 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	if (!flag_trapping_math)
	  {
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1875, %s:%d\n", __FILE__, __LINE__);
	    tree res;
	    res =  constant_boolean_node (false, type);
	    if (TREE_SIDE_EFFECTS (captures[0]))
	      res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	    return res;
	  }
      }
    }
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, LTGT_EXPR, LTGT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, LTGT_EXPR, LTGT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, LTGT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_UNORDERED_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, UNORDERED_EXPR, UNORDERED_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, UNORDERED_EXPR, UNORDERED_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, UNORDERED_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_ORDERED_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, ORDERED_EXPR, ORDERED_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, ORDERED_EXPR, ORDERED_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, ORDERED_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_UNLT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, UNLT_EXPR, UNGT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, UNLT_EXPR, UNGT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, UNLT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_UNGT_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1)
{
  switch (TREE_CODE (op0))
    {
    case NEGATE_EXPR:
      {
	tree o20 = TREE_OPERAND (op0, 0);
	switch (TREE_CODE (op1))
	  {
	  case NEGATE_EXPR:
	    {
	      tree o40 = TREE_OPERAND (op1, 0);
	      {
/* #line 2134 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
		tree captures[2] ATTRIBUTE_UNUSED = { o20, o40 };
		tree res = generic_simplify_137 (loc, type, op0, op1, captures, UNGT_EXPR, UNLT_EXPR);
		if (res) return res;
	      }
	      break;
	    }
          default:;
          }
      if (CONSTANT_CLASS_P (op1))
	{
	  {
/* #line 2140 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[2] ATTRIBUTE_UNUSED = { o20, op1 };
	    tree res = generic_simplify_124 (loc, type, op0, op1, captures, UNGT_EXPR, UNLT_EXPR);
	    if (res) return res;
	  }
        }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case REAL_CST:
      {
	{
/* #line 2421 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	  tree res = generic_simplify_35 (loc, type, op0, op1, captures, UNGT_EXPR);
	  if (res) return res;
	}
        break;
      }
    default:;
    }
  return NULL_TREE;
}

tree
generic_simplify (location_t loc, enum tree_code code, tree type ATTRIBUTE_UNUSED, tree op0, tree op1)
{
  switch (code)
    {
    case PLUS_EXPR:
      return generic_simplify_PLUS_EXPR (loc, code, type, op0, op1);
    case POINTER_PLUS_EXPR:
      return generic_simplify_POINTER_PLUS_EXPR (loc, code, type, op0, op1);
    case MINUS_EXPR:
      return generic_simplify_MINUS_EXPR (loc, code, type, op0, op1);
    case BIT_IOR_EXPR:
      return generic_simplify_BIT_IOR_EXPR (loc, code, type, op0, op1);
    case BIT_XOR_EXPR:
      return generic_simplify_BIT_XOR_EXPR (loc, code, type, op0, op1);
    case MULT_EXPR:
      return generic_simplify_MULT_EXPR (loc, code, type, op0, op1);
    case TRUNC_DIV_EXPR:
      return generic_simplify_TRUNC_DIV_EXPR (loc, code, type, op0, op1);
    case CEIL_DIV_EXPR:
      return generic_simplify_CEIL_DIV_EXPR (loc, code, type, op0, op1);
    case FLOOR_DIV_EXPR:
      return generic_simplify_FLOOR_DIV_EXPR (loc, code, type, op0, op1);
    case ROUND_DIV_EXPR:
      return generic_simplify_ROUND_DIV_EXPR (loc, code, type, op0, op1);
    case EXACT_DIV_EXPR:
      return generic_simplify_EXACT_DIV_EXPR (loc, code, type, op0, op1);
    case RDIV_EXPR:
      return generic_simplify_RDIV_EXPR (loc, code, type, op0, op1);
    case CEIL_MOD_EXPR:
      return generic_simplify_CEIL_MOD_EXPR (loc, code, type, op0, op1);
    case FLOOR_MOD_EXPR:
      return generic_simplify_FLOOR_MOD_EXPR (loc, code, type, op0, op1);
    case ROUND_MOD_EXPR:
      return generic_simplify_ROUND_MOD_EXPR (loc, code, type, op0, op1);
    case TRUNC_MOD_EXPR:
      return generic_simplify_TRUNC_MOD_EXPR (loc, code, type, op0, op1);
    case BIT_AND_EXPR:
      return generic_simplify_BIT_AND_EXPR (loc, code, type, op0, op1);
    case LT_EXPR:
      return generic_simplify_LT_EXPR (loc, code, type, op0, op1);
    case GE_EXPR:
      return generic_simplify_GE_EXPR (loc, code, type, op0, op1);
    case GT_EXPR:
      return generic_simplify_GT_EXPR (loc, code, type, op0, op1);
    case LE_EXPR:
      return generic_simplify_LE_EXPR (loc, code, type, op0, op1);
    case EQ_EXPR:
      return generic_simplify_EQ_EXPR (loc, code, type, op0, op1);
    case NE_EXPR:
      return generic_simplify_NE_EXPR (loc, code, type, op0, op1);
    case MIN_EXPR:
      return generic_simplify_MIN_EXPR (loc, code, type, op0, op1);
    case MAX_EXPR:
      return generic_simplify_MAX_EXPR (loc, code, type, op0, op1);
    case LROTATE_EXPR:
      return generic_simplify_LROTATE_EXPR (loc, code, type, op0, op1);
    case RROTATE_EXPR:
      return generic_simplify_RROTATE_EXPR (loc, code, type, op0, op1);
    case RSHIFT_EXPR:
      return generic_simplify_RSHIFT_EXPR (loc, code, type, op0, op1);
    case LSHIFT_EXPR:
      return generic_simplify_LSHIFT_EXPR (loc, code, type, op0, op1);
    case COMPLEX_EXPR:
      return generic_simplify_COMPLEX_EXPR (loc, code, type, op0, op1);
    case UNLE_EXPR:
      return generic_simplify_UNLE_EXPR (loc, code, type, op0, op1);
    case UNGE_EXPR:
      return generic_simplify_UNGE_EXPR (loc, code, type, op0, op1);
    case UNEQ_EXPR:
      return generic_simplify_UNEQ_EXPR (loc, code, type, op0, op1);
    case LTGT_EXPR:
      return generic_simplify_LTGT_EXPR (loc, code, type, op0, op1);
    case UNORDERED_EXPR:
      return generic_simplify_UNORDERED_EXPR (loc, code, type, op0, op1);
    case ORDERED_EXPR:
      return generic_simplify_ORDERED_EXPR (loc, code, type, op0, op1);
    case UNLT_EXPR:
      return generic_simplify_UNLT_EXPR (loc, code, type, op0, op1);
    case UNGT_EXPR:
      return generic_simplify_UNGT_EXPR (loc, code, type, op0, op1);
    default:;
    }
  return NULL_TREE;
}

static tree
generic_simplify_COND_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1, tree op2)
{
  switch (TREE_CODE (op0))
    {
    case INTEGER_CST:
      {
	{
/* #line 1691 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, op2 };
/* #line 1691 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (integer_zerop (captures[0]))
	    {
/* #line 1692 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (!VOID_TYPE_P (TREE_TYPE (captures[2])) || VOID_TYPE_P (type))
		{
		  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1693, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res = captures[2];
		  return res;
		}
	    }
	  else
	    {
/* #line 1694 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (!VOID_TYPE_P (TREE_TYPE (captures[1])) || VOID_TYPE_P (type))
		{
		  if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
		  if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1695, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res = captures[1];
		  return res;
		}
	    }
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case COND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	tree o32 = TREE_OPERAND (op1, 2);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 1707 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, o31, o32, op2 };
	      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1707, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res_op2;
	      res_op2 = captures[3];
	      tree res;
	      res = fold_build3_loc (loc, COND_EXPR, type, res_op0, res_op1, res_op2);
	      return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op2))
    {
    case COND_EXPR:
      {
	tree o40 = TREE_OPERAND (op2, 0);
	tree o41 = TREE_OPERAND (op2, 1);
	tree o42 = TREE_OPERAND (op2, 2);
	if (o40 == op0 || operand_equal_p (o40, op0, 0))
	  {
	    {
/* #line 1710 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o41, o42 };
	      if (TREE_SIDE_EFFECTS (captures[0])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1710, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res_op2;
	      res_op2 = captures[3];
	      tree res;
	      res = fold_build3_loc (loc, COND_EXPR, type, res_op0, res_op1, res_op2);
	      return res;
	    }
	  }
	{
/* #line 1718 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o40, o41, o42 };
/* #line 1718 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (COMPARISON_CLASS_P (captures[0]) && COMPARISON_CLASS_P (captures[2]) && invert_tree_comparison (TREE_CODE (captures[0]), HONOR_NANS (TREE_OPERAND (captures[0], 0))) == TREE_CODE (captures[2]) && operand_equal_p (TREE_OPERAND (captures[0], 0), TREE_OPERAND (captures[2], 0), 0) && operand_equal_p (TREE_OPERAND (captures[0], 1), TREE_OPERAND (captures[2], 1), 0))
	    {
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[4])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1724, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res_op2;
	      res_op2 = captures[3];
	      tree res;
	      res = fold_build3_loc (loc, COND_EXPR, type, res_op0, res_op1, res_op2);
	      return res;
	    }
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case COND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	tree o32 = TREE_OPERAND (op1, 2);
	{
/* #line 1727 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[5] ATTRIBUTE_UNUSED = { op0, o30, o31, o32, op2 };
/* #line 1727 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (COMPARISON_CLASS_P (captures[0]) && COMPARISON_CLASS_P (captures[1]) && invert_tree_comparison (TREE_CODE (captures[0]), HONOR_NANS (TREE_OPERAND (captures[0], 0))) == TREE_CODE (captures[1]) && operand_equal_p (TREE_OPERAND (captures[0], 0), TREE_OPERAND (captures[1], 0), 0) && operand_equal_p (TREE_OPERAND (captures[0], 1), TREE_OPERAND (captures[1], 1), 0))
	    {
	      if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[3])) return NULL_TREE;
	      if (TREE_SIDE_EFFECTS (captures[4])) return NULL_TREE;
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1733, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[3];
	      tree res_op2;
	      res_op2 = captures[4];
	      tree res;
	      res = fold_build3_loc (loc, COND_EXPR, type, res_op0, res_op1, res_op2);
	      return res;
	    }
	}
        break;
      }
    default:;
    }
  if (op2 == op1 || operand_equal_p (op2, op1, 0))
    {
      {
/* #line 1738 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1738, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
    }
  tree op0_pops[1];
  if (tree_logical_inverted_value (op0, op0_pops))
    {
      tree o20 = op0_pops[0];
      if (tree_truth_valued_p (o20))
	{
	  {
/* #line 1743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { o20, op1, op2 };
	    if (TREE_SIDE_EFFECTS (captures[1])) return NULL_TREE;
	    if (TREE_SIDE_EFFECTS (captures[2])) return NULL_TREE;
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1743, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res_op1;
	    res_op1 = captures[2];
	    tree res_op2;
	    res_op2 = captures[1];
	    tree res;
	    res = fold_build3_loc (loc, COND_EXPR, type, res_op0, res_op1, res_op2);
	    return res;
	  }
        }
}
  return NULL_TREE;
}

static tree
generic_simplify_VEC_COND_EXPR (location_t ARG_UNUSED (loc), enum tree_code ARG_UNUSED (code), tree ARG_UNUSED (type), tree op0, tree op1, tree op2)
{
  switch (TREE_CODE (op0))
    {
    case VECTOR_CST:
      {
	{
/* #line 1698 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[3] ATTRIBUTE_UNUSED = { op0, op1, op2 };
/* #line 1698 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (integer_all_onesp (captures[0]))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1699, %s:%d\n", __FILE__, __LINE__);
	      tree res;
	      res = captures[1];
	      if (TREE_SIDE_EFFECTS (captures[2]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	      return res;
	    }
	  else
	    {
/* #line 1700 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      if (integer_zerop (captures[0]))
		{
		  if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1701, %s:%d\n", __FILE__, __LINE__);
		  tree res;
		  res = captures[2];
		  if (TREE_SIDE_EFFECTS (captures[1]))
		    res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
		  return res;
		}
	    }
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case VEC_COND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	tree o32 = TREE_OPERAND (op1, 2);
	if (o30 == op0 || operand_equal_p (o30, op0, 0))
	  {
	    {
/* #line 1707 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, o31, o32, op2 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1707, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res_op2;
	      res_op2 = captures[3];
	      tree res;
	      res = fold_build3_loc (loc, VEC_COND_EXPR, type, res_op0, res_op1, res_op2);
	      if (TREE_SIDE_EFFECTS (captures[2]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	      return res;
	    }
	  }
        break;
      }
    default:;
    }
  switch (TREE_CODE (op2))
    {
    case VEC_COND_EXPR:
      {
	tree o40 = TREE_OPERAND (op2, 0);
	tree o41 = TREE_OPERAND (op2, 1);
	tree o42 = TREE_OPERAND (op2, 2);
	if (o40 == op0 || operand_equal_p (o40, op0, 0))
	  {
	    {
/* #line 1710 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	      tree captures[4] ATTRIBUTE_UNUSED = { op0, op1, o41, o42 };
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1710, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res_op2;
	      res_op2 = captures[3];
	      tree res;
	      res = fold_build3_loc (loc, VEC_COND_EXPR, type, res_op0, res_op1, res_op2);
	      if (TREE_SIDE_EFFECTS (captures[2]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	      return res;
	    }
	  }
	{
/* #line 1718 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[5] ATTRIBUTE_UNUSED = { op0, op1, o40, o41, o42 };
/* #line 1718 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (COMPARISON_CLASS_P (captures[0]) && COMPARISON_CLASS_P (captures[2]) && invert_tree_comparison (TREE_CODE (captures[0]), HONOR_NANS (TREE_OPERAND (captures[0], 0))) == TREE_CODE (captures[2]) && operand_equal_p (TREE_OPERAND (captures[0], 0), TREE_OPERAND (captures[2], 0), 0) && operand_equal_p (TREE_OPERAND (captures[0], 1), TREE_OPERAND (captures[2], 1), 0))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1724, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[1];
	      tree res_op2;
	      res_op2 = captures[3];
	      tree res;
	      res = fold_build3_loc (loc, VEC_COND_EXPR, type, res_op0, res_op1, res_op2);
	      if (TREE_SIDE_EFFECTS (captures[2]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	      if (TREE_SIDE_EFFECTS (captures[4]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[4]), res);
	      return res;
	    }
	}
        break;
      }
    default:;
    }
  switch (TREE_CODE (op1))
    {
    case VEC_COND_EXPR:
      {
	tree o30 = TREE_OPERAND (op1, 0);
	tree o31 = TREE_OPERAND (op1, 1);
	tree o32 = TREE_OPERAND (op1, 2);
	{
/* #line 1727 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  tree captures[5] ATTRIBUTE_UNUSED = { op0, o30, o31, o32, op2 };
/* #line 1727 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	  if (COMPARISON_CLASS_P (captures[0]) && COMPARISON_CLASS_P (captures[1]) && invert_tree_comparison (TREE_CODE (captures[0]), HONOR_NANS (TREE_OPERAND (captures[0], 0))) == TREE_CODE (captures[1]) && operand_equal_p (TREE_OPERAND (captures[0], 0), TREE_OPERAND (captures[1], 0), 0) && operand_equal_p (TREE_OPERAND (captures[0], 1), TREE_OPERAND (captures[1], 1), 0))
	    {
	      if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1733, %s:%d\n", __FILE__, __LINE__);
	      tree res_op0;
	      res_op0 = captures[0];
	      tree res_op1;
	      res_op1 = captures[3];
	      tree res_op2;
	      res_op2 = captures[4];
	      tree res;
	      res = fold_build3_loc (loc, VEC_COND_EXPR, type, res_op0, res_op1, res_op2);
	      if (TREE_SIDE_EFFECTS (captures[1]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[1]), res);
	      if (TREE_SIDE_EFFECTS (captures[2]))
		res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[2]), res);
	      return res;
	    }
	}
        break;
      }
    default:;
    }
  if (op2 == op1 || operand_equal_p (op2, op1, 0))
    {
      {
/* #line 1738 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	tree captures[2] ATTRIBUTE_UNUSED = { op0, op1 };
	if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1738, %s:%d\n", __FILE__, __LINE__);
	tree res;
	res = captures[1];
	if (TREE_SIDE_EFFECTS (captures[0]))
	  res = build2_loc (loc, COMPOUND_EXPR, type, fold_ignored_result (captures[0]), res);
	return res;
      }
    }
  tree op0_pops[1];
  if (tree_logical_inverted_value (op0, op0_pops))
    {
      tree o20 = op0_pops[0];
      if (tree_truth_valued_p (o20))
	{
	  {
/* #line 1743 "/android/gcc/gcc-6.4.0/gcc/match.pd" */
	    tree captures[3] ATTRIBUTE_UNUSED = { o20, op1, op2 };
	    if (dump_file && (dump_flags & TDF_DETAILS)) fprintf (dump_file, "Applying pattern match.pd:1743, %s:%d\n", __FILE__, __LINE__);
	    tree res_op0;
	    res_op0 = captures[0];
	    tree res_op1;
	    res_op1 = captures[2];
	    tree res_op2;
	    res_op2 = captures[1];
	    tree res;
	    res = fold_build3_loc (loc, VEC_COND_EXPR, type, res_op0, res_op1, res_op2);
	    return res;
	  }
        }
}
  return NULL_TREE;
}

tree
generic_simplify (location_t loc, enum tree_code code, tree type ATTRIBUTE_UNUSED, tree op0, tree op1, tree op2)
{
  switch (code)
    {
    case COND_EXPR:
      return generic_simplify_COND_EXPR (loc, code, type, op0, op1, op2);
    case VEC_COND_EXPR:
      return generic_simplify_VEC_COND_EXPR (loc, code, type, op0, op1, op2);
    default:;
    }
  return NULL_TREE;
}
