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

/* In sync with Texinfo::Translations */

#include <config.h>

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <errno.h>
#include <stddef.h>
#include <stdint.h>

#ifdef ENABLE_NLS
#include <libintl.h>
#endif
/* also to have a definition of gettext in case ENABLE_NLS is not set */
#include "gettext.h"

#include "text.h"
#include "command_ids.h"
#include "tree_types.h"
#include "options_data.h"
#include "types_data.h"
/* isascii_lower isascii_upper fatal */
#include "base_utils.h"
#include "tree.h"
#include "hashmap.h"
/* read_flag_len */
#include "utils.h"
#include "manipulate_tree.h"
#include "api_to_perl.h"
#include "debug.h"
#include "document.h"
#include "conf.h"
#include "api.h"
#include "call_perl_function.h"
/* for debugging */
#include "convert_to_texinfo.h"
#include "translations.h"

#define _(String) gettext (String)

/*
my $DEFAULT_ENCODING = 'utf-8';
*/

static char *working_locale = 0;
static char *locale_command = 0;

static int no_local_found_error_output = 0;

static const char *strings_textdomain = "texinfo_document";

static int use_external_translate_string;

/* USE_EXTERNAL_TRANSLATE_STRING_IN:
    -1: never call external (Perl) translate string
    0: default, use USE_LIBINTL_PERL_IN_XS value
    1: always call external (Perl) translate string
 */
void
configure_output_strings_translations (const char *localesdir,
                                       const char *strings_textdomain_in,
                                       int use_external_translate_string_in)
{
  const char *textdomain_directory;
  if (strings_textdomain_in)
    strings_textdomain = strings_textdomain_in;

  if (use_external_translate_string_in != 0)
    use_external_translate_string = use_external_translate_string_in;
  else
    {
#ifndef USE_LIBINTL_PERL_IN_XS
      use_external_translate_string = 0;
#else
      use_external_translate_string = 1;
#endif
    }

#ifdef ENABLE_NLS
  textdomain_directory = bindtextdomain (strings_textdomain, localesdir);

  if (!textdomain_directory)
    {
      fprintf (stderr, "bindtextdomain: error setting %s to `%s': %s\n",
               strings_textdomain, localesdir, strerror (errno));
    }
#endif
}

/* return non-zero if locale is "C", "C.UTF-8" (or similar) or "POSIX" */
static int
locale_name_check (const char *line)
{
  return strcmp (line, "C") == 0
           || strncmp (line, "C.", 2) == 0
           || strcmp (line, "POSIX") == 0;
}

void
switch_messages_locale (void)
{
  char *locale = 0;
  int setenv_status = 1;

  if (working_locale)
    {
      /* Note that running "setlocale (LC_MESSAGES, working_locale)" directly
         may not work depending on platform and/or gettext version.
         Similarly, setting LANG instead of LC_ALL may not work.
       */
      setenv_status = setenv ("LC_ALL", working_locale, 1);
      locale = setlocale (LC_MESSAGES, "");
    }
  if (!locale || setenv_status)
    {
      setenv_status = setenv ("LC_ALL", "en_US.UTF-8", 1);
      locale = setlocale (LC_MESSAGES, "");
    }
  if (!locale || setenv_status)
    {
      setenv_status = setenv ("LC_ALL", "en_US", 1);
      locale = setlocale (LC_MESSAGES, "");
    }
  if ((!locale || setenv_status) && !locale_command)
    {
      FILE *p;
    /* we ignore the errors as we have a more general warning message below
       and we are not really interested by locale errors */
      locale_command = "locale -a 2>/dev/null";

      p = popen (locale_command, "r");
      if (p)
        {
          size_t n = 0;

          while (1)
            {
              char *line = 0;
              ssize_t ret = getline (&line, &n, p);
              if (ret == (ssize_t) -1)
                {
                  free (line);
                  pclose (p);
                  break;
                }
              line[ret - 1] = '\0';   /* Remove trailing newline. */
              if (locale_name_check (line))
                {
                  free (line);
                  continue;
                }
              setenv_status = setenv ("LC_ALL", line, 1);
              locale = setlocale (LC_MESSAGES, "");
              if (locale && !setenv_status)
                {
                  free (line);
                  pclose (p);
                  break;
                }
            }
        }
    }
  if (locale)
    {
  /* check that the locale set is not "C"/"POSIX" as we want to set
     to other locales for LANGUAGE.  The locale returned by setlocale
     can be these one of these locales even if the locale passed
     in argument is not */
      if (!locale_name_check (locale))
        {
          free (working_locale);
          working_locale = strdup (locale);
        }
      else if (!working_locale)
        {
          /* There is no access to converter/document/... so the warning
             is unconditionally output here and now.  This may be
             annoying if the user cannot fix the issue, but let's wait for
             actual cases */
          fprintf (stderr, "%s\n",
 _("Cannot switch to a locale compatible with document strings translations"));
          free (working_locale);
          working_locale = strdup (locale);
        }
    }
  else
    {
      if (!no_local_found_error_output)
        {
          fprintf (stderr, "%s\n",
 _("Cannot find a locale compatible with document strings translations"));
          no_local_found_error_output = 1;
        }
    }
}

/* STRING in input must never be NULL */
char *
translate_string (const char *string, const char *in_lang,
                  const char *in_encoded_lang,
                  const char *translation_context)
{
  /* const char *lang = in_lang; */
  const char *encoded_lang = in_encoded_lang;
  char *saved_LANGUAGE;
  char *saved_LANG;
  char *saved_LC_ALL;
  char *saved_LC_MESSAGES;
  char *langs[2] = {0, 0};
  char *main_lang = 0;
  char *translated_string = 0;
  char *p;
  static TEXT language_locales;
  int i;

  if (!in_lang || !strlen (in_lang))
    return strdup (string);

#ifndef ENABLE_NLS
  if (use_external_translate_string < 0)
    {
      translated_string = strdup (string);
      return translated_string;
    }
  else
    {
      translated_string = call_translations_translate_string (string, in_lang,
                                               in_encoded_lang,
                                               translation_context);
      if (!translated_string)
        return strdup (string);
      else
        return translated_string;
    }
#else
  if (use_external_translate_string > 0)
    {
      translated_string = call_translations_translate_string (string, in_lang,
                                               in_encoded_lang,
                                               translation_context);
      if (translated_string)
        return translated_string;
    }

  /* with the following code valgrind reports issues in perl memory */

  /* if a code calls setlocale and accesses global locale while perl
     uses per thread locale, the result is unpredictable.  So we switch to
     global locales as we use setlocale */
  call_switch_to_global_locale ();

  /*
  We need to set LC_MESSAGES to a valid locale other than "C" or "POSIX"
  for translation via LANGUAGE to work.  (The locale is "C" if the
  tests are being run.)
  LC_MESSAGES was reported not to exist for Perl on MS-Windows. */

# ifndef _WIN32
  /* In
   https://www.gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html
    Note: The variable LANGUAGE is ignored if the locale is set to ‘C’. In
    other words, you have to first enable localization, by setting LANG (or
    LC_ALL) to a value other than ‘C’, before you can use a language priority
    list through the LANGUAGE variable.

   We set LANG and then LC_MESSAGES to a valid locale in
   switch_messages_locale to have LANGUAGE work in that case. */

  saved_LANG = getenv ("LANG");
  if (saved_LANG)
    saved_LANG = strdup (saved_LANG);

  saved_LC_ALL = getenv ("LC_ALL");
  if (saved_LC_ALL)
    saved_LC_ALL = strdup (saved_LC_ALL);

  saved_LC_MESSAGES = setlocale (LC_MESSAGES, NULL);

  if (saved_LC_MESSAGES)
    saved_LC_MESSAGES = strdup (saved_LC_MESSAGES);

  switch_messages_locale ();

# endif

  saved_LANGUAGE = getenv ("LANGUAGE");

  if (saved_LANGUAGE)
    {
      saved_LANGUAGE = strdup (saved_LANGUAGE);
    }

  textdomain (strings_textdomain);
  bind_textdomain_codeset (strings_textdomain, "utf-8");

  /* using encoded_lang is not very important here, as we only accept
     ASCII characters.  Using UTF-8 could even have been more robust,
     if the encoding lang is encoded to is not ASCII compatible.  We
     still use it to be more like Perl code */
  langs[0] = strdup (encoded_lang);
  p = strchr (encoded_lang, '_');
  if (p && p - encoded_lang > 0)
    {
      char *q = p;
      while (isascii_lower (*q))
        q++;
      if (q == p)
        {
          q++;
          while (isascii_upper (*q))
            q++;
          if (q - (p + 1) > 0)
            {
              main_lang = strndup (encoded_lang, p - encoded_lang);
            }
        }
    }
  if (main_lang)
    langs[1] = main_lang;

  text_init (&language_locales);

  for (i = 0; i < 2; i++)
    {
      if (!langs[i])
        continue;
      if (i > 0)
        text_append_n (&language_locales, ":", 1);
      text_append (&language_locales, langs[i]);
      free (langs[i]);
    }

  if (setenv ("LANGUAGE", language_locales.text, 1) != 0)
    {
      fprintf (stderr,
              "translate_string: setenv `%s' error for string `%s': %s\n",
              language_locales.text, string, strerror (errno));
    }

  /* pgettext only works with string litterals, so use pgettext_expr */
  if (translation_context)
    translated_string = strdup (pgettext_expr (translation_context, string));
  else
    translated_string = strdup (gettext (string));

  /*
  fprintf (stderr, "TRANSLATED(%s): '%s' (%s) '%s'\n", language_locales.text,
                               string, translation_context, translated_string);

  */

  if (saved_LANGUAGE)
    {
      setenv ("LANGUAGE", saved_LANGUAGE, 1);
      free (saved_LANGUAGE);
    }
  else
    unsetenv ("LANGUAGE");

  free (language_locales.text);

# ifndef _WIN32
  if (saved_LANG)
    {
      setenv ("LANG", saved_LANG, 1);
      free (saved_LANG);
    }
  else
    unsetenv ("LANG");

  if (saved_LC_ALL)
    {
      setenv ("LC_ALL", saved_LC_ALL, 1);
      free (saved_LC_ALL);
    }
  else
    unsetenv ("LC_ALL");

  if (saved_LC_MESSAGES)
    {
      setlocale (LC_MESSAGES, saved_LC_MESSAGES);
      free (saved_LC_MESSAGES);
    }
  else
    setlocale (LC_MESSAGES, "");
# endif

  call_sync_locale ();

  return translated_string;
#endif
}

LANG_TRANSLATION *
new_lang_translation (const char *lang, const char *locale_encoding)
{
  LANG_TRANSLATION *result = (LANG_TRANSLATION *)
    malloc (sizeof (LANG_TRANSLATION));
  if (lang)
    {
      int status;
      int iconv_status = 0;
      char *encoded_lang;

      result->lang = strdup (lang);
      /* encode_string allows a NULL encoding */
      /* cast to remove const */
      encoded_lang = encode_string ((char *)lang, locale_encoding,
                                    &status, 0, ieh_skip, &iconv_status);
      if (iconv_status)
        {/* happens if the conversion to the locale encoding is not
            possible */
          free (encoded_lang);
          result->encoded_lang = strdup (lang);
        }
      else
        result->encoded_lang = encoded_lang;
    }
  else
    {
      result->lang = strdup ("");
      result->encoded_lang = strdup ("");
    }
  result->translations = 0;

  return result;
}

void
free_lang_translation_tree_list (LANG_TRANSLATION_TREE_LIST *translations)
{
  size_t i;

  clear_c_hashmap (translations->hash);
  free (translations->hash);
  for (i = 0; i < translations->number; i++)
    {
      TRANSLATION_TREE *translation_tree = translations->list[i];
      free (translation_tree->translated);
      free (translation_tree->translation);
      if (translation_tree->tree)
        destroy_element_and_children (translation_tree->tree);
      free (translation_tree);
    }
  free (translations->list);
}

void
free_lang_translation (LANG_TRANSLATION *lang_translation)
{
  free (lang_translation->lang);
  free (lang_translation->encoded_lang);
  if (lang_translation->translations)
    {
      free_lang_translation_tree_list (lang_translation->translations);
      free (lang_translation->translations);
    }
}

void
free_translation_cache (LANG_TRANSLATION **translation_cache)
{
  if (translation_cache)
    {
      size_t i;

      for (i = 0; translation_cache[i]; i++)
        {
          free_lang_translation (translation_cache[i]);
          free (translation_cache[i]);
        }
      free (translation_cache);
    }
}

  /* formatted_index_entries may not be initialized if there was an error
     early and prepare_conversion_units_targets was never called */
LANG_TRANSLATION **translation_cache;

LANG_TRANSLATION *
get_lang_translation (LANG_TRANSLATION ***lang_translations_ptr,
                      const char *lang, const char *locale_encoding,
                      size_t cache_size)
{
  size_t i = 0;
  LANG_TRANSLATION **lang_translations = *lang_translations_ptr;

  if (lang_translations)
    {
      for (i = 0; lang_translations[i]; i++)
        {
          if (!strcmp (lang_translations[i]->lang, lang))
            {
              return lang_translations[i];
            }
        }
    }

  *lang_translations_ptr = (LANG_TRANSLATION **)
    realloc (*lang_translations_ptr,
             (i+2) * sizeof (LANG_TRANSLATION *));

  lang_translations = *lang_translations_ptr;

  lang_translations[i+1] = 0;
  lang_translations[i] = new_lang_translation (lang, locale_encoding);

  lang_translations[i]->translations = (LANG_TRANSLATION_TREE_LIST *)
     malloc (sizeof(LANG_TRANSLATION_TREE_LIST));
   memset (lang_translations[i]->translations, 0,
           sizeof (LANG_TRANSLATION_TREE_LIST));

  lang_translations[i]->translations->hash = new_c_hashmap (cache_size);

  return lang_translations[i];
}

LANG_TRANSLATION *
switch_lang_translations (LANG_TRANSLATION ***lang_translations,
                          const char *in_lang,
                          LANG_TRANSLATION *current_lang_translations,
                          const char *command_line_encoding,
                          size_t cache_size)
{
  const char *lang;
  LANG_TRANSLATION *lang_translation;

  if (in_lang)
    lang = in_lang;
  else
    lang = "";

  if (current_lang_translations
      && !strcmp(current_lang_translations->lang, lang))
    return current_lang_translations;

  lang_translation
    = get_lang_translation (lang_translations, lang,
                            command_line_encoding, cache_size);
  return lang_translation;
}

TRANSLATION_TREE *
new_translation_tree (const char *translated)
{
  TRANSLATION_TREE *result = (TRANSLATION_TREE *) malloc
                                 (sizeof (TRANSLATION_TREE));
  memset (result, 0, sizeof (TRANSLATION_TREE));
  result->translated = strdup (translated);
  return result;
}

TRANSLATION_TREE *
add_translation_tree (LANG_TRANSLATION_TREE_LIST *translations,
                      const char *translated)
{
  uintptr_t translation_nr;
  TRANSLATION_TREE *result;

  if (translations->number >= translations->space)
    {
      translations->list = (TRANSLATION_TREE **)
        realloc (translations->list,
                 (translations->space += 5) * sizeof (TRANSLATION_TREE *));
    }
  result = new_translation_tree (translated);
  translations->list[translations->number] = result;

  translations->number++;
  translation_nr = translations->number;
  c_hashmap_register (translations->hash, translated, (void *)translation_nr);

  return result;
}

TRANSLATION_TREE *
cache_translate_string (const char *string,
                        LANG_TRANSLATION *lang_translation,
                        const char *translation_context)
{
  const char *lang;
  const char *encoded_lang;
  const char *translation_context_str;
  LANG_TRANSLATION_TREE_LIST *translations;
  char *translated_context_string;
  TRANSLATION_TREE *result;
  uintptr_t string_nr;
  int found;

  if (lang_translation && lang_translation->lang)
    {
      lang = lang_translation->lang;
      encoded_lang = lang_translation->encoded_lang;
    }
  else
    {
      lang = "";
      encoded_lang = "";
    }

  if (translation_context)
    translation_context_str = translation_context;
  else
    translation_context_str = "";

  xasprintf (&translated_context_string, "%s-%s",
             string, translation_context_str);

  if (lang_translation && lang_translation->translations)
    translations = lang_translation->translations;
  else
    {
      /* TODO When does this happen?  We do not know the command line
         encoding here, we could get it as arguments.  It is only in
         rare cases and one should consider the documentlanguage
         name with non-ASCII characters is invalid */
      LANG_TRANSLATION *general_lang_translation
        = get_lang_translation (&translation_cache, lang, 0,
                                TXI_CONVERT_STRINGS_NR);
      translations = general_lang_translation->translations;
    }

  string_nr = (uintptr_t) c_hashmap_value (translations->hash,
                                           translated_context_string, &found);
  if (found)
    {
      result = translations->list[string_nr -1];
      free (translated_context_string);
      return result;
    }

  result = add_translation_tree (translations, translated_context_string);

  if (strlen (lang))
    {
      char *translated_string
        = translate_string (string, lang, encoded_lang,
                            translation_context);
      result->translation = translated_string;
    }

  free (translated_context_string);

  return result;
}

char *
replace_substrings (const char *string,
                    const NAMED_STRING_ELEMENT_LIST *replaced_substrings)
{
  const char *p = string;
  TEXT substituted;

  if (!replaced_substrings)
    return strdup (string);

  text_init (&substituted);
  text_append (&substituted, "");

  while (*p)
    {
      const char *q = strchr (p, '{');
      if (q)
        {
          int found = 0;
          size_t flag_len;

          if (q - p)
            text_append_n (&substituted, p, q - p);

          p = q;
          /* past { */
          q++;
          flag_len = read_flag_len (q);
          if (flag_len)
            {
              if (*(q + flag_len) == '}')
                {
                  size_t i;
                  char *flag = strndup (q, flag_len);

                  /* past } */
                  q += flag_len +1;
                  for (i = 0; i < replaced_substrings->number; i++)
                    {
                      if (!strcmp (replaced_substrings->list[i].name,
                                   flag))
                        {
                          text_append (&substituted,
                                     replaced_substrings->list[i].string);
                          found = 1;
                          break;
                        }
                    }
                  free (flag);
                }
            }
          if (!found)
            text_append_n (&substituted, p, q - p);
          p = q;
        }
      else
        {
          text_append (&substituted, p);
          break;
        }
    }
  return substituted.text;
}

ELEMENT *
substitute_substrings_in_tree (ELEMENT *tree,
                        NAMED_STRING_ELEMENT_LIST *replaced_substrings);

void
substitute_element_array (ELEMENT_LIST *list,
                          NAMED_STRING_ELEMENT_LIST *replaced_substrings)
{
  size_t idx = 0;

  for (; idx < list->number; idx++)
    {
      ELEMENT *e = list->list[idx];
      if (! (type_data[e->type].flags & TF_text))
        {
          if (e->e.c->cmd == CM_txiinternalvalue)
            {
              char *name = e->e.c->contents.list[0]->e.c->contents.list[0]
                                                            ->e.text->text;
              size_t i;
              for (i = 0; i < replaced_substrings->number; i++)
                {
                  if (!strcmp (name, replaced_substrings->list[i].name))
                    {
                      list->list[idx] = replaced_substrings->list[i].element;
                      destroy_element_and_children (e);
                      break;
                    }
                }
            }
          else
            substitute_substrings_in_tree (e, replaced_substrings);
        }
    }
}

ELEMENT *
substitute_substrings_in_tree (ELEMENT *tree,
                               NAMED_STRING_ELEMENT_LIST *replaced_substrings)
{
  if (tree->e.c->contents.number > 0)
    substitute_element_array (&tree->e.c->contents, replaced_substrings);

  return tree;
}

/* the caller should have made sure that the
   inserted elements do not appear elsewhere in the tree. */
DOCUMENT *
replace_convert_substrings (const char *translated_string,
                            NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                            int debug_level)
{
  size_t i;
  char *texinfo_line = 0;
  int parser_debug_level = 0;
  DOCUMENT *document;

  if (replaced_substrings)
    {
    /* setup the strings to be replaced using the input replaced_substrings
       structure, which should only contain elements */
      for (i = 0; i < replaced_substrings->number; i++)
        {
          TEXT text;
          text_init (&text);
          text_append (&text, "@txiinternalvalue{");
          text_append (&text, replaced_substrings->list[i].name);
          text_append (&text, "}");
          replaced_substrings->list[i].string = strdup (text.text);
          free (text.text);
        }

      texinfo_line = replace_substrings (translated_string,
                                         replaced_substrings);

      for (i = 0; i < replaced_substrings->number; i++)
        free (replaced_substrings->list[i].string);
    }

  /*
  fprintf (stderr, "INTERNAL V CMDS '%s' '%s'\n", translated_string,
                                                 texinfo_line);
   */

  /* set parser debug level to one less than debug_level */
  if (debug_level > 0)
    parser_debug_level = debug_level - 1;

  /* same as creating a new parser in Perl */
  reset_parser_conf ();

  parser_conf_set_DEBUG (parser_debug_level);

  /*
   accept @txiinternalvalue as a valid Texinfo command, used to mark
   location in tree of substituted brace enclosed strings.
   */
  parser_conf_set_accept_internalvalue (1);
  parser_conf_set_NO_INDEX (1);
  parser_conf_set_NO_USER_COMMANDS (1);

  if (replaced_substrings)
    document = parse_string (texinfo_line, 1);
  else
    document = parse_string (translated_string, 1);

  if (debug_level > 0)
    fprintf (stderr, "C|IN TR PARSER '%s'\n", texinfo_line);

  if (document->parser_error_messages.number > 0)
    {
      ERROR_MESSAGE_LIST *error_messages = &document->parser_error_messages;
      fprintf (stderr, "translation %zu error(s)\n",
               error_messages->number);
      fprintf (stderr, "translated string: %s\n", translated_string);
      fprintf (stderr, "Error messages: \n");
      for (i = 0; i < error_messages->number; i++)
        fprintf (stderr, "%s", error_messages->list[i].error_line);
    }
  wipe_document_parser_errors (document);

  if (replaced_substrings)
    free (texinfo_line);

  return document;
}

/* Return a tree translated by gdt.  The document associated to the tree is
   removed and the small strings associated to the tree are merged with
   DOCUMENT small strings.  It is possible to pass 0 for the DOCUMENT
   if one knows that there won't be small strings (the general case) */
ELEMENT *
gdt_tree (const char *string, DOCUMENT *document,
          LANG_TRANSLATION *lang_translation,
          NAMED_STRING_ELEMENT_LIST *replaced_substrings,
          int debug_level, const char *translation_context)
{
  TRANSLATION_TREE *translated_string_tree;
  ELEMENT *result_tree;

  translated_string_tree
    = cache_translate_string (string, lang_translation, translation_context);

  if (!translated_string_tree->tree)
    {
      DOCUMENT *translation_document;
      const char *translated_string = translated_string_tree->translation;

      if (!translated_string)
        translated_string = string;

      translation_document
        = replace_convert_substrings (translated_string, replaced_substrings,
                                      debug_level);
      translated_string_tree->tree
        = unregister_document_merge_with_document (translation_document,
                                                   document);

      tree_remove_parents (translated_string_tree->tree);
    }

  result_tree = copy_tree (translated_string_tree->tree, 0);

  if (replaced_substrings)
    {
      substitute_substrings_in_tree (result_tree, replaced_substrings);
    }

  if (debug_level > 0)
    {
      char *result_texi = convert_to_texinfo (result_tree);
      fprintf (stderr, "C|RESULT GDT: '%s'\n", result_texi);
      free (result_texi);
    }

  return result_tree;
}

char *
gdt_string (const char *string, LANG_TRANSLATION *lang_translation,
            NAMED_STRING_ELEMENT_LIST *replaced_substrings,
            const char *translation_context)
{
  TRANSLATION_TREE *translated_string_tree;
  const char *translated_string;
  char *result;

  translated_string_tree
    = cache_translate_string (string, lang_translation, translation_context);

  translated_string = translated_string_tree->translation;

  if (!translated_string)
    translated_string = string;

  result = replace_substrings (translated_string, replaced_substrings);
  return result;
}

ELEMENT *
pgdt_tree (const char *translation_context, const char *string,
           DOCUMENT *document, LANG_TRANSLATION *lang_translation,
           NAMED_STRING_ELEMENT_LIST *replaced_substrings,
           int debug_level)
{
  return gdt_tree (string, document, lang_translation, replaced_substrings,
                   debug_level, translation_context);
}

NAMED_STRING_ELEMENT_LIST *
new_named_string_element_list (void)
{
  NAMED_STRING_ELEMENT_LIST *result
    = malloc (sizeof (NAMED_STRING_ELEMENT_LIST));
  result->number = 0;
  result->space = 0;
  result->list = 0;

  return result;
}

void
reallocate_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel)
{
  if (nsel->number >= nsel->space)
    {
      nsel->space += 1;
      nsel->list = realloc (nsel->list,
                            nsel->space * sizeof (NAMED_STRING_ELEMENT));
      if (!nsel->list)
        fatal ("realloc failed");
    }
}

/* arguments to be freed by the caller, even name as it is a constant
   string in general */
void
add_string_to_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel,
                                         const char *name, char *string)
{
  NAMED_STRING_ELEMENT *new_string;

  reallocate_named_string_element_list (nsel);
  new_string = &nsel->list[nsel->number];
  new_string->element = 0;
  new_string->name = name;
  new_string->string = string;
  nsel->number++;
}

/* arguments to be freed by the caller, even name as it is a constant
   string in general */
void
add_element_to_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel,
                                          const char *name,
                                          ELEMENT *element)
{
  NAMED_STRING_ELEMENT *new_element;

  reallocate_named_string_element_list (nsel);
  new_element = &nsel->list[nsel->number];
  new_element->element = element;
  new_element->name = name;
  new_element->string = 0;
  nsel->number++;
}

void
destroy_named_string_element_list (NAMED_STRING_ELEMENT_LIST *nsel)
{
  if (nsel->space > 0)
    free (nsel->list);
  free (nsel);
}

