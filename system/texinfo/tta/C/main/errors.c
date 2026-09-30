/* Copyright 2010-2026 Free Software Foundation, Inc.

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

#include <config.h>

#ifdef ENABLE_NLS
#include <locale.h>
#include <gettext.h>
#include <libintl.h>
#endif

#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

/* also for xvasprintf */
#include "text.h"
#include "tree_types.h"
#include "document_types.h"
/* ENCODING_CONVERSION */
#include "converter_types.h"
/* for fatal */
#include "base_utils.h"
/* for output_conversions get_encoding_conversion */
#include "utils.h"
#include "errors.h"


#define MAX_INT(a,b) (((a)>(b))?(a):(b))
static void
reallocate_error_messages (ERROR_MESSAGE_LIST *error_messages,
                           size_t messages_number)
{
  if (messages_number > error_messages->space)
    {
      error_messages->list = realloc (error_messages->list,
         (error_messages->space += MAX_INT(10,
                             messages_number - error_messages->space))
           * sizeof (ERROR_MESSAGE));
    }
}
#undef MAX_INT

static ERROR_MESSAGE *
new_error_message (ERROR_MESSAGE_LIST *error_messages)
{
  ERROR_MESSAGE *error_message;
  reallocate_error_messages (error_messages, error_messages->number +1);
  error_message = &error_messages->list[error_messages->number];
  memset (error_message, 0, sizeof (ERROR_MESSAGE));

  error_messages->number++;

  return error_message;
}

/* only directly used for messages passed from Perl */
/* Format and register a message.  The file information present in
   CMD_SOURCE_INFO is not included in the message, because the file name
   should be in the input encoding while the message is in UTF-8, encoding
   the message and adding the file information is left for later */
void
message_list_line_formatted_message (ERROR_MESSAGE_LIST *error_messages,
                           enum error_type type, int continuation,
                           const SOURCE_INFO *cmd_source_info,
                           const char *message, int warn)
{
  TEXT error_line;
  ERROR_MESSAGE *error_message;

  error_message = new_error_message (error_messages);

  error_message->message = strdup (message);
  error_message->type = type;
  error_message->continuation = continuation;

  if (cmd_source_info)
    {
      error_message->source_info = *cmd_source_info;
    }

  text_init (&error_line);
  text_append (&error_line, "");
  if (error_message->source_info.macro)
    {
#ifdef ENABLE_NLS
      if (type == MSG_warning)
        {
          text_printf (&error_line,
                       pgettext ("Texinfo source file warning in macro",
                                 "warning: %s (possibly involving @%s)"),
                       error_message->message, error_message->source_info.macro);
        }
      else
        {
          text_printf (&error_line,
                       pgettext ("Texinfo source file error in macro",
                                 "%s (possibly involving @%s)"),
                       error_message->message, error_message->source_info.macro);
        }
#else
      if (type == MSG_warning)
        text_printf (&error_line, "warning: %s (possibly involving @%s)",
                     error_message->message, error_message->source_info.macro);
      else
        {
          text_printf (&error_line, "%s (possibly involving @%s)",
                    error_message->message, error_message->source_info.macro);
        }
#endif
    }
  else
    {
      if (type == MSG_warning)
        {
#ifdef ENABLE_NLS
          text_printf (&error_line, pgettext ("Texinfo source file warning",
                                              "warning: %s"),
                       error_message->message);
#else
          text_printf (&error_line, "warning: %s",
                       error_message->message);
#endif
        }
      else
        {
          text_printf (&error_line, "%s", error_message->message);
        }
    }
  text_append (&error_line, "\n");

  error_message->error_line = error_line.text;

  if (warn)
    fprintf (stderr, "%s", error_message->error_line);
}

void
vmessage_list_line_error (ERROR_MESSAGE_LIST *error_messages,
                          enum error_type type,
                          int continuation,
                          int warn,
                          const SOURCE_INFO *cmd_source_info,
                          const char *translation_context,
                          const char *format, va_list v)
{
  char *message;

#ifdef ENABLE_NLS
  if (translation_context)
    xvasprintf (&message, pgettext_expr (translation_context, format), v);
  else
    xvasprintf (&message, gettext (format), v);
#else
  xvasprintf (&message, format, v);
#endif

  if (!message) fatal ("vasprintf failed");

  message_list_line_formatted_message (error_messages,
                             type, continuation,
                             cmd_source_info, message, warn);
  free (message);
}

/* Format and register a message. */
void
message_list_document_formatted_message (ERROR_MESSAGE_LIST *error_messages,
                                         const OPTIONS *conf,
                                         enum error_type type, int continuation,
                                         const char *message)
{
  TEXT error_line;
  ERROR_MESSAGE *error_message;

  error_message = new_error_message (error_messages);

  error_message->message = strdup (message);
  error_message->type = type;
  error_message->continuation = continuation;

  text_init (&error_line);
  text_append (&error_line, "");

  if (conf && conf->PROGRAM.o.string && strlen (conf->PROGRAM.o.string))
    {
      if (type == MSG_document_warning)
        {
#ifdef ENABLE_NLS
          text_printf (&error_line,
                       pgettext ("whole document warning",
                                 "%s: warning: %s"),
                       conf->PROGRAM.o.string, error_message->message);
#else
          text_printf (&error_line, "%s: warning: %s",
                       conf->PROGRAM.o.string, error_message->message);
#endif
        }
      else
        {
          text_printf (&error_line, "%s: %s",
                       conf->PROGRAM.o.string, error_message->message);
        }
    }
  else
    {
      if (type == MSG_document_warning)
        {
#ifdef ENABLE_NLS
          text_printf (&error_line,
                       pgettext ("whole document warning",
                                 "warning: %s"),
                       error_message->message);
#else
          text_printf (&error_line, "warning: %s",
                       error_message->message);
#endif
        }
      else
        {
          text_append (&error_line, error_message->message);
        }
    }
  text_append (&error_line, "\n");

  error_message->error_line = error_line.text;

  /*
  if (conf && conf->DEBUG.integer > 0)
    fprintf (stderr, "%s", error_message->error_line);
   */
}

static void
message_list_document_error_internal (ERROR_MESSAGE_LIST *error_messages,
                                      const OPTIONS *conf,
                                      enum error_type type, int continuation,
                                      const char *format, va_list v)
{
  char *message;

#ifdef ENABLE_NLS
  xvasprintf (&message, gettext (format), v);
#else
  xvasprintf (&message, format, v);
#endif
  if (!message) fatal ("vasprintf failed");

  message_list_document_formatted_message (error_messages, conf, type,
                                           continuation, message);

  free (message);
}

void
message_list_line_error_ext (ERROR_MESSAGE_LIST *error_messages,
                             int warn, enum error_type type,
                             int continuation,
              const SOURCE_INFO *cmd_source_info, const char *format, ...)
{
  va_list v;

  va_start (v, format);
  vmessage_list_line_error (error_messages, type, continuation, warn,
                            cmd_source_info, 0, format, v);
  va_end (v);
}

void
message_list_command_warn (ERROR_MESSAGE_LIST *error_messages,
                           int warn, const ELEMENT *e, int continuation,
                           const char *format, ...)
{
  va_list v;

  va_start (v, format);
  vmessage_list_line_error (error_messages, MSG_warning, continuation,
                            warn, &e->e.c->source_info, 0, format, v);
  va_end (v);
}

void
pmessage_list_command_warn (ERROR_MESSAGE_LIST *error_messages,
                            int warn, const ELEMENT *e,
                            int continuation,
                            const char *translation_context,
                            const char *format, ...)
{
  va_list v;

  va_start (v, format);
  vmessage_list_line_error (error_messages, MSG_warning, continuation,
                            warn, &e->e.c->source_info,
                            translation_context, format, v);
  va_end (v);
}

void
message_list_command_error (ERROR_MESSAGE_LIST *error_messages,
                            int warn, const ELEMENT *e,
                            const char *format, ...)
{
  va_list v;

  va_start (v, format);
  vmessage_list_line_error (error_messages, MSG_error, 0, warn,
                            &e->e.c->source_info, 0, format, v);
  va_end (v);
}

void
message_list_document_error (ERROR_MESSAGE_LIST *error_messages,
                             const OPTIONS *conf, int continuation,
                             const char *format, ...)
{
  va_list v;

  va_start (v, format);
  message_list_document_error_internal (error_messages, conf,
                                        MSG_document_error,
                                        continuation,
                                        format, v);
  va_end (v);
}

void
message_list_document_warn (ERROR_MESSAGE_LIST *error_messages,
                            const OPTIONS *conf, int continuation,
                            const char *format, ...)
{
  va_list v;

  va_start (v, format);
  message_list_document_error_internal (error_messages, conf,
                                        MSG_document_warning,
                                        continuation,
                                        format, v);
  va_end (v);
}

/* setup error message by adding file information and converting the
   error line to message encoding */
/* if USE_FILENAME is set, remove file information directories */
void
error_message_text (const ERROR_MESSAGE *error_msg, int use_filename,
                    ENCODING_CONVERSION *conversion, TEXT *text)
{
  if (error_msg->source_info.file_name)
    {
      if (use_filename)
        {
          char *file_name_and_directory[2];
          parse_file_path (error_msg->source_info.file_name,
                           file_name_and_directory);

          text_append (text, file_name_and_directory[0]);

          free (file_name_and_directory[0]);
          free (file_name_and_directory[1]);
        }
      else
        text_append (text, error_msg->source_info.file_name);

      text_append_n (text, ":", 1);
    }
  if (error_msg->source_info.line_nr > 0)
    {
      text_printf (text, "%d:", error_msg->source_info.line_nr);
    }

  if (text->end > 0)
    text_append_n (text, " ", 1);

  if (conversion)
    {
      char *encoded = encode_with_iconv (conversion->iconv,
                                         error_msg->error_line,
                                         &error_msg->source_info,
                                         ieh_mark, 0);
      text_append (text, encoded);
      free (encoded);
    }
  else
    text_append (text, error_msg->error_line);
}

static void
wipe_error_messages (ERROR_MESSAGE_LIST *error_messages)
{
  size_t j;
  for (j = 0; j < error_messages->number; j++)
    {
      free (error_messages->list[j].message);
      free (error_messages->list[j].error_line);
    }
}

void
wipe_error_message_list (ERROR_MESSAGE_LIST *error_messages)
{
  wipe_error_messages (error_messages);
  free (error_messages->list);
  memset (error_messages, 0, sizeof (ERROR_MESSAGE_LIST));
}

void
clear_error_message_list (ERROR_MESSAGE_LIST *error_messages)
{
  wipe_error_messages (error_messages);
  error_messages->number = 0;
}

/* returns the number of messages of type error that are not continuations */
size_t
count_errors (ERROR_MESSAGE_LIST *error_messages)
{
  size_t count = 0;
  size_t i;

  for (i = 0; i < error_messages->number; i++)
    {
      const ERROR_MESSAGE *error_msg = &error_messages->list[i];
      if (!error_msg->continuation
          && (error_msg->type == MSG_document_error
              || error_msg->type == MSG_error))
        count++;
    }
  return count;
}

/* add file information to message and print out.  Similar to texi2any.pl
   _output_error_messages.  Main difference is that converter
   error messages are cleared in this function.  Used from C only */
size_t
output_error_messages (ERROR_MESSAGE_LIST *error_messages,
                       const char *message_encoding,
                       int no_warn, int use_filename)
{
  TEXT text;
  ENCODING_CONVERSION *conversion = 0;
  size_t i;
  size_t error_nrs = count_errors (error_messages);

  if (message_encoding)
    conversion = get_encoding_conversion (message_encoding,
                                          &output_conversions);

  text_init (&text);

  for (i = 0; i < error_messages->number; i++)
    {
      const ERROR_MESSAGE *error_msg = &error_messages->list[i];
      if (error_msg->type == MSG_warning && no_warn > 0)
        continue;

      text_reset (&text);
      error_message_text (error_msg, use_filename, conversion, &text);
      fprintf (stderr, "%s", text.text);
    }

  free (text.text);

  clear_error_message_list (error_messages);

  return error_nrs;
}

void
merge_error_messages_lists (ERROR_MESSAGE_LIST *dst,
                            ERROR_MESSAGE_LIST *src)
{
  reallocate_error_messages (dst, dst->number + src->number);

  memcpy (&dst->list[dst->number], &src->list[0],
          sizeof (ERROR_MESSAGE) * src->number);
  dst->number += src->number;
  src->number = 0;
  wipe_error_message_list (src);
}

/* In Texinfo::Report */
void
print_source_info_details (SOURCE_INFO *source_info, TEXT *result,
                           const char *fname_encoding, int use_filename)
{
  if (!source_info->file_name && !source_info->line_nr
      && !source_info->macro)
    return;

  if (source_info->file_name)
    {
      int status;
      char *decoded_file_name;
      if (use_filename)
        {
          char *file_name_and_directory[2];
          parse_file_path (source_info->file_name,
                           file_name_and_directory);

          if (fname_encoding)
            decoded_file_name
              = decode_string (file_name_and_directory[0], fname_encoding,
                               &status, 0);
          else
            decoded_file_name = file_name_and_directory[0];

          text_append (result, decoded_file_name);

          free (file_name_and_directory[0]);
          free (file_name_and_directory[1]);
        }
      else
        {
          if (fname_encoding)
            decoded_file_name
              = decode_string (source_info->file_name, fname_encoding,
                               &status, 0);
          else
            decoded_file_name = source_info->file_name;
          text_append (result, decoded_file_name);
        }

      if (fname_encoding)
        free (decoded_file_name);

      if (source_info->line_nr || source_info->macro)
        text_append_n (result, ":", 1);
    }

  if (source_info->line_nr > 0)
    {
      text_printf (result, "l%d", source_info->line_nr);
      if (source_info->macro)
        text_append_n (result, ":", 1);
    }

  if (source_info->macro)
    text_printf (result, "@%s", source_info->macro);
}
