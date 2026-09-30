/*
 * get-mtime.c: get a file's modification time
 *
 * Copyright (C) 2022 Colin Watson.
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

#include <errno.h>
#include <stdlib.h>

#include "argp.h"
#include "progname.h"
#include "stat-time.h"

#include "manconfig.h"

#include "fatal.h"

static char *path;

static const char args_doc[] = "PATH";

static error_t parse_opt (int key, char *arg, struct argp_state *state)
{
	switch (key) {
		case ARGP_KEY_ARG:
			if (path)
				argp_usage (state);
			path = arg;
			return 0;
		case ARGP_KEY_NO_ARGS:
			argp_usage (state);
			break;
	}
	return ARGP_ERR_UNKNOWN;
}

static struct argp argp = {NULL, parse_opt, args_doc};

int main (int argc, char **argv)
{
	struct stat st;
	struct timespec ts;

	set_program_name (argv[0]);

	if (argp_parse (&argp, argc, argv, 0, 0, 0))
		exit (FAIL);

	if (lstat (path, &st) < 0)
		fatal (errno, "can't lstat %s", path);
	ts = get_stat_mtime (&st);
	printf ("%ld.%09ld\n", (long) ts.tv_sec, ts.tv_nsec);

	exit (OK);
}
