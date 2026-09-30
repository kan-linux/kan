/* nodes.h -- definitions for nodes.c and dir.c

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

#ifndef NODES_H
#define NODES_H

#include "info.h"

/* Structure which describes a node reference, such as a menu entry or
   cross reference. */
typedef struct {
  char *label;          /* User Label. */
  char *filename;       /* File where this node can be found. */
  char *nodename;       /* Name of the node. */
  int start, end;       /* Offsets within the containing node of LABEL. */
  long line_number;     /* Specific line number a menu item points to.  */
  int type;             /* Whether reference is a xref or a menu item */
} REFERENCE;

/* Possible values of REFERENCE.type */
#define REFERENCE_XREF 0
#define REFERENCE_MENU_ITEM 1

typedef struct {
  char *fullpath;               /* Non-null is the logical file name. */
  char *subfile;                /* File containing node for split files. */
  char *nodename;               /* The name of this node. */
  char *contents;               /* Characters appearing in this node. */
  long nodelen;                 /* The length of the CONTENTS member. */
  long display_pos;             /* Where to display at, if nonzero.  */
  long body_start;              /* Offset of the actual node body */
  int flags;                    /* See immediately below. */
  REFERENCE **references;       /* Cross-references or menu items in node.
                                   Null-terminated.  references == 0 implies 
                                   uninitialized, not empty */
  char *up, *prev, *next;       /* Names of nearby nodes. */
  int active_menu;              /* Used for subnodes search. */
} NODE;

/* Values for NODE.flags. */
#define N_IsInternal   0x01     /* This node was made by Info. */
#define N_IsManPage    0x02     /* This node is a manpage. */
#define N_WasRewritten 0x04     /* NODE->contents can be passed to free(). */
#define N_IsIndex      0x08     /* An index node. */
#define N_IsDir        0x10     /* A dir node. */
#define N_Simple       0x20     /* Data about cross-references is missing. */
#define N_Replica      0x40     /* Does not own internal data structures. */

/* String constants. */
#define INFO_FILE_LABEL                 "File:"
#define INFO_REF_LABEL                  "Ref:"
#define INFO_NODE_LABEL                 "Node:"
#define INFO_PREV_LABEL                 "Prev:"
#define INFO_ALTPREV_LABEL              "Previous:"
#define INFO_NEXT_LABEL                 "Next:"
#define INFO_UP_LABEL                   "Up:"
#define INFO_MENU_LABEL                 "\n* Menu:"
#define INFO_MENU_ENTRY_LABEL           "\n* "
#define INFO_XREF_LABEL                 "*Note"
#define TAGS_TABLE_END_LABEL            "End Tag Table"
#define TAGS_TABLE_BEG_LABEL            "Tag Table:"
#define INDIRECT_TABLE_LABEL            "Indirect:"
#define TAGS_TABLE_IS_INDIRECT_LABEL    "(Indirect)"
#define LOCAL_VARIABLES_LABEL           "Local Variables"
#define CHARACTER_ENCODING_LABEL        "coding:"

/* Character constants. */
#define INFO_COOKIE '\037'
#define INFO_FF     '\014'
#define INFO_TAGSEP '\177'

/* For each logical file that we have loaded, we keep a list of
   the names of the nodes that are found in that file.  A pointer to
   a node in an info file is called a "tag".  For split files, the
   tag pointer is "indirect"; that is, the pointer also contains the
   name of the split file where the node can be found.  For non-split
   files, the filename member simply contains the name of the
   current file. */
typedef struct {
  char *filename;               /* The file where this node can be found. */
  char *nodename;               /* The node pointed to by this tag. */
  long nodestart;               /* The value read from the tag table.
                                   Should never be negative */
  long nodestart_adjusted;      /* Where the node or anchor actually is. */
  int flags;                    /* See immediately below. */
  NODE cache;                   /* Saved information about pointed-to node. */
} TAG;

/* Values for TAG.flags. */
#define T_SeenBySearch 0x01     /* Tag has already been seen in a search. */
#define T_IsAnchor     0x02     /* Tag is an anchor */

/* The following structure is used to remember information about the contents
   of Info files that we have loaded at least once before.  The FINFO member
   is present so that we can reload the file if it has been modified since
   last being loaded.  All of the arrays appearing within this structure
   are NULL terminated. */
typedef struct {
  char *filename;               /* The filename used to find this file. */
  char *infodir;                /* Name of directory containing file. */
  char *fullpath;               /* The full pathname of this info file. */
  struct stat finfo;            /* Information about this file. */
  char *contents;               /* The contents of this particular file. */
  long filesize;                /* The number of bytes this file expands to.
                                   Should not be negative */
  char **subfiles;              /* If non-null, the list of subfiles. */
  TAG **tags;                   /* If non-null, the tags table. */
  size_t tags_slots;            /* Number of slots allocated for TAGS. */
  int flags;                    /* Various flags.  See below. */
  char *encoding;               /* Name of character encoding of file. */
} FILE_BUFFER;

/* Values for FILE_BUFFER.flags. */
#define F_HasTagsTable 0x01     /* This file has a tags table. */
#define F_TagsIndirect 0x02     /* The tags table was an indirect one. */
#define F_IsCompressed 0x04     /* The file is compressed on disk. */
#define F_Subfile      0x08     /* File buffer is a subfile of a split file. */
#define F_Gone         0x10     /* File is no more. */

/* When non-zero, this is a string describing the most recent file error. */
extern char *info_recent_file_error;

void build_tags_and_nodes (FILE_BUFFER *file_buffer);

/* Array of FILE_BUFFER * which represents the currently loaded info files. */
extern FILE_BUFFER **info_loaded_files;
extern size_t info_loaded_files_index;
extern size_t info_loaded_files_slots;

FILE_BUFFER *check_loaded_file (const char *filename);
FILE_BUFFER *check_loaded_file_in_infodir (const char *filename,
                                           const char *infodir);
FILE_BUFFER *info_find_file (const char *filename);
FILE_BUFFER *info_find_subfile (const char *filename);

FILE_BUFFER *make_file_buffer (void);

TAG *info_create_tag (void);
NODE *info_create_node (void);
void free_node (NODE *node);
NODE *replicate_node (const NODE *node);

NODE *info_get_node (const char *filename, const char *nodename);
NODE *info_get_node_of_file_buffer (FILE_BUFFER *file_buffer,
                                           const char *nodename);
NODE *info_node_of_tag (FILE_BUFFER *fb, TAG **tag_ptr);
NODE *info_node_of_tag_fast (FILE_BUFFER *fb, TAG **tag_ptr);
const char *node_printed_rep (const NODE *node);

void name_internal_node (NODE *node, char *name);
NODE *node_from_hook_output (char *hook_name, char *hook_output, int count);


/* Found in dir.c */
NODE *get_dir_node (void);
const REFERENCE *lookup_dir_entry (const char *label, int sloppy);
const REFERENCE *dir_entry_of_infodir (const char *label,
                                       const char *searchdir);

#endif /* not NODES_H */
