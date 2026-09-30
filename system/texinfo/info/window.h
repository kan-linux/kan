/* window.h -- Structure and flags used in manipulating Info windows.

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

#ifndef INFO_WINDOW_H
#define INFO_WINDOW_H

#include "nodes.h"
#include <stdarg.h>
#include <regex.h>

/* Smallest number of visible lines in a window.  The actual height is
   always one more than this number because each window has a modeline. */
#define WINDOW_MIN_HEIGHT 2

/* Smallest number of screen lines that can be used to fully present a
   window.  This number includes the modeline of the window. */
#define WINDOW_MIN_SIZE (WINDOW_MIN_HEIGHT + 1)

/* A line map structure keeps a table of point values corresponding to
   column offsets within the current line.  It is used to convert
   point values into columns on screen and vice versa. */
typedef struct line_map_struct
{
  NODE *node;      /* Node to which this line pertains */
  long nline;      /* Line number for which the map is computed.
                      Should not be negative. */
  size_t size;     /* Number of elements map can accomodate */
  size_t used;     /* Number of used map slots */
  long *map;       /* The map itself */
} LINE_MAP;

/* Note: The same elements are used within the WINDOW_STATE structure and a
   subsection of the WINDOW structure. */
typedef struct {
   NODE *node;          /* The node displayed in this window. */
   long pagetop;        /* LINE_STARTS[PAGETOP] is first line in WINDOW. */
   long point;          /* Offset within NODE of the cursor position. */
} WINDOW_STATE;

typedef struct match_struct
{
  regmatch_t *matches; /* Array of matches */
  size_t match_count;
  size_t match_alloc;
  int finished;        /* Non-zero if all possible matches are stored. */
  regex_t regex;
  char *buffer;
  long buflen;         /* Should not be negative */
} MATCH_STATE;

/* Structure which defines a window.  Windows are doubly linked, next
   and prev. The list of windows is kept on WINDOWS.  The structure member
   window->height is the total height of the window.  The position location
   (0, window->height + window->first_row) is the first character of this
   windows modeline.  The number of lines that can be displayed in a window
   is equal to window->height - 1. */
typedef struct window_struct
{
  struct window_struct *next;      /* Next window in this chain. */
  struct window_struct *prev;      /* Previous window in this chain. */
  long width;           /* Width of this window. */
  long height;          /* Height of this window. */
  long first_row;       /* Offset of the first line in the_screen. */
  size_t goal_column;   /* Column to place the cursor in when moving it up and
                           down (if W_CurrentColGoal flag is not set). */
  NODE *node;           /* The node displayed in this window. */
  long pagetop;         /* LINE_STARTS[PAGETOP] is first line in WINDOW. */
  long point;           /* Offset within NODE of the cursor position. */
  LINE_MAP line_map;    /* Current line map */
  char *modeline;       /* Calculated text of the modeline for this window. */
  long *line_starts;    /* Offsets of printed line starts in node->contents.*/
  long *log_line_no;    /* Number of logical line corresponding to each
                           physical one. */
  long line_count;      /* Number of printed lines in node. */
  size_t line_slots;    /* Allocated space in LINE_STARTS and LOG_LINE_NO. */

  int flags;            /* See below for details. */

  /* Used for highlighting search matches. */
  char *search_string;
  int search_is_case_sensitive;
  MATCH_STATE matches;

  /* History of nodes visited in this window. */
  WINDOW_STATE **hist;  /* Nodes visited in this window, including current. */  
  size_t hist_index;    /* Index where to add the next node. */
  size_t hist_slots;    /* Number of slots allocated to HIST. */
} WINDOW;

#define W_UpdateWindow  0x01    /* WINDOW needs updating. */
#define W_WindowIsPerm  0x02    /* This WINDOW is a permanent object. */
#define W_WindowVisible 0x04    /* This WINDOW is currently visible. */
#define W_InhibitMode   0x08    /* This WINDOW has no modeline. */
#define W_NoWrap        0x10    /* Lines do not wrap in this window. */
#define W_InputWindow   0x20    /* Window accepts input. */
#define W_TempWindow    0x40    /* Window is less important. */
#define W_CurrentColGoal 0x80   /* Use the current column to place the
                                   cursor in when moving it up and down. */

extern WINDOW *windows;         /* List of visible Info windows. */
extern WINDOW *active_window;   /* The currently active window. */
extern WINDOW *the_screen;      /* The Info screen is just another window. */
extern WINDOW *the_echo_area;   /* THE_ECHO_AREA is a window in THE_SCREEN. */

extern int show_malformed_multibyte_p; /* Show malformed multibyte sequences */

void window_initialize_windows (int width, int height);
void window_new_screen_size (int width, int height);
WINDOW *window_make_window (void);
void window_change_window_height (WINDOW *window, int amount);

#define DONT_TILE_INTERNALS 0
#define TILE_INTERNALS      1
void window_tile_windows (int style);

WINDOW *get_internal_info_window (const char *name);
void window_toggle_wrap (WINDOW *window);
void window_set_node_of_window (WINDOW *window, NODE *node);
void window_delete_window (WINDOW *window);

void window_mark_chain (WINDOW *chain, int flag);
void window_unmark_chain (WINDOW *chain, int flag);

long window_log_to_phys_line (WINDOW *window, long ln);
void set_window_pagetop (WINDOW *window, int desired_top);
void window_adjust_pagetop (WINDOW *window);
long window_line_of_point (WINDOW *window);
long window_get_cursor_column (WINDOW *window);
void window_make_modeline (WINDOW *window);
void window_goto_percentage (WINDOW *window, int percent);

void free_echo_area (void);
void window_clear_echo_area (void);
void vwindow_message_in_echo_area (const char *format, va_list ap);
void window_message_in_echo_area (const char *format, ...)
  TEXINFO_PRINTFLIKE(1,2);
void message_in_echo_area (const char *format, ...)
  TEXINFO_PRINTFLIKE(1,2);
void unmessage_in_echo_area (void);

NODE *build_message_node (const char *format, va_list ap);
NODE *format_message_node (const char *format, ...)
  TEXINFO_PRINTFLIKE(1,2);

struct text_buffer;
NODE *text_buffer_to_node (struct text_buffer *tb);

void calculate_line_starts (WINDOW *window);

void window_line_map_init (WINDOW *win);
void window_compute_line_map (WINDOW *win);
size_t window_point_to_column (WINDOW *win, long point, long *np);

#endif /* not INFO_WINDOW_H */
