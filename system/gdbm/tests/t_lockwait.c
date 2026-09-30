/* This file is part of GDBM test suite.
   Copyright (C) 2011-2025 Free Software Foundation, Inc.

   GDBM is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   GDBM is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with GDBM. If not, see <http://www.gnu.org/licenses/>.
*/
#include "autoconf.h"
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <gdbm.h>
#include <errno.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <signal.h>
#include <poll.h>
#include "progname.h"

char const *progname;
char *dbname = "a.gdbm";

enum
  {
    NANO = 1000000000L,
    MICRO = 1000000L,
    MILLI = 1000L,
  };

static inline long
ts_to_ms (struct timespec *ts)
{
  return ts->tv_sec * MILLI + ts->tv_nsec / (NANO / MILLI);
}

static inline long
tv_to_ms (struct timeval *tv)
{
  return tv->tv_sec * MILLI + tv->tv_usec / (MICRO / MILLI);
}

static inline void
timespec_add (struct timespec *a, struct timespec const *b)
{
  a->tv_sec += b->tv_sec;
  a->tv_nsec += b->tv_nsec;
  if (a->tv_nsec >= NANO)
    {
      a->tv_sec += a->tv_nsec / NANO;
      a->tv_nsec %= NANO;
    }
}

pid_t
lockfile (char const *file_name, struct timespec *ts)
{
  pid_t pid;
  int p[2];
  struct pollfd pfd;
  char c;

  if (pipe (p))
    {
      perror ("pipe");
      return -1;
    }

  pid = fork ();
  if (pid == -1)
    {
      perror ("fork");
      abort ();
    }
  if (pid == 0)
    {
      int rc;
      GDBM_FILE dbf;

      close (p[0]);
      dbf = gdbm_open (file_name, 0, GDBM_NEWDB, 0600, NULL);
      if (!dbf)
	{
	  fprintf (stderr, "%s: gdbm_open failed: %s\n",
		   progname, gdbm_strerror (gdbm_errno));
	  _exit (1);
	}
      c = 1;
      write (p[1], &c, 1);
      close (p[1]);
      rc = nanosleep (ts, NULL);
      gdbm_close (dbf);
      _exit (rc == -1);
    }

  close (p[1]);
  pfd.fd = p[0];
  pfd.events = POLLIN;
  switch (poll (&pfd, 1, ts_to_ms (&ts[1]))) {
  case 1:
    if (read (p[0], &c, 1) == 1)
      break;
    /* fall through */
  case 0:
    fprintf (stderr, "%s: failed waiting for database to be created\n",
	     progname);
    kill (pid, SIGKILL);
    pid = -1;
    break;

  default:
    fprintf (stderr, "%s: poll: %s\n", progname, strerror (errno));
    kill (pid, SIGKILL);
    pid = -1;
    break;
  }
  close (p[0]);

  return pid;
}

int
get_timespec (char const *arg, struct timespec *ts)
{
  char *p;

  errno = 0;
  ts->tv_sec = strtol (arg, &p, 10);
  if (errno || ts->tv_sec < 0)
    {
      fprintf (stderr, "%s: invalid duration: %s\n", progname, arg);
      return 1;
    }
  if (*p == '.')
    {
      double x;
      char *q;

      errno = 0;
      x = strtod (p, &q);
      if (errno || *q)
	{
	  fprintf (stderr, "%s: invalid duration: %s\n", progname, arg);
	  return 1;
	}
      ts->tv_nsec = (long) (x * 1e9);
    }
  else
    ts->tv_nsec = 0;
  return 0;
}

static void
cleanup (void)
{
  unlink (dbname);
}

static int sig_fd[2];

static void
sighan (int sig)
{
  write (sig_fd[1], &sig, sizeof (sig));
  close (sig_fd[1]);
}

static int runtest_retry (struct timespec *ts);
static int runtest_signal (struct timespec *ts);

char *usage_text[] = {
  "%s retry T0 T1 T2",
  "   T0 - time interval for locking the newly created database.",
  "   T1 - lock timeout.",
  "   T2 - lock retry interval.",
  "",
  "%s signal T0 T1 [T2]",
  "   T0 - time interval for locking the newly created database.",
  "   T1 - lock timeout.",
  "   T2 - alarm timeout; used to test whether the signal handler is"
  " properly restored.",
  "",
  NULL
};

void
usage (FILE *fp)
{
  int i;
  char *s;

  fprintf (fp, "%s tests locking timeouts\n", progname);
  fprintf (fp, "usage:\n");
  for (i = 0; (s = usage_text[i]) != NULL; i++)
    {
      if (s[0] == 0)
	/* nothing */;
      else if (s[0] == '%' && s[1] == 's')
	fprintf (fp, s, progname);
      else
	fputs (s, fp);
      fputc ('\n', fp);
    }
}

int
main (int argc, char **argv)
{
  int lock_wait;
  struct timespec ts[3];
  pid_t pid;
  int status, rc;

  static int (*runtest[])(struct timespec *) = {
    [GDBM_LOCKWAIT_RETRY] = runtest_retry,
    [GDBM_LOCKWAIT_SIGNAL] = runtest_signal,
  };

  progname = canonical_progname (argv[0]);
  if (argc < 4 || argc > 5)
    {
      fprintf (stderr, "%s: wrong number of arguments\n", progname);
      usage (stderr);
      return 2;
    }

  if (strcmp (argv[1], "retry") == 0)
    lock_wait = GDBM_LOCKWAIT_RETRY;
  else if (strcmp (argv[1], "signal") == 0)
    lock_wait = GDBM_LOCKWAIT_SIGNAL;
  else
    {
      fprintf (stderr, "%s: invalid lock mode\n", progname);
      usage (stderr);
      return 2;
    }

  if (get_timespec (argv[2], &ts[0]))
    return 2;
  if (get_timespec (argv[3], &ts[1]))
    return 2;

  if (argc == 5)
    {
      if (get_timespec (argv[4], &ts[2]))
	return 1;
    }
  else if (lock_wait == GDBM_LOCKWAIT_RETRY)
    {
      fprintf (stderr, "%s: retry mode requires three arguments\n",
	       progname);
      usage (stderr);
      return 2;
    }
  else
    memset (&ts[2], 0, sizeof (ts[2]));

  atexit (cleanup);
  pid = lockfile (dbname, &ts[0]);
  if (pid == (pid_t) -1)
    return 1;

  rc = runtest[lock_wait] (ts + 1);
  if (rc)
    {
      kill (pid, SIGKILL);
      return rc;
    }

  if (waitpid (pid, &status, 0) == (pid_t) -1)
    {
      fprintf (stderr, "%s: wait: %s\n", progname, strerror (errno));
      return 1;
    }
  if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
    {
      fprintf (stderr, "%s: initial locker terminated abnormally\n",
	       progname);
      return 1;
    }

  return 0;
}

static int
runtest_retry (struct timespec *ts)
{
  struct gdbm_open_spec op = GDBM_OPEN_SPEC_INITIALIZER;
  GDBM_FILE dbf;

  op.lock_wait = GDBM_LOCKWAIT_RETRY;
  op.lock_timeout = ts[0];
  op.lock_interval = ts[1];

  dbf = gdbm_open_ext (dbname, GDBM_WRITER, &op);
  if (!dbf)
    {
      fprintf (stderr, "%s: can't open database: %s (%s)\n",
	       progname, gdbm_strerror (gdbm_errno), strerror (errno));
      return 1;
    }
  gdbm_close (dbf);

  return 0;
}

static int
runtest_signal (struct timespec *ts)
{
  struct gdbm_open_spec op = GDBM_OPEN_SPEC_INITIALIZER;
  long start = 0;
  GDBM_FILE dbf;

  if (!(ts[1].tv_sec == 0 && ts[1].tv_nsec == 0))
    {
      struct sigaction act;

      if (pipe (sig_fd))
	{
	  perror ("pipe");
	  return 1;
	}

      act.sa_handler = sighan;
      sigemptyset (&act.sa_mask);
      act.sa_flags = SA_RESETHAND;
      if (sigaction (SIGALRM, &act, NULL))
	{
	  fprintf (stderr, "%s: sigaction: %s", progname, strerror (errno));
	  return -1;
	}
    }

  op.lock_wait = GDBM_LOCKWAIT_SIGNAL;
  op.lock_timeout = ts[0];
  dbf = gdbm_open_ext (dbname, GDBM_WRITER, &op);
  if (!dbf)
    {
      fprintf (stderr, "%s: can't open database: %s (%s)\n",
	       progname, gdbm_strerror (gdbm_errno), strerror (errno));
      return 1;
    }
  gdbm_close (dbf);

  if (!(ts[1].tv_sec == 0 && ts[1].tv_nsec == 0))
    {
      struct pollfd pfd;
      struct timeval now;
      int n, t, sig;

      alarm (ts_to_ms (&ts[1]) / MILLI);
      gettimeofday (&now, NULL);
      start = tv_to_ms (&now);

      pfd.fd = sig_fd[0];
      pfd.events = POLLIN;

      do
	{
	  gettimeofday (&now, NULL);
	  t = ts_to_ms (&ts[1]) - tv_to_ms (&now) + start + MILLI;
	  if (t < 0)
	    {
	      n = 0;
	      break;
	    }
	}
      while ((n = poll (&pfd, 1, t)) == -1 && errno == EINTR);

      switch (n)
	{
	case 1:
	  if (read (sig_fd[0], &sig, sizeof (sig)) != sizeof (sig))
	    {
	      fprintf (stderr, "%s: read: %s\n", progname, strerror (errno));
	      return 1;
	    }
	  close (sig_fd[0]);
	  if (sig != SIGALRM)
	    {
	      fprintf (stderr, "%s: unexpected data read\n", progname);
	      return 1;
	    }
	  break;

	case 0:
	  fprintf (stderr, "%s: failed waiting for alarm\n", progname);
	  return 1;

	default:
	  if (errno != EINTR)
	    {
	      fprintf (stderr, "%s: poll: %s\n",
		       progname, strerror (errno));
	      return 1;
	    }
	}
    }

  return 0;
}
