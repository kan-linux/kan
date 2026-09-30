/* filesys.c -- filesystem specific functions.

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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#include "info.h"
#include "tilde.h"
#include "filesys.h"
#include "session.h"

/* Local to this file. */
static char *info_file_in_path (const char *filename, struct stat *finfo);

static char *filesys_read_compressed (char *pathname, size_t *filesize);

typedef struct
{
  char *suffix;
  char *decompressor;
  const char *args[2];
} COMPRESSION_ALIST;

static COMPRESSION_ALIST *filesys_decompressor_for_file (char *filename);
static int compressed_filename_p (char *filename);

static char *info_suffixes[] = {
  ".info",
  "-info",
  ".inf",       /* 8+3 file on filesystem which supports long file names */
#ifdef __MSDOS__
  /* 8+3 file names strike again...  */
  ".in",        /* for .inz, .igz etc. */
  ".i",
#endif
  "",
  NULL
};

static COMPRESSION_ALIST compress_suffixes[] = {
#if STRIP_DOT_EXE
  { ".gz", "gunzip" },
  { ".lz", "lunzip" },
#else
  { ".gz", "gzip", "-d" },
  { ".lz", "lzip", "-d" },
#endif
  { ".xz", "unxz" },
  { ".bz2", "bunzip2" },
  { ".z", "gunzip" },
  { ".lzma", "unlzma" },
  { ".Z", "uncompress" },
  { ".zst", "unzstd", "--rm", "-q" },
  { ".Y", "unyabba" },
#ifdef __MSDOS__
  { "gz", "gunzip" },
  { "z", "gunzip" },
#endif
  { NULL, NULL }
};
/* Note: unspecified args default to null. */

/* Look for the filename PARTIAL in INFOPATH in order to find the correct file.
   Return file name and set *FINFO with information about file.  If it
   can't find the file, it returns NULL, and sets filesys_error_number.
   Return value should be freed by caller. */
char *
info_find_fullpath (const char *partial, struct stat *finfo)
{
  char *fullpath = 0;
  struct stat dummy;

  debug(1, (_("looking for file \"%s\""), partial));

  if (!finfo)
    finfo = &dummy;

  filesys_error_number = 0;

  if (!partial || !*partial)
    return 0;
  
  /* IS_SLASH and IS_ABSOLUTE defined in ../system.h. */

  /* If path is absolute already, see if it needs an extension. */
  if (IS_ABSOLUTE (partial)
      || partial[0] == '.' && IS_SLASH(partial[1]))
    {
      fullpath = info_file_of_infodir (partial, 0, finfo);
    }

  /* Tilde expansion.  Could come from user input in echo area. */
  else if (partial[0] == '~')
    {
      partial = tilde_expand_word (partial);
      fullpath = info_file_of_infodir (partial, 0, finfo);
    }

  /* If just a simple name element, look for it in the path. */
  else
    fullpath = info_file_in_path (partial, finfo);

  if (!fullpath)
    filesys_error_number = ENOENT;

  return fullpath;
}

/* Scan the directories in search path looking for FILENAME.  If we find
   one that is a regular file, return it as a new string.  Otherwise, return
   a NULL pointer.  Set *FINFO with information about file. */
char *
info_file_find_next_in_path (const char *filename, int *path_index,
                             struct stat *finfo)
{
  struct stat dummy;

  /* Used for output of stat in case the caller doesn't care about
     its value. */
  if (!finfo)
    finfo = &dummy;

  /* Reject ridiculous cases up front, to prevent infinite recursion
     later on.  E.g., someone might say "info '(.)foo'"...  */
  if (!*filename || STREQ (filename, ".") || STREQ (filename, ".."))
    return NULL;

  while (1)
    {
      char *dirname, *with_extension = 0;

      dirname = infopath_next (path_index);
      if (!dirname)
        break;

      debug(1, (_("looking for file %s in %s"), filename, dirname));

      /* Expand a leading tilde if one is present. */
      if (*dirname == '~')
        {
          char *expanded_dirname = tilde_expand_word (dirname);
          dirname = expanded_dirname;
        }

      with_extension = info_file_of_infodir (filename, dirname, finfo);

      if (with_extension)
        {
          if (!IS_ABSOLUTE (with_extension))
            {
              /* Prefix "./" to it. */
              char *s;
              xasprintf (&s, "%s%s", "./", with_extension);
              free (with_extension);
              return s;
            }
          else
            return with_extension;
        }
    }
  return NULL;
}

/* Return full path of first Info file known as FILENAME in search path as a
   new string.  If relative to current directory, precede it with './'. */
static char *
info_file_in_path (const char *filename, struct stat *finfo)
{
  int i = 0;
  return info_file_find_next_in_path (filename, &i, finfo);
}

/* Check if TRY_FILENAME exists, possibly compressed.  If so, return
   filename in TRY_FILENAME. */
char *
info_check_compressed (char *try_filename, struct stat *finfo)
{
  int statable = (stat (try_filename, finfo) == 0);

  if (statable)
    {
      if (S_ISREG (finfo->st_mode))
        {
          debug(1, (_("found file %s"), try_filename));
          return try_filename;
        }
    }
  else
    {
      /* Add various compression suffixes to the name to see if
         the file is present in compressed format. */
      register int j, pre_compress_suffix_length;

      pre_compress_suffix_length = strlen (try_filename);

      for (j = 0; compress_suffixes[j].suffix; j++)
        {
          strcpy (try_filename + pre_compress_suffix_length,
                  compress_suffixes[j].suffix);

          statable = (stat (try_filename, finfo) == 0);
          if (statable && (S_ISREG (finfo->st_mode)))
            {
              debug(1, (_("found file %s"), try_filename));
              return try_filename;
            }
        }
    }
  return 0;
}

/* Look for a file called FILENAME in a directory called DIRNAME, adding file
   extensions if necessary.  FILENAME can be an absolute path or a path
   relative to the current directory, in which case DIRNAME should be
   null.  Return it as a new string; otherwise return a NULL pointer. */
char *
info_file_of_infodir (const char *filename, const char *dirname,
                      struct stat *finfo)
{
  char *try_filename;
  register int i, pre_suffix_length = 0;
  struct stat dummy;

  if (!finfo)
    finfo = &dummy;

  if (dirname)
    pre_suffix_length += strlen (dirname);

  pre_suffix_length += strlen (filename);

  /* Add enough space for any file extensions at end. */
  try_filename = xmalloc (pre_suffix_length + 30);
  try_filename[0] = '\0';

  if (dirname)
    {
      strcpy (try_filename, dirname);
      if (!IS_SLASH (try_filename[(strlen (try_filename)) - 1]))
        {
          strcat (try_filename, "/");
          pre_suffix_length++;
        }
    }

  strcat (try_filename, filename);

  for (i = 0; info_suffixes[i]; i++)
    {
      char *result;
      strcpy (try_filename + pre_suffix_length, info_suffixes[i]);

      result = info_check_compressed (try_filename, finfo);
      if (result)
        return result;
    }
  /* Nothing was found. */
  free (try_filename);
  return 0;
}

#if defined (__MSDOS__) || defined (__MINGW32__)
/* Given a chunk of text and its length, convert all CRLF pairs at every
   end-of-line into a single Newline character.  Return the length of
   produced text.

   This is required because the rest of code is too entrenched in having
   a single newline at each EOL; in particular, searching for various
   Info headers and cookies can become extremely tricky if that assumption
   breaks. */
static size_t
convert_eols (char *text, size_t textlen)
{
  register char *s = text;
  register char *d = text;

  while (textlen--)
    {
      if (*s == '\r' && textlen && s[1] == '\n')
       {
         s++;
         textlen--;
       }
      *d++ = *s++;
    }

  return d - text;
}
#endif

/* Read the contents of PATHNAME, returning a buffer with the contents of
   that file in it, and returning the size of that buffer in FILESIZE.
   If the file turns out to be compressed, set IS_COMPRESSED to non-zero.
   If the file cannot be read, set filesys_error_number and return a NULL
   pointer.  Set *FINFO with information about file. */
char *
filesys_read_info_file (char *pathname, size_t *filesize,
			struct stat *finfo, int *is_compressed)
{
  off_t stat_fsize;
  size_t file_size;
  char *contents;

  filesys_error_number = 0;

  stat (pathname, finfo);
  stat_fsize = finfo->st_size;

  /* shouldn't happen but this silences a -Wstringop-overflow warning
     on gcc 13.3.0. */
  if (stat_fsize < 0)
    stat_fsize = 0;

  if (compressed_filename_p (pathname))
    {
      /* NOTE convert positive unsigned off_t to size_t */
      file_size = stat_fsize;
      *is_compressed = 1;

      contents = filesys_read_compressed (pathname, &file_size);
    }
  else
    {
      int descriptor;
      ssize_t read_file_size = stat_fsize;

      *is_compressed = 0;
      descriptor = open (pathname, O_RDONLY | O_BINARY, 0666);

      /* If the file couldn't be opened, give up. */
      if (descriptor < 0)
        {
          filesys_error_number = errno;
          return NULL;
        }

      /* Try to read the contents of this file. */
      contents = xmalloc (1 + read_file_size);
      if ((read (descriptor, contents, read_file_size)) != read_file_size)
        {
	  filesys_error_number = errno;
	  close (descriptor);
	  free (contents);
	  return NULL;
        }
      contents[read_file_size] = 0;
      close (descriptor);
      /* NOTE convert positive unsigned ssize_t to size_t */
      file_size = read_file_size;
    }

#if defined (__MSDOS__) || defined (__MINGW32__)
  /* Old versions of makeinfo on MS-DOS or MS-Windows generated Info files
     with CR-LF line endings which are only counted as one byte in the file
     tag table.  Convert any of these DOS-style CRLF EOLs into Unix-style NL
     so that these files can be read correctly on such operating systems.

     Don't do this on GNU/Linux (or other Unix-type operating system), so
     as not to encourage Info files with CR-LF line endings to be distributed
     widely beyond their native operating system, which would cause only
     problems.  (If someone really needs to, they can convert the line endings
     themselves with a separate program.)
     Also, this will allow any Info files that contain any CR-LF endings by
     mistake to work as expected (except on MS-DOS/Windows). */

  file_size = convert_eols (contents, file_size);

  /* EOL conversion can shrink the text quite a bit.  We don't
     want to waste storage.  */
  contents = xrealloc (contents, 1 + file_size);
  contents[file_size] = '\0';
#endif

  *filesize = file_size;

  return contents;
}

/* Typically, pipe buffers are 4k. */
#define BASIC_PIPE_BUFFER (4 * 1024)

/* We use some large multiple of that. */
#define FILESYS_PIPE_BUFFER_SIZE (16 * BASIC_PIPE_BUFFER)

static char *filesys_read_from_stream (FILE *stream, size_t *filesize);

static char *
filesys_read_compressed (char *pathname, size_t *filesize)
{
  FILE *stream;
  char *command, *command_line;
  COMPRESSION_ALIST *decompressor;
  char *contents = NULL;

  *filesize = filesys_error_number = 0;

  decompressor = filesys_decompressor_for_file (pathname);

  if (!decompressor)
    return NULL;

  size_t command_len = 0;
  command_len += strlen (decompressor->decompressor) + 1;

  if (STRIP_DOT_EXE)
    {
      command_len += strlen (".exe");
    }

  int decompressor_nargs = sizeof (decompressor->args)
                          /sizeof (decompressor->args[0]);
  int i;
  for (i = 0; i < decompressor_nargs; i++)
    {
      if (decompressor->args[i])
        {
          /* + 1 for space or terminating null */
          command_len += strlen (decompressor->args[i]) + 1;
        }
    }

  command = xmalloc (command_len);

  char *p = command;
  strcpy (p, decompressor->decompressor);
  p += strlen (decompressor->decompressor);

  if (STRIP_DOT_EXE)
    {
      /* Explicit .exe suffix makes the diagnostics of `popen'
         better on systems where COMMAND.COM is the stock shell.  */
      strcpy (p, ".exe");
      p += strlen (".exe");
    }

  for (i = 0; i < decompressor_nargs; i++)
    {
      if (decompressor->args[i])
        {
          strcpy (p++, " ");
          strcpy (p, decompressor->args[i]);
          p += strlen (decompressor->args[i]);
        }
    }

  xasprintf (&command_line, "%s < %s", command, pathname);

  if (info_windows_initialized_p)
    {
      char *temp;

      temp = xmalloc (5 + strlen (command_line));
      sprintf (temp, "%s...", command_line);
      message_in_echo_area ("%s", temp);
      free (temp);
    }

#if PIPE_USE_FORK
  int pipes[2];
  if (pipe (pipes) == -1)
    goto cleanup;

  pid_t child = fork ();
  if (child == -1)
    goto cleanup;

  if (child != 0)
    {
      /* In parent. */
      close (pipes[1]); /* close writing end */
      stream = fdopen (pipes[0], "r");
      if (stream)
        contents = filesys_read_from_stream (stream, filesize);
    }
  else
    {
      /* In child. */
      close (pipes[0]); /* close reading end */

      FILE *new_stdin = freopen (pathname, "r", stdin);
      if (!new_stdin)
        exit (1); /* couldn't open file */

      dup2 (pipes[1], fileno (stdout));

      /* command name, max two arguments, and terminator */
      static const char *argv[4];
      argv[0] = decompressor->decompressor;
      argv[1] = decompressor->args[0];
      argv[2] = decompressor->args[1];
      argv[3] = NULL;

      execvp (decompressor->decompressor, (char * const *) argv);

      /* couldn't exec. */
      close (pipes[1]);
      exit (1);
    }
#else /* !PIPE_USE_FORK */
  stream = popen (command_line, FOPEN_RBIN);

  /* Read chunks from this file until there are none left to read. */
  if (stream)
    contents = filesys_read_from_stream (stream, filesize);
  else
    filesys_error_number = errno;
#endif /* !PIPE_USE_FORK */

 cleanup:
  free (command);
  free (command_line);

  if (info_windows_initialized_p)
    unmessage_in_echo_area ();
  return contents;
}

static char *
filesys_read_from_stream (FILE *stream, size_t *filesize)
{
  size_t offset, size;
  char *chunk;
  char *contents = NULL;

  offset = size = 0;
  chunk = xmalloc (FILESYS_PIPE_BUFFER_SIZE);

  while (1)
    {
      size_t bytes_read;

      bytes_read = fread (chunk, 1, FILESYS_PIPE_BUFFER_SIZE, stream);

      if (bytes_read + offset >= size)
        contents = xrealloc
          (contents, size += (2 * FILESYS_PIPE_BUFFER_SIZE));

      memcpy (contents + offset, chunk, bytes_read);
      offset += bytes_read;
      if (bytes_read != FILESYS_PIPE_BUFFER_SIZE)
        break;
    }

  free (chunk);
  if (fclose (stream) == -1)
    {
      if (contents)
        free (contents);
      contents = NULL;
      filesys_error_number = errno;
    }
  else
    {
      contents = xrealloc (contents, 1 + offset);
      contents[offset] = '\0';
      *filesize = offset;
    }

  return contents;
}

/* Return non-zero if FILENAME belongs to a compressed file. */
static int
compressed_filename_p (char *filename)
{
  COMPRESSION_ALIST *decompressor;

  /* Find the final extension of this filename, and see if it matches one
     of our known ones. */
  decompressor = filesys_decompressor_for_file (filename);

  if (decompressor)
    return 1;
  else
    return 0;
}

/* Return information on how to to decompress FILENAME. */
static COMPRESSION_ALIST *
filesys_decompressor_for_file (char *filename)
{
  register int i;
  char *extension = NULL;

  /* Find the final extension of FILENAME, and see if it appears in our
     list of known compression extensions. */
  for (i = strlen (filename) - 1; i > 0; i--)
    if (filename[i] == '.')
      {
        extension = filename + i;
        break;
      }

  if (!extension)
    return NULL;

  for (i = 0; compress_suffixes[i].suffix; i++)
    if (FILENAME_CMP (extension, compress_suffixes[i].suffix) == 0)
      return &compress_suffixes[i];

#if defined (__MSDOS__)
  /* If no other suffix matched, allow any extension which ends
     with `z' to be decompressed by gunzip.  Due to limited 8+3 DOS
     file namespace, we can expect many such cases, and supporting
     every weird suffix thus produced would be a pain.  */
  if (extension[strlen (extension) - 1] == 'z' ||
      extension[strlen (extension) - 1] == 'Z')
    return filesys_decompressor_for_file ("XXX.gz");
#endif

  return NULL;
}

/* The number of the most recent file system error. */
int filesys_error_number = 0;

/* Return string for ERROR_NUM when opening file.  Return value should
   be freed by caller. */
char *
filesys_error_string (char *filename, int error_num)
{
  char *errmsg_buf;

  if (error_num == 0)
    return NULL;

  xasprintf (&errmsg_buf, "%s: %s", filename, strerror (error_num));
  return errmsg_buf;
}


/* Check for "dir" with all the possible info and compression suffixes,
   in combination.  */

int
is_dir_name (const char *filename)
{
  unsigned i;

  for (i = 0; info_suffixes[i]; i++)
    {
      unsigned c;
      char trydir[50];
      strcpy (trydir, "dir");
      strcat (trydir, info_suffixes[i]);
      
      if (mbscasecmp (filename, trydir) == 0)
        return 1;

      for (c = 0; compress_suffixes[c].suffix; c++)
        {
          char dir_compressed[50]; /* can be short */
          strcpy (dir_compressed, trydir); 
          strcat (dir_compressed, compress_suffixes[c].suffix);
          if (mbscasecmp (filename, dir_compressed) == 0)
            return 1;
        }
    }  

  return 0;
}
