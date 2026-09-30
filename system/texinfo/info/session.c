/* session.c -- user windowing interface to Info.

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
#include "display.h"
#include "session.h"
#include "dribble.h"
#include "util.h"
#include "search.h"
#include "nodes.h"
#include "echo-area.h"
#include "footnotes.h"
#include "variables.h"

#ifdef HAVE_SYS_IOCTL_H
#include <sys/ioctl.h>
#endif
#ifdef __MINGW32__
# undef read
# define read(f,b,s)        w32_read(f,b,s)
# undef _read
# define _read(f,b,s)        w32_read(f,b,s)
extern ssize_t w32_read (int, void *, size_t);
#endif

#if defined (HAVE_SYS_TIME_H)
#  include <sys/time.h>
#  define HAVE_STRUCT_TIMEVAL
#endif /* HAVE_SYS_TIME_H */

/* **************************************************************** */
/*                                                                  */
/*                   Running an Info Session                        */
/*                                                                  */
/* **************************************************************** */

static void mouse_event_handler (void);

/* The place that we are reading input from. */
static FILE *info_input_stream = NULL;

NODE *allfiles_node = 0;

static void
allfiles_create_node (char *term, REFERENCE **fref)
{
  int i;
  struct text_buffer text;

  text_buffer_init (&text);

  text_buffer_printf (&text,
                      "%s File names matching '%s'\n\n"
                      "Info File Index\n"
                      "***************\n\n"
                      "File names that match '%s':\n",
                      INFO_NODE_LABEL,
                      term, term);

  /* Mark as an index so that destinations are never hidden. */
  text_buffer_add_string (&text, "\0\b[index\0\b]", 11);
  text_buffer_printf (&text, "\n* Menu:\n\n");

  for (i = 0; fref[i]; i++)
    {
      text_buffer_printf (&text, "* %4i: (%s)", i+1, fref[i]->filename);
      if (fref[i]->nodename)
        text_buffer_printf (&text, "%s", fref[i]->nodename);
      text_buffer_printf (&text, ".\n");
    }

  allfiles_node = info_create_node ();
  allfiles_node->fullpath = xstrdup ("");
  allfiles_node->nodename = xstrdup ("*Info File Index*");
  allfiles_node->contents = text_buffer_base (&text);
  allfiles_node->nodelen = text_buffer_off (&text);
  allfiles_node->body_start = strcspn (allfiles_node->contents, "\n");

  scan_node_contents (allfiles_node, 0, 0);
}

/* Begin an info session finding the nodes specified by REFERENCES.  For
   each loaded node, create a new window.  Always split the largest of the
   available windows.  Display ERROR in echo area if non-null. */
static void
begin_multiple_window_info_session (REFERENCE **references, char *error)
{
  register int i;
  WINDOW *window = 0;

  for (i = 0; references && references[i]; i++)
    {
      if (!window)
        {
          window = active_window;
          info_select_reference (window, references[i]);
          if (!window->node)
            window = 0;
        }
      else
        {
          /* Find the largest window in WINDOWS, and make that be the active
             one.  Then split it and add our window and node to the list
             of remembered windows and nodes.  Then tile the windows. */
          WINDOW *win, *largest = NULL;
          int max_height = 0;

          for (win = windows; win; win = win->next)
            if (win->height > max_height)
              {
                max_height = win->height;
                largest = win;
              }

          if (!largest)
            {
              display_update_display ();
              info_error ("%s", _("Cannot find a window!"));
              return;
            }

          active_window = largest;
          window = window_make_window ();
          info_select_reference (window, references[i]);

          if (!window->node)
            {
              /* We couldn't find the node referenced. */
              window_delete_window (window);
              window = 0;
            }

          if (window)
            window_tile_windows (TILE_INTERNALS);
          else
            {
              display_update_display ();
              info_error ("%s", msg_win_too_small);
              return;
            }
        }
    }

  /* Load dir node as a back-up if there were no references given, or if
     none of them were valid. */
  if (!window)
    {
      info_set_node_of_window (active_window, get_dir_node ());
      return;
    }
}

static void
display_startup_message (void)
{
  const char *format;

  format = replace_in_documentation
  /* TRANSLATORS: Try to keep this message (when "expanded") at most 79
     characters; anything after the 79th character will not actually be
     displayed on an 80-column terminal. */
(_("Welcome to Info version %s.  Type \\[get-help-window] for help, \\[get-info-help-node] for tutorial."),
     0);

  window_message_in_echo_area (format, VERSION, NULL);
}

/* Run an Info session.  If USER_FILENAME is null, create a window for each
   node referenced in REF_LIST.
   ERROR is an optional error message to display at start-up. */
void
info_session (REFERENCE **ref_list, char *error)
{
  /* Initialize the Info session. */
  initialize_info_session ();

  if (!error)
    display_startup_message ();
  else
    show_error_node (error);

  begin_multiple_window_info_session (ref_list, error);
  info_read_and_dispatch ();
  close_info_session ();
}

/* Used when "--all" was used on the command line.  Display a file index
   with entries in REF_LIST.  */
void
info_session_allfiles (REFERENCE **ref_list, char *user_filename, char *error)
{
  /* Initialize the Info session. */
  initialize_info_session ();

  if (!error)
    display_startup_message ();
  else
    show_error_node (error);

  allfiles_create_node (user_filename, ref_list);
  info_set_node_of_window (active_window, allfiles_node);

  info_read_and_dispatch ();
  close_info_session ();
}

/* Start an info session with a single node displayed. */
void
info_session_one_node (NODE *node)
{
  initialize_info_session ();
  info_set_node_of_window (active_window, node);
  info_read_and_dispatch ();
  close_info_session ();
}

extern COMMAND_FUNCTION info_next_line;
extern COMMAND_FUNCTION info_prev_line;

/* Becomes non-zero when 'q' is typed to an Info window. */
static int quit_info_immediately = 0;

void
info_session_quit (void)
{
  quit_info_immediately = 1;
}

void
info_read_and_dispatch (void)
{
  COMMAND_FUNCTION *cmd;
  int count;

  for (quit_info_immediately = 0; !quit_info_immediately; )
    {
      if (!info_any_buffered_input_p ())
        display_update_display ();

      /* Some redisplay might be necessary if the cursor has moved and
         a different reference (or no reference) has to be highlighted. */
      if (hl_ref_rendition.mask)
        display_update_one_window (active_window);

      display_cursor_at_point (active_window);

      cmd = read_key_sequence (info_keymap, 1, 1, 0, &count);
      if (cmd)
        {
          if (!check_info_keyseq_displayed ())
            window_clear_echo_area ();

          (*cmd) (active_window, count);

          /* Don't change the goal column when going up and down.  This
             means we can go from a long line to a short line and back to
             a long line and end back in the same column. */
          if (!(cmd == &info_next_line || cmd == &info_prev_line))
            active_window->flags |= W_CurrentColGoal; /* Goal is current column. */
        }
    }
}

/* Found in signals.c */
extern void initialize_info_signal_handler (void );

/* Initialize terminal, read configuration file and set key bindings. */
void
initialize_terminal_and_keymaps (char *init_file)
{
  char *term_name = getenv ("TERM");
  terminal_initialize_terminal (term_name);
  read_init_file (init_file);
}

/* Initialize the first info session by starting the terminal, window,
   and display systems.  */
void
initialize_info_session (void)
{
  if (!terminal_prep_terminal ())
    {
      /* Terminal too dumb to run interactively. */
      char *term_name = getenv ("TERM");
      info_error (_("Terminal type '%s' is not smart enough to run Info"),
                  term_name);
      exit (EXIT_FAILURE);
    }

  terminal_clear_screen ();

  window_initialize_windows (screenwidth, screenheight);
  initialize_info_signal_handler ();
  display_initialize_display (screenwidth, screenheight);

  /* If input has not been redirected yet, make it come from unbuffered
     standard input. */
  if (!info_input_stream)
    {
      setbuf (stdin, NULL);
      info_input_stream = stdin;
    }

  info_windows_initialized_p = 1;
}

/* On program exit, leave the cursor at the bottom of the window, and
   restore the terminal I/O. */
void
close_info_session (void)
{
  terminal_goto_xy (0, screenheight - 1);
  terminal_clear_to_eol ();
  fflush (stdout);
  terminal_unprep_terminal ();
  close_dribble_file ();
}

/* Tell Info that input is coming from the file FILENAME. */
void
info_set_input_from_file (char *filename)
{
  FILE *stream;

  /* Input may include binary characters.  */
  stream = fopen (filename, FOPEN_RBIN);

  if (!stream)
    return;

  if ((info_input_stream != NULL) &&
      (info_input_stream != stdin))
    fclose (info_input_stream);

  info_input_stream = stream;

  if (stream != stdin)
    display_inhibited = 1;
}


/* **************************************************************** */
/*                                                                  */
/*                      Input Character Buffering                   */
/*                                                                  */
/* **************************************************************** */

static void fill_input_buffer (int wait);
static int info_gather_typeahead (int);

/* Largest number of characters that we can read in advance. */
#define MAX_INFO_INPUT_BUFFERING 512

static int pop_index = 0; /* Where to remove bytes from input buffer. */
static int push_index = 0; /* Where to add bytes to input buffer. */
static unsigned char info_input_buffer[MAX_INFO_INPUT_BUFFERING];

/* Get a key from the buffer of characters to be read.
   Return the key in KEY.
   Result is non-zero if there was a key, or 0 if there wasn't. */
static int
get_byte_from_input_buffer (unsigned char *key)
{
  if (push_index == pop_index)
    return 0;

  *key = info_input_buffer[pop_index++];

  if (pop_index >= MAX_INFO_INPUT_BUFFERING)
    pop_index = 0;

  return 1;
}

int
info_any_buffered_input_p (void)
{
  fill_input_buffer (0);
  return push_index != pop_index;
}

int
control_g_waiting (void)
{
  fill_input_buffer (0); \
  return info_input_buffer[pop_index] == Control ('g');
}

/* Wrapper around info_gather_typeahead which handles read errors and reaching
   end-of-file. */
static void
fill_input_buffer (int wait)
{
  while (1)
    {
      int success;
      do
        {
          success = info_gather_typeahead (wait);
        }
      while (!success && errno == EINTR); /* Try again if the read was
                                             interrupted due to a signal. */
      if (success || !wait)
        return;

      /* Reading failed.  If we were reading from a dribble file with
         --restore, switch to standard input.  Otherwise quit. */
      if (info_input_stream != stdin)
        {
          fclose (info_input_stream);
          info_input_stream = stdin;
          display_inhibited = 0;
          display_update_display ();
          display_cursor_at_point (active_window);
        }
      else
        {
          close_info_session ();
          exit (EXIT_SUCCESS);
        }
    }
}

/* Read bytes and stuff them into info_input_buffer.  If WAIT is true, wait
   for input; otherwise don't do anything if there is no input waiting.
   Return 1 on success, 0 on error.  ERRNO may be set by read(). */
static int
info_gather_typeahead (int wait)
{
  register int i = 0;
  int tty, space_avail;
  long chars_avail;
  unsigned char input[MAX_INFO_INPUT_BUFFERING];

  tty = fileno (info_input_stream);
  chars_avail = 0;

  /* Clear errno. */
  errno = 0;

  /* There may be characters left over from last time, in which case we don't
     want to wait for another key to be pressed. */
  if (wait && pop_index == push_index)
    {
      char c;
      /* Wait until there is a byte waiting, and then stuff it into the input
         buffer. */
      if (read (tty, &c, 1) <= 0)
        return 0;

      if (info_dribble_file)
        dribble (c);

      info_input_buffer[push_index++] = c;
      if (push_index >= MAX_INFO_INPUT_BUFFERING)
        push_index = 0;
      /* Continue to see if there are more bytes waiting. */
    }

  /* Get the amount of space available in INFO_INPUT_BUFFER for new chars. */
  if (pop_index > push_index)
    space_avail = pop_index - push_index;
  else
    space_avail = sizeof (info_input_buffer) - (push_index - pop_index);

  /* If we can just find out how many characters there are to read, do so. */
#if defined (FIONREAD)
  {
    ioctl (tty, FIONREAD, &chars_avail);

    if (chars_avail > space_avail)
      chars_avail = space_avail;

    if (chars_avail)
      chars_avail = read (tty, &input[0], chars_avail);
  }
#else /* !FIONREAD */
#  if defined (O_NDELAY) && defined (F_GETFL) && defined (F_SETFL)
  {
    int flags;

    flags = fcntl (tty, F_GETFL, 0);

    fcntl (tty, F_SETFL, (flags | O_NDELAY));
      chars_avail = read (tty, &input[0], space_avail);
    fcntl (tty, F_SETFL, flags);

    if (chars_avail == -1)
      chars_avail = 0;
  }
#  else  /* !O_NDELAY */
#   ifdef __DJGPP__
  {
    extern long pc_term_chars_avail (void);

    if (isatty (tty))
      chars_avail = pc_term_chars_avail ();
    else
      {
        /* We could be more accurate by calling ltell, but we have no idea
           whether tty is buffered by stdio functions, and if so, how many
           characters are already waiting in the buffer.  So we punt.  */
        struct stat st;

        if (fstat (tty, &st) < 0)
          chars_avail = 1;
        else
          chars_avail = st.st_size;
      }
    if (chars_avail > space_avail)
      chars_avail = space_avail;
    if (chars_avail)
      chars_avail = read (tty, &input[0], chars_avail);
  }
#   else
#    ifdef __MINGW32__
  {
    extern long w32_chars_avail (int);

    chars_avail = w32_chars_avail (tty);

    if (chars_avail > space_avail)
      chars_avail = space_avail;
    if (chars_avail)
      chars_avail = read (tty, &input[0], chars_avail);
  }
#    endif  /* _WIN32 */
#   endif/* __DJGPP__ */
#  endif /* O_NDELAY */
#endif /* !FIONREAD */

  while (i < chars_avail)
    {
      if (info_dribble_file)
        dribble (input[i]);

      /* Add KEY to the buffer of characters to be read. */
      if (input[i] != Control ('g'))
        {
          info_input_buffer[push_index++] = input[i];
          if (push_index >= MAX_INFO_INPUT_BUFFERING)
            push_index = 0;
        }
      else
        /* Flush all pending input in the case of C-g pressed. */
        push_index = pop_index;
      i++;
    }
  /* If wait is true, there is at least one byte left in the input buffer. */
  if (chars_avail <= 0 && !wait)
    return 0;
  return 1;
}

static int get_input_key_internal (void);

/* Whether to process or skip mouse events in the input stream. */
unsigned char mouse_cb, mouse_cx, mouse_cy;

/* Handle mouse event given that mouse_cb, mouse_cx and mouse_cy contain the
   data from the event.  See the "XTerm Control Sequences" document for their
   meanings. */
void
mouse_event_handler (void)
{
  window_clear_echo_area();
  if (mouse_cb & 0x40)
    {
      switch (mouse_cb & 0x03)
        {
        case 0: /* Mouse button 4 (scroll up). */
          set_window_pagetop (active_window, active_window->pagetop - 3);
          break;
        case 1: /* Mouse button 5 (scroll down). */
          set_window_pagetop (active_window, active_window->pagetop + 3);
          break;
        }
    }
}

/* Return number representing a key that has been pressed, which is an index
   into info_keymap and echo_area_keymap. */
int
get_input_key (void)
{
  int ret = -1;

  while (ret == -1)
    {
      ret = get_input_key_internal ();

      if (ret == KEY_MOUSE)
        {
          get_byte_from_input_buffer (&mouse_cb);
          get_byte_from_input_buffer (&mouse_cx);
          get_byte_from_input_buffer (&mouse_cy);
        }
    }
  return ret;
}

/* Time in milliseconds to wait for the next byte of a byte sequence
   corresponding to a key or key chord.  Settable with the 'key-time' user
   variable. */
int key_time = 100;

/* Read bytes from input and return what key has been pressed.  Return -1 on
   reading an unrecognized key. */
static int
get_input_key_internal (void)
{
  BYTEMAP_ENTRY *b;
  unsigned char c;
  int esc_seen = 0;
  int pop_start;
  int byte_count = 0;
  fill_input_buffer (1);

  if (pop_index == push_index)
    return -1; /* No input waiting.  This shouldn't happen. */

  b = byte_seq_to_key;
  pop_start = pop_index;

  while (pop_index != push_index)
    {
      int in_map = 0;
      int unknown = 0;
      if (!get_byte_from_input_buffer (&c))
        break; /* Incomplete byte sequence. */
      byte_count++;

      switch (b[c].type)
        {
        case BYTEMAP_KEY:
          return b[c].key;
        case BYTEMAP_ESC:
          esc_seen = 1;
          /* Fall through. */
        case BYTEMAP_MAP:
          in_map = 1;
          b = b[c].next;
          break;
        case BYTEMAP_NONE:
          unknown = 1;
          break;
        }

      if (unknown)
        break;

      /* If we read an incomplete byte sequence, pause a short while to
         see if more bytes follow. */
      if (in_map && pop_index == push_index)
        {
          int ready = 0;
#if defined (FD_SET)
          struct timeval timer, *timerp = 0;
          fd_set readfds;

          FD_ZERO (&readfds);
          FD_SET (fileno (info_input_stream), &readfds);

          timer.tv_sec = 0;
          timer.tv_usec = key_time * 1000;
          timerp = &timer;
          ready = select (fileno(info_input_stream)+1, &readfds,
                          NULL, NULL, timerp);
#else
          ready = 1;
#endif /* FD_SET */
          if (ready)
            fill_input_buffer (0);
        }
    }

  /* Incomplete or unknown byte sequence. Start again with the first byte.  */
  pop_index = pop_start;

  if (!esc_seen || (byte_count >= 3 && key_time == 0))
    {
      /* If the sequence was incomplete, return the first byte.
             Also return the first byte for sequences with ESC that are at
         least three bytes long if 'key_time' is 0, to give some support for
         specifying byte sequences in infokey for those sent by unrecognized
         special keys (which would otherwise be skipped below). */
      pop_index = pop_start;
      get_byte_from_input_buffer (&c);
      return c;
    }
  else
    {
      get_byte_from_input_buffer (&c); /* Should be ESC */

      /* If there are no more characters, then decide that the escape key
         itself has been pressed. */
      if (pop_index == push_index)
        return 033;

      /* Skip byte sequences that look like they could have come from
         unrecognized keys, e.g. F3 or C-S-Left, to avoid them as being
         interpreted as random garbage.  These might produce sequences
         that look like "ESC O R" or "ESC [ 1 ; 6 ~", depending on
         the terminal. */

      /* Check if the sequence starts ESC O. */
      get_byte_from_input_buffer (&c);
      if (c == 'O')
        {
          /* If no more bytes, call it M-O. */
          if (!info_any_buffered_input_p ())
            return 'O' + KEYMAP_META_BASE;

          /* Otherwise it could be an unrecognized key producing a sequence
             ESC O (byte).  Ignore it, discarding the next byte. */
          get_byte_from_input_buffer (&c);
          return -1;
        }

      /* Unknown CSI-style sequences. */
      else if (c == '[')
        {
          /* If no more bytes, call it M-[. */
          if (!get_byte_from_input_buffer (&c))
            return '[' + KEYMAP_META_BASE;

          /* Skip a control sequence as defined by ECMA-48. */
          while (c >= 0x30 && c <= 0x3f)
            if (!get_byte_from_input_buffer (&c))
              break;

          while (c >= 0x20 && c <= 0x2f)
            if (!get_byte_from_input_buffer (&c))
              break;

          return -1;
        }

      else
        {
          /* The sequence started with ESC, but wasn't recognized.  Treat it
             as introducing a sequence produced by a key chord with the meta
             key pressed. */
          return c + KEYMAP_META_BASE;
        }
    }
}

#if defined (HAVE_SYS_TIME_H)
#  include <sys/time.h>
#  define HAVE_STRUCT_TIMEVAL
#endif /* HAVE_SYS_TIME_H */

#if !defined (FD_SET) && defined (__MINGW32__)
#  define WIN32_LEAN_AND_MEAN
#  include <windows.h>
#endif

void
pause_or_input (void)
{
#ifdef FD_SET
  struct timeval timer;
  fd_set readfds;
#endif

  if (pop_index != push_index)
    return; /* Input is already waiting. */

#ifdef FD_SET
  FD_ZERO (&readfds);
  FD_SET (fileno (stdin), &readfds);
  timer.tv_sec = 2;
  timer.tv_usec = 0;
  select (fileno (stdin) + 1, &readfds, NULL, NULL, &timer);
#elif defined (__MINGW32__)
  /* This is signalled on key release, so flush it and wait again. */
  WaitForSingleObject (GetStdHandle (STD_INPUT_HANDLE), 2000);
  FlushConsoleInputBuffer (GetStdHandle (STD_INPUT_HANDLE));
  WaitForSingleObject (GetStdHandle (STD_INPUT_HANDLE), 2000);
#endif /* FD_SET */
}


/* **************************************************************** */
/*                                                                  */
/*                           Error handling                         */
/*                                                                  */
/* **************************************************************** */

/* Non-zero means ring terminal bell on errors. */
int info_error_rings_bell_p = 1;

/* Print AP according to FORMAT.  If the window system was initialized,
   then the message is printed in the echo area.  Otherwise, a message is
   output to stderr. */
static void
vinfo_error (const char *format, va_list ap)
{
  if (!info_windows_initialized_p || display_inhibited)
    {
      fprintf (stderr, "%s: ", program_name);
      vfprintf (stderr, format, ap);
      fprintf (stderr, "\n");
      fflush (stderr);
    }
  else
    {
      if (!echo_area_is_active)
        {
          if (info_error_rings_bell_p)
            terminal_ring_bell ();
          vwindow_message_in_echo_area (format, ap);
        }
      else
        {
          NODE *temp = build_message_node (format, ap);
          if (info_error_rings_bell_p)
            terminal_ring_bell ();
          inform_in_echo_area (temp->contents);
          free (temp->contents);
          free (temp);
        }
    }
}

void
info_error (const char *format, ...)
{
  va_list ap;
  va_start (ap, format);
  vinfo_error (format, ap);
  va_end (ap);
}

void
show_error_node (char *error)
{
  if (info_error_rings_bell_p)
    terminal_ring_bell ();
  if (!info_windows_initialized_p)
    {
      info_error ("%s", error);
    }
  else if (!echo_area_is_active)
    {
      window_message_in_echo_area ("%s", error);
    }
  else
    inform_in_echo_area (error);
}


/* **************************************************************** */
/*                                                                  */
/*                       Window node history                        */
/*                                                                  */
/* **************************************************************** */

static void
put_node_in_window (WINDOW *win, NODE *node)
{
  win->node = node;
  win->pagetop = 0;
  win->point = 0;
  free_matches (&win->matches);
  free (win->line_starts); win->line_starts = 0;
  free (win->log_line_no); win->log_line_no = 0;
  win->flags |= W_UpdateWindow;
}

/* Go back one in the node history. */
int
forget_node_fast (WINDOW *win)
{
  int i = win->hist_index;
  if (i == 0)
    return 0;

  free_node (win->hist[i - 1]->node);
  free (win->hist[i - 1]);
  win->hist[i - 1] = 0;
  i = --win->hist_index;

  if (i == 0)
    /* Window history is empty. */
    win->node = 0;
  else
    {
      put_node_in_window (win, win->hist[i - 1]->node);
      win->point = win->hist[i - 1]->point;
    }
  return i;
}

void
forget_node (WINDOW *win)
{
  int i = forget_node_fast (win);

  if (i == 0)
    {
      win->node = 0;
      return; /* Window history is empty. */
    }

  window_set_node_of_window (win, win->hist[i - 1]->node);
  if (auto_footnotes_p)
    info_get_or_remove_footnotes (win);
  set_window_pagetop (win, win->hist[i - 1]->pagetop);
  win->point = win->hist[i - 1]->point;
  window_compute_line_map (win);
  win->node->display_pos = win->point;
}

/* Remove associated list of nodes of WINDOW. */
void
forget_window_and_nodes (WINDOW *win)
{
  size_t i;
  for (i = 0; i < win->hist_index; i++)
    {
      free_node (win->hist[i]->node);
      free (win->hist[i]);
    }
  free (win->hist);
}

/* Like info_set_node_of_window, but only do enough so to extend the
   window history, avoiding calculating line starts. */
void
info_set_node_of_window_fast (WINDOW *win, NODE *node)
{
  WINDOW_STATE *new;

  if (win->hist_index && win->hist[win->hist_index - 1]->node == win->node)
    {
      win->hist[win->hist_index - 1]->pagetop = win->pagetop;
      win->hist[win->hist_index - 1]->point = win->point;
    }
  put_node_in_window (win, node);

  new = xmalloc (sizeof (WINDOW_STATE));
  new->node = win->node;
  new->pagetop = win->pagetop;
  new->point = win->point;
  add_pointer_to_array (new, win->hist_index, win->hist, win->hist_slots, 16);
}

/* Set WINDOW to show NODE.  Remember the new window in our list of
   Info windows.  If we are doing automatic footnote display, try to display
   the footnotes for this window. */
void
info_set_node_of_window (WINDOW *win, NODE *node)
{
  WINDOW_STATE *new;

  /* Remember the current values of pagetop and point if the remembered node
     is the same as the current one being displayed. */
  if (win->hist_index && win->hist[win->hist_index - 1]->node == win->node)
    {
      win->hist[win->hist_index - 1]->pagetop = win->pagetop;
      win->hist[win->hist_index - 1]->point = win->point;
    }

  /* Put this node into the window. */
  window_set_node_of_window (win, node);

  /* Remember this node, the currently displayed pagetop, and the current
     location of point in this window. */
  new = xmalloc (sizeof (WINDOW_STATE));
  new->node = win->node;
  new->pagetop = win->pagetop;
  new->point = win->point;
  add_pointer_to_array (new, win->hist_index, win->hist, win->hist_slots, 16);

  /* If doing auto-footnote display/undisplay, show the footnotes belonging
     to this window's node.  Don't do that if it is a footnote node itself. */
  if (auto_footnotes_p
      && !((win->node->flags & N_IsInternal)
           && !strcmp (win->node->nodename, "*Footnotes*")))
    info_get_or_remove_footnotes (win);
}

/* Return the file buffer which belongs to WINDOW's node. */
FILE_BUFFER *
file_buffer_of_window (WINDOW *window)
{
  /* If this window has no node, then it has no file buffer. */
  if (!window->node)
    return NULL;

  if (window->node->fullpath)
    return info_find_file (window->node->fullpath);

  return NULL;
}

/* **************************************************************** */
/*                                                                  */
/*               Reading Keys and Dispatching on Them               */
/*                                                                  */
/* **************************************************************** */

static void
dispatch_error (int *keyseq)
{
  const char *rep;

  rep = pretty_keyseq (keyseq);

  if (!echo_area_is_active)
    info_error (_("Unknown command (%s)"), rep);
  else
    {
      char *temp = xmalloc (1 + strlen (rep) + strlen (_("\"%s\" is invalid")));
      sprintf (temp, _("'%s' is invalid"), rep);
      terminal_ring_bell ();
      inform_in_echo_area (temp);
      free (temp);
    }
}

/* Keeping track of key sequences. */
static int *info_keyseq = NULL;
static int info_keyseq_index = 0;
static int info_keyseq_size = 0;
static int info_keyseq_displayed_p = 0;

/* Initialize the length of the current key sequence. */
void
initialize_keyseq (void)
{
  info_keyseq_index = 0;
  info_keyseq_displayed_p = 0;
}

int
check_info_keyseq_displayed (void)
{
  return info_keyseq_displayed_p;
}

/* Add CHARACTER to the current key sequence. */
void
add_char_to_keyseq (int character)
{
  if (info_keyseq_index + 2 >= info_keyseq_size)
    info_keyseq = xrealloc (info_keyseq,
                            sizeof (int) * (info_keyseq_size += 10));

  info_keyseq[info_keyseq_index++] = character;
  info_keyseq[info_keyseq_index] = '\0';
}

/* Display the current value of info_keyseq.  If argument EXPECTING is
   non-zero, input is expected to be read after the key sequence is
   displayed, so add an additional prompting character to the sequence. */
static void
display_info_keyseq (int expecting_future_input)
{
  const char *rep;

  if (!info_keyseq || info_keyseq_index == 0)
    return;

  rep = pretty_keyseq_ext (info_keyseq, expecting_future_input);

  if (echo_area_is_active)
    inform_in_echo_area (rep);
  else
    {
      window_message_in_echo_area (rep, NULL, NULL);
      display_cursor_at_point (active_window);
    }
  info_keyseq_displayed_p = 1;
}

/* Called by interactive commands to read another key when keys have already
   been read as part of the current command (and possibly displayed in status
   line with display_info_keyseq). */
int
get_another_input_key (void)
{
  int ready = !info_keyseq_displayed_p; /* ready if new and pending key */

  /* If there isn't any input currently available, then wait a
     moment looking for input.  If we don't get it fast enough,
     prompt a little bit with the current key sequence. */
  if (!info_keyseq_displayed_p)
    {
      ready = 1;
      if (!info_any_buffered_input_p ())
        {
#if defined (FD_SET)
          struct timeval timer;
          fd_set readfds;

          FD_ZERO (&readfds);
          FD_SET (fileno (info_input_stream), &readfds);
          timer.tv_sec = 1;
          timer.tv_usec = 750;
          ready = select (fileno(info_input_stream)+1, &readfds,
                          NULL, NULL, &timer);
#else
          ready = 0;
#endif /* FD_SET */
      }
    }

  if (!ready)
    display_info_keyseq (1);

  return get_input_key ();
}

/* Non-zero means that an explicit argument has been passed to this
   command, as in C-u C-v. */
int info_explicit_arg = 0;

/* As above, but used when C-u is typed in the echo area to avoid
   overwriting this information when "C-u ARG M-x" is typed. */
int ea_explicit_arg = 0;

/* Create a default argument. */
void
info_initialize_numeric_arg (void)
{
  if (!echo_area_is_active)
    info_explicit_arg = 0;
  else
    ea_explicit_arg = 0;
}


extern COMMAND_FUNCTION info_universal_argument;
extern COMMAND_FUNCTION info_add_digit_to_numeric_arg;
extern COMMAND_FUNCTION info_do_lowercase_version;
extern COMMAND_FUNCTION info_menu_digit;

/* Read a key sequence and look up its command in MAP.  Handle C-u style
   numeric args, as well as M--, and M-digits.  Return argument in COUNT if it
   is non-null.

   Some commands can be executed directly, in which case null is returned
   instead:

   If MENU, call info_menu_digit on ACTIVE_WINDOW if a number key was
   pressed.

   If MOUSE, call mouse_event_handler if a mouse event occurred.

   If INSERT, call ea_insert if a printable character was input.
 */
COMMAND_FUNCTION *
read_key_sequence (Keymap map, int menu, int mouse,
                   int insert, int *count)
{
  int key;
  int reading_universal_argument = 0;

  int numeric_arg = 1, numeric_arg_sign = 1, *which_explicit_arg;
  COMMAND_FUNCTION *func;

  /* Process the right numeric argument. */
  if (!echo_area_is_active)
    which_explicit_arg = &info_explicit_arg;
  else
    which_explicit_arg = &ea_explicit_arg;

  *which_explicit_arg = 0;

  initialize_keyseq ();

  key = get_input_key ();
  if (key == KEY_MOUSE)
    {
      if (mouse)
        mouse_event_handler ();
      return 0;
    }

  if (insert
      && (key >= 040 && key < 0200
          || ISO_Latin_p && key >= 0200 && key < 0400))
    {
      ea_insert (the_echo_area, 1, key);
      return 0;
    }

  add_char_to_keyseq (key);

  while (1)
    {
      int dash_typed = 0, digit_typed = 0;
      func = 0;

      if (display_was_interrupted_p && !info_any_buffered_input_p ())
        display_update_display ();

      if (active_window != the_echo_area)
        display_cursor_at_point (active_window);

      /* If reading a universal argument, both <digit> and M-<digit> help form
         the argument.  Don't look up the pressed key in the key map. */
      if (reading_universal_argument)
        {
          int k = key;
          if (k >= KEYMAP_META_BASE)
            k -= KEYMAP_META_BASE;
          if (k == '-')
            {
              dash_typed = 1;
            }
          else if (isdigit (k))
            {
              digit_typed = 1;
            }
          else
            /* Note: we may still read another C-u after this. */
            reading_universal_argument = 0;
        }

      if (!dash_typed && !digit_typed && map[key].type == ISFUNC)
        {
          func = map[key].value.function ? map[key].value.function->func : 0;
          if (!func)
            {
              dispatch_error (info_keyseq);
              return 0;
            }
        }

      if (dash_typed || digit_typed || func == &info_add_digit_to_numeric_arg)
        {
          int k = key;
          if (k > KEYMAP_META_BASE)
            k -= KEYMAP_META_BASE;
          reading_universal_argument = 1;
          if (dash_typed || k == '-')
            {
              if (!*which_explicit_arg)
                {
                  numeric_arg_sign = -1;
                  numeric_arg = 1;
                }

            }
          else if (digit_typed || isdigit (k))
            {
              if (*which_explicit_arg)
                numeric_arg = numeric_arg * 10 + (k - '0');
              else
                numeric_arg = (k - '0');
              *which_explicit_arg = 1;
            }
        }
      else if (func == info_do_lowercase_version)
        {
          int lowerkey;

          if (key >= KEYMAP_META_BASE)
            {
              lowerkey = key;
              lowerkey -= KEYMAP_META_BASE;
              lowerkey = tolower (lowerkey);
              lowerkey += KEYMAP_META_BASE;
            }
          else
            lowerkey = tolower (key);

          if (lowerkey == key)
            {
              dispatch_error (info_keyseq);
              return 0;
            }
          key = lowerkey;
          continue;
        }
      else if (func == &info_universal_argument)
        {
          /* Multiply by 4. */
          /* TODO: Maybe C-u should also terminate the universal argument
             sequence, as in Emacs. (C-u 6 4 C-u 1 inserts 64 1's.) */
          if (!*which_explicit_arg)
            numeric_arg *= 4;
          reading_universal_argument = 1;
        }
      else if (menu && func == &info_menu_digit)
        {
          /* key can either be digit, or M-digit for --vi-keys. */

          int k = key;
          if (k > KEYMAP_META_BASE)
            k -= KEYMAP_META_BASE;
          window_clear_echo_area ();
          menu_digit (active_window, k);
          return 0;
        }
      else if (insert
               && (func == &ea_possible_completions || func == &ea_complete)
               && !echo_area_completion_items)
        {
          ea_insert (the_echo_area, 1, key);
          return 0;
        }
      else if (func)
        {
          /* Don't update the key sequence if we have finished reading a key
             sequence in the echo area.  This means that a key sequence like
             "C-u 2 Left" appears to take effect immediately, instead of there
             being a delay while the message is displayed. */
          if (!echo_area_is_active && info_keyseq_displayed_p)
            display_info_keyseq (0);

          if (count)
            *count = numeric_arg * numeric_arg_sign;

          /* *which_explicit_arg has not been set yet if only a sequence of
             C-u's was typed (each of which has multiplied the argument by
             four).  */
          if (*count != 1 && !*which_explicit_arg)
            *which_explicit_arg = 1;

          return func;
        }
      else if (map[key].type == ISKMAP)
        {
          if (map[key].value.keymap != NULL)
            map = map[key].value.keymap;
          else
            {
              dispatch_error (info_keyseq);
              return 0;
            }

          if (info_keyseq_displayed_p)
            display_info_keyseq (1);
        }

      do
        key = get_another_input_key ();
      while (key == KEY_MOUSE);
      add_char_to_keyseq (key);
    }

  return 0;
}

void
info_abort (void)
{
  /* If error printing doesn't oridinarily ring the bell, do it now,
     since C-g always rings the bell.  Otherwise, let the error printer
     do it. */
  if (!info_error_rings_bell_p)
    terminal_ring_bell ();
  info_error ("%s", _("Quit"));

  info_initialize_numeric_arg ();
}



/* **************************************************************** */
/*                                                                  */
/*                 Dumping and Printing Nodes                       */
/*                                                                  */
/* **************************************************************** */

struct info_namelist_entry
{
  struct info_namelist_entry *next;
  char name[1];
};

static int
info_namelist_add (struct info_namelist_entry **ptop, const char *name)
{
  struct info_namelist_entry *p;

  for (p = *ptop; p; p = p->next)
    if (fncmp (p->name, name) == 0)
      return 1;

  p = xmalloc (sizeof (*p) + strlen (name));
  strcpy (p->name, name);
  p->next = *ptop;
  *ptop = p;
  return 0;
}

static void
info_namelist_free (struct info_namelist_entry *top)
{
  while (top)
    {
      struct info_namelist_entry *next = top->next;
      free (top);
      top = next;
    }
}

enum
  {
    DUMP_SUCCESS,
    DUMP_INFO_ERROR,
    DUMP_SYS_ERROR
  };

static int dump_node_to_stream (FILE_BUFFER *file_buffer,
                          char *nodename, FILE *stream, int dump_subnodes);
static void initialize_dumping (void);

/* Dump the nodes specified with REFERENCES to the file named
   in OUTPUT_FILENAME.  If DUMP_SUBNODES is set, recursively dump
   the nodes which appear in the menu of each node dumped. */
void
dump_nodes_to_file (REFERENCE **references,
                    char *output_filename, int dump_subnodes)
{
  int i;
  FILE *output_stream;

  if (!references)
    return;

  /* Get the stream to print the nodes to.  Special case of an output
     filename of "-" means to dump the nodes to stdout. */
  if (strcmp (output_filename, "-") == 0)
    output_stream = stdout;
  else
    output_stream = fopen (output_filename, "w");

  if (!output_stream)
    {
      info_error (_("Could not create output file '%s'"), output_filename);
      return;
    }

  /* Print each node to stream. */
  for (i = 0; references[i]; i++)
    {
      FILE_BUFFER *file_buffer;
      char *nodename;

      initialize_dumping ();

      file_buffer = info_find_file (references[i]->filename);
      if (!file_buffer)
        {
          if (info_recent_file_error)
            info_error ("%s", info_recent_file_error);
          continue;
        }
      if (references[i]->nodename && *references[i]->nodename)
        nodename = references[i]->nodename;
      else
        nodename = "Top";
      if (dump_node_to_stream (file_buffer, nodename,
                               output_stream, dump_subnodes) == DUMP_SYS_ERROR)
        {
          info_error (_("error writing to %s: %s"), output_filename,
                      strerror (errno));
          exit (EXIT_FAILURE);
        }
    }

  if (output_stream != stdout)
    fclose (output_stream);

  debug (1, (_("closing %s"), output_filename));
}

/* A place to remember already dumped nodes. */
static struct info_namelist_entry *dumped_already;

static void
initialize_dumping (void)
{
  info_namelist_free (dumped_already);
  dumped_already = NULL;
}

/* Get and print the node specified by FILENAME and NODENAME to STREAM.
   If DUMP_SUBNODES is non-zero, recursively dump the nodes which appear
   in the menu of each node dumped. */
static int
dump_node_to_stream (FILE_BUFFER *file_buffer,
                     char *nodename,
                     FILE *stream, int dump_subnodes)
{
  register int i;
  NODE *node;

  node = info_get_node_of_file_buffer (file_buffer, nodename);

  if (!node)
    {
      info_error (msg_cant_find_node, nodename);
      return DUMP_INFO_ERROR;
    }

  /* If we have already dumped this node, don't dump it again. */
  if (info_namelist_add (&dumped_already, node->nodename))
    {
      free_node (node);
      return DUMP_SUCCESS;
    }

  /* Maybe we should print some information about the node being output. */
  debug (1, (_("writing node %s..."), node_printed_rep (node)));

  if (write_node_to_stream (node, stream))
    {
      free_node (node);
      return DUMP_SYS_ERROR;
    }

  /* If we are dumping subnodes, get the list of menu items in this node,
     and dump each one recursively. */
  if (dump_subnodes)
    {
      REFERENCE **menu = NULL;

      /* If this node is an Index, do not dump the menu references. */
      if (string_in_line ("Index", node->nodename) == -1)
        menu = node->references;

      if (menu)
        {
          for (i = 0; menu[i]; i++)
            {
              if (REFERENCE_MENU_ITEM != menu[i]->type) continue;

              /* We don't dump Info files which are different than the
                 current one. */
              if (!menu[i]->filename)
                if (dump_node_to_stream (file_buffer, menu[i]->nodename,
                      stream, dump_subnodes) == DUMP_SYS_ERROR)
                  {
                    free_node (node);
                    return DUMP_SYS_ERROR;
                  }
            }
        }
    }

  free_node (node);
  return DUMP_SUCCESS;
}

int
write_node_to_stream (NODE *node, FILE *stream)
{
  return fwrite (node->contents, node->nodelen, 1, stream) != 1;
}
