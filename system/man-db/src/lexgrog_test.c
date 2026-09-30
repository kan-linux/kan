/*
 * lexgrog_test.c: test whatis extraction from man/cat pages
 *
 * Copyright (C) 1994, 1995 Graeme W. Wilford. (Wilf.)
 * Copyright (C) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
 *               2011 Colin Watson.
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

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/stat.h>

#include "argp.h"
#include "attribute.h"
#include "error.h"
#include "gl_list.h"
#include "progname.h"
#include "xalloc.h"

#include "gettext.h"
#define _(String)  gettext (String)
#define N_(String) gettext_noop (String)

#include "manconfig.h"

#include "cleanup.h"
#include "debug.h"
#include "glcontainers.h"
#include "pipeline.h"
#include "sandbox.h"
#include "security.h"
#include "util.h"

#include "convert.h"
#include "descriptions.h"
#include "lexgrog.h"
#include "ult_src.h"

int quiet = 1;
man_sandbox *sandbox;

static bool parse_man = false, parse_cat = false;
static bool show_whatis = false, show_filters = false;
static const char *encoding = NULL;
static char **files;
static int num_files;

const char *argp_program_version = "lexgrog " PACKAGE_VERSION;
const char *argp_program_bug_address = PACKAGE_BUGREPORT;
error_t argp_err_exit_status = FAIL;

static const char args_doc[] = N_ ("FILE...");
static const char doc[] = "\v" N_ ("The defaults are --man and --whatis.");

static struct argp_option options[] = {
        OPT ("debug", 'd', 0, N_ ("emit debugging messages")),
        OPT ("man", 'm', 0, N_ ("parse as man page"), 1),
        OPT ("cat", 'c', 0, N_ ("parse as cat page")),
        OPT ("whatis", 'w', 0, N_ ("show whatis information"), 2),
        OPT ("filters", 'f', 0,
             N_ ("show guessed series of preprocessing filters")),
        OPT ("encoding", 'E', N_ ("ENCODING"),
             N_ ("use selected output encoding"), 3),
        OPT_HELP_COMPAT,
        {0}};

static error_t parse_opt (int key, char *arg, struct argp_state *state)
{
	switch (key) {
		case 'd':
			debug_level = true;
			return 0;
		case 'm':
			parse_man = true;
			return 0;
		case 'c':
			parse_cat = true;
			return 0;
		case 'w':
			show_whatis = true;
			return 0;
		case 'f':
			show_filters = true;
			return 0;
		case 'E':
			encoding = arg;
			return 0;
		case 'h':
			argp_state_help (state, state->out_stream,
			                 ARGP_HELP_STD_HELP &
			                         ~ARGP_HELP_PRE_DOC);
			break;
		case ARGP_KEY_ARGS:
			files = state->argv + state->next;
			num_files = state->argc - state->next;
			return 0;
		case ARGP_KEY_NO_ARGS:
			argp_usage (state);
			break;
		case ARGP_KEY_SUCCESS:
			if (parse_man && parse_cat)
				/* This slightly odd construction allows us
				 * to reuse a translation.
				 */
				argp_error (state,
				            _ ("%s: incompatible options"),
				            "-m -c");
			/* defaults: --man, --whatis */
			if (!parse_man && !parse_cat)
				parse_man = true;
			if (!show_whatis && !show_filters)
				show_whatis = true;
			return 0;
	}
	return ARGP_ERR_UNKNOWN;
}

static char *help_filter (int key, const char *text, void *input MAYBE_UNUSED)
{
	switch (key) {
		case ARGP_KEY_HELP_PRE_DOC:
			/* We have no pre-options help text, but the input
			 * text may contain header junk due to gettext ("").
			 */
			return NULL;
		default:
			return (char *) text;
	}
}

static struct argp argp = {options, parse_opt, args_doc, doc, 0, help_filter};

int main (int argc, char **argv)
{
	int type = MANPAGE;
	int i;
	bool some_failed = false;

	set_program_name (argv[0]);

	init_debug ();
	pipeline_install_post_fork (pop_all_cleanups);
	sandbox = sandbox_init ();
	init_locale ();

	if (argp_parse (&argp, argc, argv, 0, 0, 0))
		exit (FAIL);

	/* We aren't setuid, but this allows generic code in lexgrog.l to
	 * use drop_effective_privs/regain_effective_privs.
	 */
	init_security ();

	if (parse_man)
		type = MANPAGE;
	else
		type = CATPAGE;

	for (i = 0; i < num_files; ++i) {
		lexgrog lg;
		const char *file = NULL;
		bool found = false;

		lg.type = type;

		if (STREQ (files[i], "-"))
			file = files[i];
		else {
			char *path, *pathend;
			struct stat statbuf;
			const struct ult_value *ult;

			path = xstrdup (files[i]);
			pathend = strrchr (path, '/');
			if (pathend) {
				*pathend = '\0';
				pathend = strrchr (path, '/');
				if (pathend && STRNEQ (pathend + 1, "man", 3))
					*pathend = '\0';
				else {
					free (path);
					path = NULL;
				}
			} else {
				free (path);
				path = NULL;
			}

			ult = ult_src (files[i], path ? path : ".", &statbuf,
			               SO_LINK);
			if (ult)
				file = ult->path;
			free (path);
		}

		if (file && find_name (file, "-", &lg, encoding)) {
			gl_list_t descs = parse_descriptions (NULL, lg.whatis);
			const struct page_description *desc;
			GL_LIST_FOREACH (descs, desc) {
				if (!desc->name || !desc->whatis)
					continue;
				found = true;
				printf ("%s", files[i]);
				if (show_filters)
					printf (" (%s)", lg.filters);
				if (show_whatis) {
					char *name_conv =
					        convert_to_locale (desc->name);
					char *whatis_conv = convert_to_locale (
					        desc->whatis);
					printf (": \"%s - %s\"", name_conv,
					        whatis_conv);
					free (whatis_conv);
					free (name_conv);
				}
				printf ("\n");
			}
			gl_list_free (descs);
			free (lg.filters);
			free (lg.whatis);
		}

		if (!found) {
			printf ("%s: parse failed\n", files[i]);
			some_failed = true;
		}
	}

	sandbox_free (sandbox);

	if (some_failed)
		return FATAL;
	else
		return OK;
}
