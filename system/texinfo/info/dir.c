/* dir.c -- how to build a special "dir" node

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
#include "util.h"
#include "scan.h"
#include "search.h"
#include "filesys.h"

static void add_menu_to_node (char *contents, size_t size, NODE *node);
static void insert_text_into_node (NODE *node, size_t start,
    char *text, size_t textlen);

static NODE *dir_node = 0;

static NODE *build_dir_node (void);

/* Return composite directory node. */
NODE *
get_dir_node (void)
{
  if (!dir_node)
    dir_node = build_dir_node ();

  return replicate_node (dir_node);
}

static NODE *
build_dir_node (void)
{
  int path_index = 0, n_dirs = 0;
  char *dir_filename = info_file_find_next_in_path ("dir", &path_index, 0);
  if (!dir_filename)
    goto emergency_dir;

  FILE_BUFFER *dir_fb = info_find_file (dir_filename);
  NODE *dir_node = info_get_node_of_file_buffer (dir_fb, "Top");
  if (!dir_node)
    {
      free (dir_filename);
      goto emergency_dir;
    }

  struct text_buffer buf;
  text_buffer_init (&buf);
  text_buffer_printf (&buf, "%s\n\n", INFO_MENU_LABEL);
  text_buffer_printf (&buf, "%s", _("Dir files used for this node\n\n"));
  text_buffer_printf (&buf, "* dir %d: (%s)Top.\n", ++n_dirs, dir_filename);
  free (dir_filename);

  char *next_dir_file = 0;
  NODE *next_dir_node;
  while ((next_dir_file = info_file_find_next_in_path ("dir", &path_index, 0)))
    {
      FILE_BUFFER *next_dir_fb = info_find_file (next_dir_file);
      if (next_dir_fb)
        {
          next_dir_node = info_get_node_of_file_buffer (next_dir_fb, "Top");
          if (next_dir_node)
            {
              text_buffer_printf (&buf,
                            "* dir %d: (%s)Top.\n", ++n_dirs, next_dir_file);

              if (next_dir_node->contents)
                add_menu_to_node (next_dir_node->contents, next_dir_node->nodelen,
                                  dir_node);
              free (next_dir_node);
            }
        }
      free (next_dir_file);
    }

  /* Add a menu of dir files at the end of the composite dir node, if
     more than one was used. */
  if (n_dirs > 0)
    add_menu_to_node (text_buffer_base(&buf), text_buffer_off(&buf), dir_node);
  text_buffer_free (&buf);

  dir_node->flags |= N_IsDir;
  dir_node->fullpath = xstrdup ("dir");
  scan_node_contents (dir_node, 0, 0);
  return dir_node;

emergency_dir:
  dir_node = info_create_node ();
  dir_node->nodename = xstrdup ("Top");
  dir_node->fullpath = xstrdup ("dir");
  dir_node->contents = xstrdup ("File: dir,	Node: Top\n"
    "\n"
    "No dir file was found on your system.\n");
  dir_node->nodelen = strlen (dir_node->contents);
  dir_node->flags |= N_IsDir;
  scan_node_contents (dir_node, 0, 0);
  return dir_node;
}

/* Given CONTENTS and NODE, add the menu found in CONTENTS to the menu
   found in NODE->contents.  SIZE is the total size of CONTENTS. */
static void
add_menu_to_node (char *contents, size_t size, NODE *node)
{
  SEARCH_BINDING contents_binding, fb_binding;
  long contents_offset, fb_offset;

  contents_binding.buffer = contents;
  contents_binding.start = 0;
  contents_binding.end = size;
  contents_binding.flags = S_FoldCase | S_SkipDest;

  fb_binding.buffer = node->contents;
  fb_binding.start = 0;
  fb_binding.end = node->nodelen;
  fb_binding.flags = S_FoldCase | S_SkipDest;

  /* Move to the start of the menus in CONTENTS and NODE. */
  if (search_forward (INFO_MENU_LABEL, &contents_binding, &contents_offset)
      != search_success)
    /* If there is no menu in CONTENTS, quit now. */
    return;

  /* There is a menu in CONTENTS, and contents_offset points to the first
     character following the menu starter string.  Skip all whitespace
     and newline characters. */
  contents_offset += skip_whitespace_and_newlines (contents + contents_offset);

  /* If there is no menu in NODE, make one. */
  if (search_forward (INFO_MENU_LABEL, &fb_binding, &fb_offset)
      != search_success)
    {
      insert_text_into_node
        (node, node->nodelen, INFO_MENU_LABEL, strlen (INFO_MENU_LABEL));

      fb_binding.buffer = node->contents;
      fb_binding.start = 0;
      fb_binding.end = node->nodelen;
      if (search_forward (INFO_MENU_LABEL, &fb_binding, &fb_offset)
           != search_success)
        abort ();
    }

  /* CONTENTS_OFFSET and FB_OFFSET point to the starts of the menus that
     appear in their respective buffers.  Add the remainder of CONTENTS
     to the end of NODE's menu. */
  fb_binding.start = fb_offset;
  fb_offset = find_node_separator (&fb_binding);
  if (fb_offset != -1)
    fb_binding.start = fb_offset;
  else
    fb_binding.start = fb_binding.end;

  /* Leave exactly one blank line between directory entries. */
  {
    int num_found = 0;

    while ((fb_binding.start > 0) &&
           (whitespace_or_newline (fb_binding.buffer[fb_binding.start - 1])))
      {
        num_found++;
        fb_binding.start--;
      }

    /* Optimize if possible. */
    if (num_found >= 2)
      {
        fb_binding.buffer[fb_binding.start++] = '\n';
        fb_binding.buffer[fb_binding.start++] = '\n';
      }
    else
      {
        /* Do it the hard way. */
        insert_text_into_node (node, fb_binding.start, "\n\n", 2);
        fb_binding.start += 2;
      }
  }

  /* Insert the new menu. */
  insert_text_into_node
    (node, fb_binding.start, contents + contents_offset, size - contents_offset);
}

static void
insert_text_into_node (NODE *node, size_t start, char *text, size_t textlen)
{
  char *contents;
  long end;

  end = node->nodelen;

  contents = xmalloc (node->nodelen + textlen + 1);
  memcpy (contents, node->contents, start);
  memcpy (contents + start, text, textlen);
  memcpy (contents + start + textlen, node->contents + start, end - start + 1);
  if (node->flags & N_WasRewritten)
    free (node->contents);
  node->contents = contents;
  node->flags |= N_WasRewritten;
  node->nodelen += textlen;
}

/* Return directory entry. */
const REFERENCE *
lookup_dir_entry (const char *label, int sloppy)
{
  const REFERENCE *entry;

  if (!dir_node)
    dir_node = build_dir_node ();

  entry = info_get_menu_entry_by_label (dir_node, label, sloppy);

  return entry;
}

/* Look up entry in "dir" in search directory.  Return
   value is a pointer to a newly allocated REFERENCE. */
const REFERENCE *
dir_entry_of_infodir (const char *label, const char *searchdir)
{
  char *dir_fullpath;
  int len;
  char *result;

  struct stat dummy;
  char *entry_fullpath;

  NODE *dir_node;
  const REFERENCE *entry;
  REFERENCE *entry2;

/* Space for an appended compressed file extension, like ".gz". */
#define PADDING "XXXXXXXXX"
  if (IS_ABSOLUTE(searchdir))
    len = xasprintf (&dir_fullpath, "%s/dir%s", searchdir, PADDING);
  else
    len = xasprintf (&dir_fullpath, "./%s/dir%s", searchdir, PADDING);
  dir_fullpath[len - strlen(PADDING)] = '\0';
#undef PADDING

  result = info_check_compressed (dir_fullpath, &dummy);
  if (!result)
    {
      free (dir_fullpath);
      return 0;
    }

  dir_node = info_get_node (dir_fullpath, "Top");
  free (dir_fullpath);
  entry = info_get_menu_entry_by_label (dir_node, label, 1);
  if (!entry || !entry->filename)
    {
      free_node (dir_node);
      return 0;
      /* A dir entry with no filename is unlikely, but not impossible. */
    }

  entry2 = info_copy_reference (entry);
  entry_fullpath = info_file_of_infodir (entry2->filename, searchdir, &dummy);
  if (entry_fullpath)
    {
      free (entry2->filename);
      entry2->filename = entry_fullpath;
    }

  free_node (dir_node);
  return entry2;
}

