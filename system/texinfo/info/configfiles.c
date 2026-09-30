/* configfiles.c -- config files location

   Copyright 1993-2026 Free Software Foundation, Inc.

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


#include "info.h"
#include "run-external.h"

#if defined (HAVE_SYS_WAIT_H)
#include <sys/wait.h>
#endif

/* To find "infokey file", where user defs are kept and read by Info.  */
#define PACKAGE      "texinfo"

static char *locate_init_file_internal (const char *, const char *);

char *
locate_init_file (const char *init_file, const char *dot_init_file)
{
  char *result = locate_init_file_internal (init_file, dot_init_file);
  if (result)
    debug (1, ("found init file %s", result));
  else
    debug (1, ("no init file `%s' found", init_file));
  return result;
}

static int
init_file_stat (const char *filename, struct stat *buf)
{
  debug (1, ("checking for init file at %s", filename));
  return stat (filename, buf);
}

/* Locate init file.   Check for DOT_INIT_FILE under home directory, then
   for INIT_FILE in XDG locations.

   Return value to be freed by caller.

   See the "XDG Base Directory Specification" at
   https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
*/
static char *
locate_init_file_internal (const char *init_file, const char *dot_init_file)
{
  struct stat finfo;
  char *xdg_config_home, *homedir;
  char *filename = 0;

  homedir = getenv ("HOME");
#ifdef __MINGW32__
  if (!homedir)
    homedir = getenv ("USERPROFILE");
#endif

  /* First, check for init file in home directory. */
  if (dot_init_file)
    {
      if (homedir)
        {
          filename = xmalloc (strlen (homedir) + 2 + strlen (dot_init_file));
          sprintf (filename, "%s/%s", homedir, dot_init_file);
        }
#if defined(__MSDOS__) || defined(__MINGW32__)
      /* Poor baby, she doesn't have a HOME...  */
      else
        filename = xstrdup (dot_init_file); /* try current directory */
#endif

      if (filename)
        {
          if (init_file_stat (filename, &finfo) == 0)
            return filename;
          free (filename);
        };
    }

  /* Then, try XDG locations. */
  xdg_config_home = getenv ("XDG_CONFIG_HOME");
  if (xdg_config_home)
    {
      xdg_config_home = strdup (xdg_config_home);
    }
  else if (homedir)
    {
      xdg_config_home = xmalloc (strlen (homedir)
                                 + strlen ("/.config") + 1);
      sprintf (xdg_config_home, "%s/%s", homedir, ".config");
    }

  if (xdg_config_home)
    {
      filename = xmalloc (strlen (xdg_config_home) + 1
                          + strlen (PACKAGE) + 1
                          + strlen (init_file) + 1);
      sprintf (filename, "%s/%s/%s",
               xdg_config_home, PACKAGE, init_file);
      free (xdg_config_home);

      if (init_file_stat (filename, &finfo) == 0)
        return filename;
      free (filename);
    }

  /* Next, check sysconfdir. */
#ifdef SYSCONFDIR
  filename = xmalloc (strlen (SYSCONFDIR) + strlen("/xdg/")
                      + strlen (PACKAGE) + 1
                      + strlen (init_file) + 1);
  sprintf (filename, "%s/xdg/%s/%s", SYSCONFDIR, PACKAGE, init_file);
  if (init_file_stat (filename, &finfo) == 0)
    return filename;
  free (filename);
#endif

  /* Check through XDG_CONFIG_DIRS. */
  char *xdg_config_dirs = getenv ("XDG_CONFIG_DIRS");
  if (!xdg_config_dirs)
    return 0;

  char *xdg_config_dirs_split = xstrdup (xdg_config_dirs);

  char *dir = strtok (xdg_config_dirs_split, ":");
  while (dir)
    {
      filename = xmalloc (strlen (dir) + 1
                          + strlen (PACKAGE) + 1
                          + strlen (init_file) + 1);
      sprintf (filename, "%s/%s/%s", dir, PACKAGE, init_file);
      if (init_file_stat (filename, &finfo) == 0)
        {
          free (xdg_config_dirs_split);
          return filename;
        }
      free (filename);
      dir = strtok (NULL, ":");
    }

  free (xdg_config_dirs_split);

  /* Finally, check installed location. */
#ifdef PKGDATADIR
  filename = xmalloc (strlen (PKGDATADIR) + 1
                      + strlen (init_file) + 1);
  sprintf (filename, "%s/%s", PKGDATADIR, init_file);
  if (init_file_stat (filename, &finfo) == 0)
    return filename;
  free (filename);
#endif
  return 0;
}

#define INFO_HOOKS_DIR "info-hooks"

/* Run info hook and return exit status.  Return 127 if not found (same
   as bash exit status for command not found). */
int
run_info_hook (const char *hook, char *argv[], char **hook_output)
{
#define exit_notfound 127
  char *hook_name;
  char *hook_file;
  const char *hook_ext = "";

  debug (1, ("running %s hook", hook));

#ifdef __MINGW32__
  hook_ext = ".cmd";
#endif

  hook_name = xmalloc (strlen (INFO_HOOKS_DIR) + strlen ("/")
                       + strlen (hook) + strlen (hook_ext) + 1);
  sprintf (hook_name, "%s/%s%s", INFO_HOOKS_DIR, hook, hook_ext);
  hook_file = locate_init_file (hook_name, 0);
  free (hook_name);
  if (!hook_file)
    return exit_notfound;
#undef exit_notfound

  int exit_status = get_output_from_program (hook_file, argv, hook_output,
                                             info_windows_initialized_p);
  debug (1, ("hook exited with status %d", exit_status));
  free (hook_file);
  return exit_status;
}
