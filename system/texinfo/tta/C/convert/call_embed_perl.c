/* Copyright 2010-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

/*
Uses PERL_UNUSED_CONTEXT, which depends on PERL_UNUSED_ARG
Uses pTHX_
 */
#include "ppport.h"

#include <stdio.h>

/* could also be in other libraries */
void
call_eval_use_module (const char *module_name)
{
  SV *sv_str;
  char *str;

  dTHX;

  sv_str = newSVpvf("use %s;", module_name);
  str = SvPV_nolen(sv_str);

  eval_pv (str, TRUE);
}

/* following is used to embed a Perl interpreter */
static PerlInterpreter *my_perl;

/* this is somewhat magic, but it works; obtained according to perlembed with
  perl -MExtUtils::Embed -e xsinit -- -o perlxsi.c
 */

EXTERN_C void xs_init (pTHX);

EXTERN_C void boot_DynaLoader (pTHX_ CV* cv);

EXTERN_C void
xs_init (pTHX)
{
    static const char file[] = __FILE__;
    dXSUB_SYS;
    PERL_UNUSED_CONTEXT;

    /* DynaLoader is a special case */
    newXS("DynaLoader::boot_DynaLoader", boot_DynaLoader, file);
}

/* load a Perl interpreter.  Also load Texinfo modules by running the
   LOAD_TXI_MODULES_PATH Perl script.  To be called once.
   VERSION_CHECKED is passed as command-line argument to the
   LOAD_TXI_MODULES_PATH script run when starting the embedded interpreter,
   to allow for a version check of VERSION_CHECKED against a version coming
   from a Perl module.
 */
int
call_init_perl (int *argc_ref, char ***argv_ref, char ***env_ref,
                char *load_txi_modules_path, const char *version_checked)
{
  int parse_status, run_status;
  char *embedding[] = { "", load_txi_modules_path,
                       (char *)version_checked, NULL };
  /* The need and use of arguments of PERL_SYS_INIT3 are not explained
     clearly anywhere.  In perlembed they seem to be mandatory, but
     there is nothing very explicit.  We follow perlembed:
   PERL_SYS_INIT3() must be invoked on the C main() argc, argv and env and only once.
   */
  /* PERL_SYS_INIT3(&argc,&argv,&env); */
  PERL_SYS_INIT3 (argc_ref, argv_ref, env_ref);
  /* PERL_SYS_INIT3((int *)NULL,(char ***)NULL,(char ***)NULL); */
  my_perl = perl_alloc ();
  perl_construct (my_perl);
  PL_exit_flags |= PERL_EXIT_DESTRUCT_END;
  parse_status = perl_parse (my_perl, xs_init, 3, embedding, (char **)NULL);
  if (parse_status)
    return parse_status;
  /*
  fprintf (stderr, "call_init_perl %s parse_status: %d\n",
           load_txi_modules_path, parse_status);
   */
  run_status = perl_run (my_perl);
  /*
  fprintf (stderr, "call_init_perl run_status: %d\n", run_status);
   */
  if (run_status)
    return run_status;
  return 0;
}

void
call_finish_perl (void)
{
  /* The default is 1, which lead to 5% of the total time for destruction
     for the Texinfo manual formatted to Info.
     PERL_DESTRUCT_LEVEL env variable overrides the value.
   */
  PL_perl_destruct_level = 0;
  perl_destruct (my_perl);
  perl_free (my_perl);
  PERL_SYS_TERM ();
}
