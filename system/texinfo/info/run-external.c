/* file-util.c: running program and getting the output

   Copyright 2025-2026 Free Software Foundation, Inc.

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

#include "system.h"

#include <unistd.h>
#include <stdio.h>
#if defined (HAVE_SYS_TIME_H)
#include <sys/time.h>
#endif
#if defined (HAVE_SYS_WAIT_H)
#include <sys/wait.h>
#endif

#include "run-external.h"

/* From gnulib */
#include "xalloc.h"


static char *read_from_fd (int fd);

/* Run program FILENAME with arguments FORMATTER_ARGS.  Save what it
   prints to stdout in *PROGRAM_OUTPUT if PROGRAM_OUTPUT is non-null.
   If DISCARD_STDERR, try to hide output printed to stderr.  Return exit
   status of program or 127 if there was a problem with running it. */
int
get_output_from_program (char *filename, char *formatter_args[],
                         char **program_output, int discard_stderr)
{
  int pipes[2];
  int exit_status = 0;
  char *output = NULL;

  /* Open a pipe to this program, read the output, and save it away
     in FORMATTED_PAGE.  The reader end of the pipe is pipes[0]; the
     writer end is pipes[1]. */
#if PIPE_USE_FORK
  if (pipe (pipes) == -1)
    return 127; /* Creating pipe failed. */

  pid_t child = fork ();
  if (child == -1)
    return 127;

  if (child != 0)
    {
      /* In the parent, close the writing end of the pipe, and read from
         the exec'd child. */
      close (pipes[1]);
      output = read_from_fd (pipes[0]);
      close (pipes[0]);
      wait (&exit_status); /* Wait for child process to exit. */
    }
  else
    { /* In the child, close the read end of the pipe, make the write end
         of the pipe be stdout, and execute the man page formatter. */
      close (pipes[0]);
      (void)! freopen (NULL_DEVICE, "r", stdin);
      if (discard_stderr)
        (void)! freopen (NULL_DEVICE, "w", stderr);

      dup2 (pipes[1], fileno (stdout));

      execv (filename, formatter_args);

      /* If we get here, we couldn't exec, so close out the pipe and
         exit. */
      close (pipes[1]);
      exit (EXIT_FAILURE);
    }
#else  /* !PIPE_USE_FORK */
  /* Cannot fork/exec, but can popen/pclose.  */
  {
    FILE *fpipe;
    char *cmdline;
    int save_stderr = dup (fileno (stderr));
    int fd_err = open (NULL_DEVICE, O_WRONLY, 0666);
    size_t cmdlen = strlen (filename);
    int i;

#ifdef __MINGW32__
    /* Mirror all forward slashes in FILENAME to backslashes, since
       otherwise the Windows shell might fail to run the script.  */
    filename = xstrdup (filename);
    for (i = 0; i < cmdlen; i++)
      if (filename[i] == '/')
	filename[i] = '\\';
#endif

    for (i = 1; formatter_args[i]; i++)
      cmdlen += strlen (formatter_args[i]);
    /* Add-ons: 2 blanks, 2 quotes for the formatter program, 1
       terminating null character.  */
    cmdlen += 2 + 2 + 1;
    cmdline = xmalloc (cmdlen);

    if (fd_err > 2)
      dup2 (fd_err, fileno (stderr)); /* Don't print errors. */
    sprintf (cmdline, "\"%s\" %s %s", filename,
	     formatter_args[1], formatter_args[2] ? formatter_args[2] : "");
#ifdef __MINGW32__
    free (filename);
#endif
    fpipe = popen (cmdline, "r");
    free (cmdline);
    if (fd_err > 2)
      close (fd_err);
    dup2 (save_stderr, fileno (stderr));
    if (fpipe == 0)
      return 127;
    output = read_from_fd (fileno (fpipe));
    int pclose_status = pclose (fpipe);
    if (pclose_status != -1)
      exit_status = pclose_status;
    else
      {
        /* unknown error */
        free (output);
        return 127;
      }
  }
#endif /* !PIPE_USE_FORK */

  if (program_output)
    *program_output = output;
  else
    free (output);

#if defined (HAVE_SYS_WAIT_H)
  return WIFEXITED(exit_status) ? WEXITSTATUS(exit_status) : 127;
#else
  /* This block is most likely used if we are coming from popen above,
     as is the case on MinGW. */
  return exit_status;
#endif
}

/* Return pointer to bytes read from file descriptor FD.  Return value to be
   freed by caller. */
static char *
read_from_fd (int fd)
{
  struct timeval timeout;
  char *buffer = NULL;
  int bsize = 0;
  int bindex = 0;
  int select_result;
#if defined (FD_SET)
  fd_set read_fds;

  timeout.tv_sec = 15;
  timeout.tv_usec = 0;

  FD_ZERO (&read_fds);
  FD_SET (fd, &read_fds);

  select_result = select (fd + 1, &read_fds, 0, 0, &timeout);
#else /* !FD_SET */
  select_result = 1;
#endif /* !FD_SET */

  switch (select_result)
    {
    case 0:
    case -1:
      break;

    default:
      {
        int amount_read;
        int done = 0;

        while (!done)
          {
            while ((bindex + 1024) > (bsize))
              buffer = xrealloc (buffer, (bsize += 1024));
            buffer[bindex] = '\0';

            amount_read = read (fd, buffer + bindex, 1023);

            if (amount_read < 0)
              {
                done = 1;
              }
            else
              {
                bindex += amount_read;
                buffer[bindex] = '\0';
                if (amount_read == 0)
                  done = 1;
              }
          }
      }
    }

  if ((buffer != NULL) && (*buffer == '\0'))
    {
      free (buffer);
      buffer = NULL;
    }

  return buffer;
}

