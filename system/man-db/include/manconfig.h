/*
 * manconfig.h: definitions and declarations used throughout man-db
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001-2022 Colin Watson.
 *
 * This file is part of man-db.
 *
 * man-db is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * man-db is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with man-db; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

#ifndef MANCONFIG_H
#define MANCONFIG_H

#include "config.h"

/* STD_SECTIONS must contain all of your man hierarchy subdirectories. The
   order is important. Manual pages will be displayed in this order. Ie
   if "1" comes before "2", then a kill(1) will be displayed in preference to
   kill(2), or if `man --all kill', it will be displayed first. Section names
   may be multi-character, but this is non-standard and probably best
   avoided. */

#define STD_SECTIONS                                                          \
	{"1",     "n", "l", "8", "3", "0", "2",                               \
	 "3type", "5", "4", "9", "6", "7", NULL}

/* Some system's man pages require default pre-processing with perhaps tbl
   or other formatters, DEFAULT_MANROFFSEQ can compensate by adding a list of
   default pre-processors using the standard syntax of first letter.
   ie "t"  = tbl (the table pre-processor)
      "te" = tbl, eqn (both the table and equation pre-processors)
   DEFAULT_MANROFFSEQ can be overridden by command line arguments to man, the
   environment variable $MANROFFSEQ, and by the manual page being formatted. */

#if defined(__hpux) || (defined(__alpha) && !defined(__GLIBC__))
#  define DEFAULT_MANROFFSEQ "te"
#elif defined(__ultrix)
#  define DEFAULT_MANROFFSEQ "t"
#endif

/* the magic cookie to request preprocessing */
#define PP_COOKIE "'\\\" "

/* uncomment the following line if manual pages require tbl by default */
#ifndef DEFAULT_MANROFFSEQ
#  define DEFAULT_MANROFFSEQ "t"
#endif

/* By default, man-db will store a whatis referenced manual page in favour
   of a stray cat page when they both share identical namespace. If you
   would like to see a stray cat eg. kill(1) in favour of a kill(1) whatis
   referenced to bash_builtins(1), uncomment the following line. */

/* #define FAVOUR_STRAYCATS */

/* CATMODE is the mode of the formatted cat pages that we create. The man-db
   package can be run in 4 main modes, 3 of which are relatively secure and
   allow the cats to be non world writable. The `wide open' mode requires
   CATMODE to be 0666. Edit if necessary, after reading the man-db manual */

#define CATMODE 0644 /* u=rw,go=r */

/* DBMODE is the mode of the created databases. As with CATMODE, secure
   operation requires that the db's don't have world write access. In the
   unlikely event that this is required, change to 0666.
     For increased speed, at the cost of buffer cache, set the sticky bit
   on databases so that they remain memory resident. To do this, OR the
   required mode with 1000 and prepend a 0, eg 01644 */

#define DBMODE 0644 /* u=rw,go=r */

/*------------------------------------------------------------------*/
/* The following definitions are best left alone by the uninitiated */
/*------------------------------------------------------------------*/

/* GNU grep flags (i)gnore case
                  (E)xtended regex
                  (w)hole word matches only */

#ifndef WHATIS_GREP_FLAGS
#  define WHATIS_GREP_FLAGS "-i"
#endif

#ifndef APROPOS_GREP_FLAGS
#  define APROPOS_GREP_FLAGS "-iEw"
#endif

#ifndef APROPOS_REGEX_GREP_FLAGS
#  define APROPOS_REGEX_GREP_FLAGS "-iE"
#endif

/* GNU less flags (i)gnore case on search
 *                (x8) set tab stops to 8 spaces
 *                (R)aw control chars (but keep track of screen appearance)
 *                (m)ore display style
 *
 * If you change this, be sure to match the format with
 * man.c:make_display_command().
 */

#define LESS_OPTS "-ix8RmPm%s$PM%s$"

/* This is a minimal latin1 special characters to ascii translation table */
#if !defined(TR_SET1) || !defined(TR_SET2)
#  define TR_SET1 " \'\\255\\267\\264\\327\'"
#  define TR_SET2 " \'\\055\\157\\047\\170\'"
#endif

/*-----------------------------------------------------------------------*/
/* The things below here shouldn't really be changed unless you really	 */
/* know what you are doing.						 */
/*-----------------------------------------------------------------------*/

/* my gcc specs file is hacked to define __profile__ if I compile with
   the -p or -pg flag, to do this manually (needed if you want to know where
   gmon.out ended up), uncomment the following line */
/* #define __profile__ */

/* GCC version checking borrowed from glibc. */
#if defined(__GNUC__) && defined(__GNUC_MINOR__)
#  define GNUC_PREREQ(maj, min)                                               \
	  ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
#else
#  define GNUC_PREREQ(maj, min) 0
#endif

#define UNLIKELY(cond) __builtin_expect ((cond), 0)

/* GNU gettext needs to know when the locale changes. This macro tells it. */
#ifdef HAVE_NL_MSG_CAT_CNTR
extern int _nl_msg_cat_cntr;
#  define locale_changed()                                                    \
	  do {                                                                \
		  ++_nl_msg_cat_cntr;                                         \
	  } while (0)
#else /* !HAVE_NL_MSG_CAT_CNTR */
#  define locale_changed()
#endif /* ENABLE_NLS */

extern int quiet; /* be quiet(er) if 1 */

/*--------------------------*/
/* Some general definitions */
/*--------------------------*/

/* exit codes */
#define OK         0  /* success */
#define FAIL       1  /* usage or syntax error */
#define FATAL      2  /* operational error */
#define CHILD_FAIL 3  /* child failed */
#define NOT_FOUND  16 /* No action was taken */

/* System or user catpaths? Allow bitwise disjunctions of these. */
#define SYSTEM_CAT 1
#define USER_CAT   2

/* string macros */
#define STREQ(a, b)     (strcmp (a, b) == 0)
#define STRNEQ(a, b, d) (strncmp (a, b, d) == 0)

/* Functions in <ctype.h> require their argument to be either an unsigned
 * char promoted to int or EOF. This macro helps get that right.
 */
#define CTYPE(func, arg) (func ((unsigned char) (arg)))

/* access(2), but with boolean semantics. */
#define CAN_ACCESS(pathname, mode) (access (pathname, mode) == 0)

/* FSSTND directories */
#define CAT_ROOT "/var/catman" /* required by fsstnd() */
#define MAN_ROOT "/usr"        /* required by fsstnd() */
/* FHS directories */
#define FHS_CAT_ROOT "/var/cache/man" /* required by fsstnd() */
#define FHS_MAN_ROOT "/usr/share"     /* required by fsstnd() */

/* some special database keys used for storing important info */
#define VER_KEY "$version$" /* version key */
#define VER_ID  "2.5.0"     /* version content */

/* Macros for argp option handling. */

#define OPT(name, key, arg, ...) {name, key, arg, 0, __VA_ARGS__}
#define OPT_FULL(name, key, arg, flags, ...)                                  \
	{name, key, arg, flags, __VA_ARGS__}
#define OPT_ALIAS(name, key)         {name, key, 0, OPTION_ALIAS}
#define OPT_HIDDEN(name, key)        {name, key, 0, OPTION_HIDDEN}
#define OPT_GROUP_HEADER(doc, group) {0, 0, 0, 0, doc, group}
/* compatibility for --help */
#define OPT_HELP_COMPAT OPT_HIDDEN (0, 'h')

#endif /* MANCONFIG_H */
