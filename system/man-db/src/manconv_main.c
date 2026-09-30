/*
 * manconv_main.c: convert manual page from one encoding to another
 *
 * Copyright (C) 2007, 2008 Colin Watson.
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

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif /* HAVE_CONFIG_H */

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "argp.h"
#include "error.h"
#include "gl_array_list.h"
#include "gl_xlist.h"
#include "progname.h"
#include "xalloc.h"

#include "gettext.h"
#define _(String)  gettext (String)
#define N_(String) gettext_noop (String)

#include "manconfig.h"

#include "appendstr.h"
#include "cleanup.h"
#include "debug.h"
#include "encodings.h"
#include "glcontainers.h"
#include "pipeline.h"
#include "sandbox.h"
#include "util.h"

#include "decompress.h"
#include "manconv.h"

int quiet = 0;
man_sandbox *sandbox;

static const char *from_codes;
static char *to_code;
static gl_list_t from_code;
static const char *filename;

static gl_list_t split_codes (const char *codestr)
{
	char *codestrtok, *codestrtok_ptr;
	char *tok;
	gl_list_t codelist = new_string_list (GL_ARRAY_LIST, true);

	if (!codestr)
		return codelist;

	codestrtok = xstrdup (codestr);
	codestrtok_ptr = codestrtok;

	for (tok = strsep (&codestrtok_ptr, ":"); tok;
	     tok = strsep (&codestrtok_ptr, ":")) {
		if (!*tok)
			continue; /* ignore empty fields */
		gl_list_add_last (codelist, xstrdup (tok));
	}

	free (codestrtok);

	return codelist;
}

const char *argp_program_version = "manconv " PACKAGE_VERSION;
const char *argp_program_bug_address = PACKAGE_BUGREPORT;
error_t argp_err_exit_status = FAIL;

static const char args_doc[] = N_ ("[-f CODE[:...]] -t CODE [FILENAME]");

static struct argp_option options[] = {
        OPT ("from-code", 'f', N_ ("CODE[:...]"),
             N_ ("possible encodings of original text")),
        OPT ("to-code", 't', N_ ("CODE"), N_ ("encoding for output")),
        OPT ("debug", 'd', 0, N_ ("emit debugging messages")),
        OPT ("quiet", 'q', 0, N_ ("produce fewer warnings")),
        OPT_HELP_COMPAT,
        {0}};

static error_t parse_opt (int key, char *arg, struct argp_state *state)
{
	switch (key) {
		case 'f':
			from_codes = arg;
			return 0;
		case 't':
			to_code = xstrdup (arg);
			if (!strstr (to_code, "//"))
				to_code = appendstr (to_code, "//TRANSLIT",
				                     nullptr);
			return 0;
		case 'd':
			debug_level = true;
			return 0;
		case 'q':
			quiet = 1;
			return 0;
		case 'h':
			argp_state_help (state, state->out_stream,
			                 ARGP_HELP_STD_HELP);
			break;
		case ARGP_KEY_ARG:
			if (filename)
				argp_usage (state);
			filename = arg;
			return 0;
		case ARGP_KEY_SUCCESS:
			if (!to_code)
				argp_error (state, _ ("must specify an output "
				                      "encoding"));
			from_code = split_codes (from_codes);
			return 0;
	}
	return ARGP_ERR_UNKNOWN;
}

static struct argp argp = {options, parse_opt, args_doc};

int main (int argc, char *argv[])
{
	decompress *decomp;

	set_program_name (argv[0]);

	init_debug ();
	pipeline_install_post_fork (pop_all_cleanups);
	sandbox = sandbox_init ();
	init_locale ();

	if (argp_parse (&argp, argc, argv, 0, 0, 0))
		exit (FAIL);
	assert (from_code);

	if (filename) {
		decomp = decompress_open (filename, 0);
		if (!decomp)
			error (FAIL, 0, _ ("can't open %s"), filename);
	} else
		decomp = decompress_fdopen (dup (STDIN_FILENO));
	decompress_start (decomp);

	if (!gl_list_size (from_code)) {
		char *lang, *page_encoding;

		/* Note that we don't need to explicitly check the page's
		 * preprocessor encoding here, as the manconv function will
		 * do that itself and override the requested input encoding
		 * with it if it finds one.
		 */
		lang = lang_dir (filename);
		page_encoding = get_page_encoding (lang);
		if (STREQ (page_encoding, "UTF-8")) {
			/* Steal memory. */
			gl_list_add_last (from_code, page_encoding);
			debug ("guessed input encoding %s for %s\n",
			       page_encoding, filename);
		} else {
			gl_list_add_last (from_code, xstrdup ("UTF-8"));
			/* Steal memory. */
			gl_list_add_last (from_code, page_encoding);
			debug ("guessed input encodings UTF-8:%s for %s\n",
			       page_encoding, filename);
		}

		free (lang);
	}

	if (manconv (decomp, from_code, to_code, NULL) != 0)
		/* manconv already wrote an error message to stderr.  Just
		 * exit non-zero.
		 */
		exit (FATAL);

	free (to_code);
	gl_list_free (from_code);

	decompress_wait (decomp);

	sandbox_free (sandbox);

	return 0;
}
