/* errors.h - declarations for error.c */
#ifndef ERRORS_H
#define ERRORS_H

#include <stddef.h>
#include <stdarg.h>

#include "text.h"
#include "tree_types.h"
#include "options_data.h"
#include "document_types.h"
#include "converter_types.h"

void wipe_error_message_list (ERROR_MESSAGE_LIST *error_messages);
void clear_error_message_list (ERROR_MESSAGE_LIST *error_messages);
void message_list_line_formatted_message (ERROR_MESSAGE_LIST *error_messages,
                           enum error_type type, int continuation,
                           const SOURCE_INFO *cmd_source_info,
                           const char *message, int warn);
void vmessage_list_line_error (ERROR_MESSAGE_LIST *error_messages,
                          enum error_type type,
                          int continuation, int warn,
                          const SOURCE_INFO *cmd_source_info,
                          const char *translation_context,
                          const char *format, va_list v);
void message_list_line_error_ext (ERROR_MESSAGE_LIST *error_messages,
                             int warn, enum error_type type,
                             int continuation,
                const SOURCE_INFO *cmd_source_info, const char *format, ...);
void message_list_command_error (ERROR_MESSAGE_LIST *error_messages,
                            int debug, const ELEMENT *e,
                            const char *format, ...);
void message_list_command_warn (ERROR_MESSAGE_LIST *error_messages,
                           int warn, const ELEMENT *e, int continuation,
                           const char *format, ...);
void pmessage_list_command_warn (ERROR_MESSAGE_LIST *error_messages,
                            int warn, const ELEMENT *e,
                            int continuation,
                            const char *translation_context,
                            const char *format, ...);

void message_list_document_formatted_message (ERROR_MESSAGE_LIST *error_messages,
                                         const OPTIONS *conf,
                                         enum error_type type, int continuation,
                                         const char *message);
void message_list_document_error (ERROR_MESSAGE_LIST *error_messages,
                                  const OPTIONS *conf, int continuation,
                                  const char *format, ...);
void message_list_document_warn (ERROR_MESSAGE_LIST *error_messages,
                                 const OPTIONS *conf, int continuation,
                                 const char *format, ...);

/* Define an alias to avoid file being picked up by "make po-check" or
   by xgettext.  This should only be used when not passed a string
   literal that is to be translated. */
#define message_list_document_warn_no_xlate message_list_document_warn

size_t count_errors (ERROR_MESSAGE_LIST *error_messages);

void error_message_text (const ERROR_MESSAGE *error_msg, int use_filename,
                         ENCODING_CONVERSION *conversion, TEXT *text);
size_t output_error_messages (ERROR_MESSAGE_LIST *error_messages,
                              const char *message_encoding,
                              int no_warn, int use_filename);

void merge_error_messages_lists (ERROR_MESSAGE_LIST *dst,
                                 ERROR_MESSAGE_LIST *src);

void print_source_info_details (SOURCE_INFO *source_info, TEXT *result,
                                const char *fname_encoding, int use_filename);
#endif
