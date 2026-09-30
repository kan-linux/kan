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

#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "document_types.h"
#include "converter_types.h"
#include "customization_options.h"
/* decode_string parse_file_path texinfo_input_file_basename */
#include "utils.h"
#include "errors.h"
#include "convert_to_text.h"
/* set_output_encoding */
#include "document.h"
/* apply_converter_info create_destination_directory write_or_return */
#include "converter.h"
/* converter_encoded_output_file_name */
#include "convert_utils.h"
#include "rawtext_converter_api.h"

void
rawtext_converter (CONVERTER *converter,
                   const CONVERTER_INITIALIZATION_INFO *user_conf)
{
  converter->conf = new_options ();
  converter->sorted_options = new_sorted_options (converter->conf);

  if (user_conf)
    apply_converter_info (converter, user_conf, 1);

  /* NOTE: for other converters, this is set for each conversion */
  converter->convert_text_options
    = copy_converter_options_for_convert_text (converter);
}

static void
initialize_text_options_encoding (const OPTIONS *options,
                                  TEXT_OPTIONS *text_options)
{
  if (options->ENABLE_ENCODING.o.integer > 0
      && options->OUTPUT_ENCODING_NAME.o.string)
    {
      free (text_options->encoding);
      text_options->encoding = strdup (options->OUTPUT_ENCODING_NAME.o.string);
    }
}

char *
rawtext_output (CONVERTER *converter, DOCUMENT *document)
{
  GLOBAL_INFO *document_info = 0;
  GLOBAL_COMMANDS *global_commands = 0;
  char *input_basename;
  char *input_basefile;
  char *result;
  const char *setfilename = 0;
  char *outfile = 0;
  FILE *file_fh = 0;
  char *encoded_out_filepath = 0;

  if (document)
    {
      document_info = &document->global_info;
      global_commands = &document->global_commands;
    }

  set_output_encoding (converter->conf, document);

  initialize_text_options_encoding (converter->conf,
                                    converter->convert_text_options);

  if (document_info && document_info->input_file_name)
    {
      const char *encoding = converter->conf->COMMAND_LINE_ENCODING.o.string;
      char *input_file_name;
      char *input_file_name_and_directory[2];

      if (encoding)
        {
          int status;
          input_file_name = decode_string (document_info->input_file_name,
                                           encoding, &status, 0);
        }
      else
        input_file_name = strdup (document_info->input_file_name);

      parse_file_path (input_file_name, input_file_name_and_directory);
      input_basefile = input_file_name_and_directory[0];
      free (input_file_name_and_directory[1]);
      free (input_file_name);
    }
  else
    input_basefile = strdup ("");

  if (!strcmp (input_basefile, "-"))
    input_basename = strdup ("stdin");
  else
    {
      input_basename = texinfo_input_file_basename (input_basefile);
    }
  free (input_basefile);

  if (converter->conf->setfilename.o.string)
    setfilename = converter->conf->setfilename.o.string;
  else if (global_commands && global_commands->setfilename)
    {
      enum command_id cmd;
      setfilename
        = informative_command_value (global_commands->setfilename, &cmd);
    }

  if (!converter->conf->OUTFILE.o.string)
    {
      char *basename_for_outfile = 0;
      if (setfilename)
        {
          basename_for_outfile = remove_extension (setfilename);
        }
      else if (strlen (input_basename))
        basename_for_outfile = strdup (input_basename);

      if (basename_for_outfile)
        {
          char *basefile_for_outfile;

          xasprintf (&basefile_for_outfile, "%s.txt", basename_for_outfile);
          free (basename_for_outfile);

          if (converter->conf->SUBDIR.o.string)
            {
              char *destination_directory
                = file_separator_canonpath (converter->conf->SUBDIR.o.string);
              char *dir_encoding;
              int succeeded;
              char *encoded_destination_directory
                   = converter_encoded_output_file_name (converter->conf,
                                               document_info,
                                               (char *)destination_directory,
                                                       &dir_encoding, 0);
              free (dir_encoding);

              succeeded = create_destination_directory (converter,
                                     encoded_destination_directory,
                                           destination_directory);
              free (encoded_destination_directory);
              if (!succeeded)
                {
                  free (basefile_for_outfile);
                  free (destination_directory);
                  return 0;
                }

              xasprintf (&outfile, "%s/%s", destination_directory,
                                       basefile_for_outfile);
              free (destination_directory); 
            }
          else 
            outfile = strdup (basefile_for_outfile);
          free (basefile_for_outfile);
        }
    }
  else
    {
      char *output_filename_and_directory[2];
      char *dir_encoding;
      char *encoded_destination_directory;
      char *destination_directory;

      outfile = strdup (converter->conf->OUTFILE.o.string);

      parse_file_path (outfile, output_filename_and_directory);
      free (output_filename_and_directory[0]);
      destination_directory = output_filename_and_directory[1];

      if (destination_directory && strlen (destination_directory)
          && strcmp (destination_directory, "./")
          && strcmp (destination_directory, "."))
        {
          encoded_destination_directory
           = converter_encoded_output_file_name (converter->conf,
                                       document_info,
                                       (char *)destination_directory,
                                                   &dir_encoding, 0);
          free (dir_encoding);

          create_destination_directory (converter,
                                 encoded_destination_directory,
                                       destination_directory);
          free (encoded_destination_directory);
        }
      free (destination_directory);
    }
  free (input_basename);

  if (outfile)
    {
      char *path_encoding;
      int overwritten_file;
      char *open_error_message;

      encoded_out_filepath
              = converter_encoded_output_file_name (converter->conf,
                                                       document_info,
                                  (char *)outfile, &path_encoding, 0);
      /* overwritten_file being set cannot happen */
      file_fh = output_files_open_out (&converter->output_files_information,
                                   encoded_out_filepath, &open_error_message,
                                   &overwritten_file, 0);
      free (path_encoding);

      if (!file_fh)
        {
          message_list_document_error (&converter->error_messages,
                             converter->conf, 0,
                             "could not open %s for writing: %s",
                             outfile, open_error_message);
          free (open_error_message);
          free (encoded_out_filepath);
          free (outfile);
          return 0;
        }
    }

  result = convert_to_text (document->tree,
                            converter->convert_text_options);
  if (file_fh)
    {
      const ENCODING_CONVERSION *conversion = 0;
      if (converter->conf->OUTPUT_ENCODING_NAME.o.string
          && strcmp (converter->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8"))
        {
          conversion
             = get_encoding_conversion (
                           converter->conf->OUTPUT_ENCODING_NAME.o.string,
                                              &output_conversions);
        }
      write_or_return (conversion, encoded_out_filepath,
                       file_fh, 0, result);
      free (result);

      /* Do not close STDOUT now such that the file descriptor is not reused
         by open, which uses the lowest-numbered file descriptor not open,
         for another filehandle.  Closing STDOUT is handled by the caller. */
      if (strcmp (outfile, "-"))
        {
          output_files_register_closed (&converter->output_files_information,
                                        encoded_out_filepath);
          if (fclose (file_fh))
            {
              message_list_document_error (&converter->error_messages,
                                           converter->conf, 0,
                                           "error on closing %s: %s",
                                           outfile, strerror (errno));
              free (encoded_out_filepath);
              free (outfile);
              return 0;
            }
        }

      result = strdup ("");
    }

  free (encoded_out_filepath);
  free (outfile);

  return result;
}

char *
rawtext_convert (CONVERTER *converter, DOCUMENT *document)
{
  char *result;

  set_output_encoding (converter->conf, document);

  initialize_text_options_encoding (converter->conf,
                                    converter->convert_text_options);

  result = convert_to_text (document->tree,
                            converter->convert_text_options);
  return result;
}

char *
rawtext_convert_tree (CONVERTER *converter,
                      const ELEMENT *tree)
{
  char *result = convert_to_text (tree, converter->convert_text_options);
  return result;
}


