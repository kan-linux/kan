/* tree_types.h - types for the parse tree that are used in many places */
#ifndef TREE_TYPES_H
#define TREE_TYPES_H
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

#include <stddef.h>
#include <stdint.h>
#include <sys/types.h>

#include "command_ids.h"
#include "element_types.h"
#include "text.h"
#include "source_mark_types.h"

/* the *_none enums are not necessarily used, they may also
   be there to avoid using 0, for a code easier to debug */

/* Indices into array returned by new_directions in main/tree.c. */
/* need to be in the same order as explicit nodes directions */
enum directions {
   D_next,
   D_prev,
   D_up,
};

enum extra_type {
 /* mainly used for deleted associated info */
   extra_none,
 /* CONTAINER ASSOCIATED_INFO and lookup_* functions */
   extra_element,
   extra_element_oot,
   extra_contents,
   extra_container,
   extra_directions,
   extra_misc_args,
   extra_index_entry, /* index name and position in index */
   extra_string,
   extra_integer,

   /* ELEMENT flags */
   extra_flag,

   /* ELEMENT elt_info */
   extra_element_info,
   /* CONTAINER string_info */
   extra_string_info,
};

/* tree element flags */
/* in info in Perl */
#define EF_inserted                      0x0001
/* transiently needed for tree element copy */
#define EF_copy                          0x0002
/* in extra in Perl */
#define EF_code                          0x0004
#define EF_is_target                     0x0008
#define EF_omit_def_name_space           0x0010
#define EF_not_after_command             0x0020
#define EF_invalid_syntax                0x0040
#define EF_command_as_argument_kbd_code  0x0080
#define EF_indent                        0x0100
#define EF_noindent                      0x0200
#define EF_isindex                       0x0400
/* not in Perl */
#define EF_def_line                      0x0800
/* transiently used for numbering of the elements for the representation
   of the tree.  Not currently used. */
#define EF_numbered                      0x1000

/* indices in ELEMENT elt_info */
/* to be kept in sync with elt_info_names in main/tree.c */
enum elt_info_type {
   eit_spaces_before_argument, /* diverse types.  Only context_brace_command
                                  also with braces */
   eit_spaces_after_cmd_before_arg, /* types with braces flag */
   eit_spaces_after_argument,
   eit_comment_at_end, /* block_line_arg line_arg */
};

/* indices in ELEMENT string_info */
enum string_info_type {
   sit_alias_of,  /* every @-command + macro_call */
   sit_delimiter, /* CM_verb */
   sit_command_name = 1, /* ET_definfoenclose_command, ET_index_entry_command
                            and macro_call.  Not in Perl info, in Perl cmdname
                            can be used instead. */
};

/* corresponds to name, extra type and associated data.  The associated data
   is only used for interfacing with Perl */
#define AI_KEYS_LIST \
  ai_key(none, none, 0) \
  \
  ai_key(cell_number, integer, 0) \
  ai_key(item_number, integer, 0) \
  ai_key(global_command_number, integer, 0) \
  ai_key(expand_index, integer, 0) \
  ai_key(level_modifier, integer, 0) \
  ai_key(max_columns, integer, 0) \
  ai_key(row_number, integer, 0) \
  ai_key(section_level, integer, 0) \
  ai_key(node_number, integer, 0) \
  ai_key(heading_number, integer, 0) \
  ai_key(section_number, integer, 0) \
  \
  ai_key(begin, string, 0) \
  ai_key(def_command, string, 0) \
  ai_key(documentlanguage, string, 0) \
  ai_key(element_node, string, 0) \
  ai_key(element_region, string, 0) \
  ai_key(end, string, 0) \
  ai_key(float_number, string, 0) \
  ai_key(float_type, string, 0) \
  ai_key(format, string, 0) \
  ai_key(index_ignore_chars, string, 0) \
  ai_key(input_encoding_name, string, 0) \
  ai_key(macro_name, string, 0) \
  ai_key(normalized, string, 0) \
  ai_key(original_def_cmdname, string, 0) \
  ai_key(section_heading_number, string, 0) \
  ai_key(sortas, string, 0) \
  ai_key(text_arg, string, 0) \
  ai_key(translation_context, string, 0) \
  \
  ai_key(def_index_element, element_oot, 0) \
  ai_key(def_index_ref_element, element_oot, 0) \
  \
  ai_key(manual_content, container, 0) \
  ai_key(node_content, container, 0) \
  \
  ai_key(misc_args, misc_args, 0) \
  \
  ai_key(index_entry, index_entry, 0) \
  ai_key(associated_index_entry, index_entry, 0) \
  \
  ai_key(inserted, flag, EF_inserted) \
  ai_key(code, flag, EF_code) \
  ai_key(is_target, flag, EF_is_target) \
  ai_key(omit_def_name_space, flag, EF_omit_def_name_space) \
  ai_key(not_after_command, flag, EF_not_after_command) \
  ai_key(invalid_syntax, flag, EF_invalid_syntax) \
  ai_key(command_as_argument_kbd_code, flag, EF_command_as_argument_kbd_code) \
  ai_key(indent, flag, EF_indent) \
  ai_key(noindent, flag, EF_noindent) \
  ai_key(isindex, flag, EF_isindex) \
  \
  ai_key(spaces_before_argument, element_info, eit_spaces_before_argument) \
  ai_key(spaces_after_cmd_before_arg, element_info, eit_spaces_after_cmd_before_arg) \
  ai_key(spaces_after_argument, element_info, eit_spaces_after_argument) \
  ai_key(comment_at_end, element_info, eit_comment_at_end) \
  \
  ai_key(alias_of, string_info, sit_alias_of) \
  ai_key(delimiter, string_info, sit_delimiter) \


/* Keys used in ASSOCIATED_INFO and other associated info structures. */
enum ai_key_name {
  #define ai_key(name, type, data) AI_key_ ## name,
   AI_KEYS_LIST
  #undef ai_key
};

typedef struct ASSOCIATED_INFO_DATA {
    enum ai_key_name key;
    enum extra_type type;
    const char *name;
    uint16_t data;
} ASSOCIATED_INFO_DATA;

typedef struct ELEMENT_LIST {
    struct ELEMENT **list;
    size_t number;
    size_t space;
} ELEMENT_LIST;

/* not used in parser */
typedef struct CONST_ELEMENT_LIST {
    const struct ELEMENT **list;
    size_t number;
    size_t space;
} CONST_ELEMENT_LIST;

typedef struct INDEX_ENTRY_LOCATION {
    char *index_name;
    size_t number; /* position in the original index.  May be different in
                   merged index */
} INDEX_ENTRY_LOCATION;

typedef struct STRING_LIST {
    char **list;
    size_t number;
    size_t space;
} STRING_LIST;

typedef struct KEY_PAIR {
    enum ai_key_name key;
    union {
      /* for extra_element_oot and extra_container */
      struct ELEMENT *element;
      /* for extra_element */
      const struct ELEMENT *const_element;
    /*
      ELEMENT_LIST *list;
     */
      /* for extra_contents */
      CONST_ELEMENT_LIST *const_list;
      char *string;
      int integer;
      INDEX_ENTRY_LOCATION *index_entry;
      /* for extra_misc_args */
      STRING_LIST *strings_list;
      const struct ELEMENT **directions;
    } k;
} KEY_PAIR;

typedef struct SOURCE_INFO {
    int line_nr;
    char *file_name;
    char *macro;
} SOURCE_INFO;

typedef struct ASSOCIATED_INFO {
    KEY_PAIR *info;
    size_t info_number;
    size_t info_space;
} ASSOCIATED_INFO;

typedef struct SOURCE_MARK_LIST {
    struct SOURCE_MARK **list;
    size_t number;
    size_t space;
} SOURCE_MARK_LIST;

/* Defined fully in main/document_types.h */
struct OUTPUT_UNIT;

typedef struct CONTAINER {
    struct ELEMENT *parent;
    ELEMENT_LIST contents;
    SOURCE_INFO source_info;

    ASSOCIATED_INFO extra_info;
    struct OUTPUT_UNIT *associated_unit;
    /* depends on the element */
    char **string_info;
    enum command_id cmd;
} CONTAINER;

typedef struct ELEMENT {
    enum element_type type;
    SOURCE_MARK_LIST *source_mark_list;

    union {
      TEXT *text;
      CONTAINER *c;
    } e;

    uint16_t flags; /* can hold up to 16 flags, could use uint32_t for more */
    /* depends on the element, can be space elements, comments */
    struct ELEMENT **elt_info;

    /* Used when building Perl tree only. This should be SV *sv,
       but we don't want to include the Perl headers everywhere; */
    void *sv;

} ELEMENT;

typedef struct NODE_RELATIONS {
    /* NOTE it could have been good to have the element be const, as
       node relations associated to node elements are not supposed to
       be modified.
       However, the current_node in the Parser is a NODE_RELATIONS
       and the current_node element is modified.  Because of this, it is
       not possible to set the element field to be const */
    ELEMENT *element;
    const struct SECTION_RELATIONS *associated_section;
    /* it can be associated to an heading or a section relations
       so we prefer the element although relations structures 
       would have been more consistent */
    const ELEMENT *associated_title_command;
    const struct SECTION_RELATIONS *node_preceding_part;
    const ELEMENT *node_description;
    const ELEMENT *node_long_description;
    CONST_ELEMENT_LIST *menus;
    const struct ELEMENT **node_directions;

    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;
} NODE_RELATIONS;

typedef struct NODE_RELATIONS_LIST {
    struct NODE_RELATIONS **list;
    size_t number;
    size_t space;
} NODE_RELATIONS_LIST;

typedef struct CONST_NODE_RELATIONS_LIST {
    const struct NODE_RELATIONS **list;
    size_t number;
    size_t space;
} CONST_NODE_RELATIONS_LIST;

typedef struct HEADING_RELATIONS {
    const ELEMENT *element;
    const NODE_RELATIONS *associated_anchor_command;

    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;
} HEADING_RELATIONS;

typedef struct HEADING_RELATIONS_LIST {
    struct HEADING_RELATIONS **list;
    size_t number;
    size_t space;
} HEADING_RELATIONS_LIST;

typedef struct SECTION_RELATIONS {
    const ELEMENT *element;
    const NODE_RELATIONS *associated_anchor_command;
    const NODE_RELATIONS *associated_node;
    const struct SECTION_RELATIONS *associated_part;
    const struct SECTION_RELATIONS *part_associated_section;
    const NODE_RELATIONS *part_following_node;
    const struct SECTION_RELATIONS **section_directions;
    const struct SECTION_RELATIONS **toplevel_directions;
    struct SECTION_RELATIONS_LIST *section_children;

    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;
} SECTION_RELATIONS;

typedef struct SECTION_RELATIONS_LIST {
    struct SECTION_RELATIONS **list;
    size_t number;
    size_t space;
} SECTION_RELATIONS_LIST;

/* not used in parser */
typedef struct SECTIONING_ROOT {
    int section_root_level;
    SECTION_RELATIONS_LIST section_children;
} SECTIONING_ROOT;

typedef struct IGNORED_CHARS {
    int backslash;
    int hyphen;
    int lessthan;
    int atsign;
} IGNORED_CHARS;

typedef struct INDEX_ENTRY {
    char *index_name; /* kept with the entry as the indices may be merged */
    int number; /* position in the original index.  May be different in
                   merged index */
    ELEMENT *entry_element;
    ELEMENT *entry_associated_element; /* set if the entry is reassociated to
                                          another element */
} INDEX_ENTRY;

typedef struct INDEX {
    char *name;
    int in_code;

    struct INDEX *merged_in; /* Index this index is merged into, if any. */

    INDEX_ENTRY *index_entries;
    size_t entries_number;
    size_t entries_space;
} INDEX;

/* not used in parser */
typedef struct INDEX_ENTRY_AND_INDEX {
    INDEX *index;
    INDEX_ENTRY *index_entry;
    int entry_number;
} INDEX_ENTRY_AND_INDEX;

/* See parse_node_manual function. */
typedef struct {
    ELEMENT *manual_content;
    ELEMENT *node_content;
    ELEMENT **out_of_tree_elements;
} NODE_SPEC_EXTRA;

typedef struct {
    size_t label_number;
    const char *identifier;
 /* cannot be const because is_target is added */
    ELEMENT *element;
 /* for label that is a duplicate, points to the element used in links */
    const ELEMENT *reference;
} LABEL;

typedef struct {
    size_t number;
    size_t space;
    LABEL *list;
} LABEL_LIST;

typedef struct {
    ELEMENT *float_element;
    const SECTION_RELATIONS *float_section;
} FLOAT_INFORMATION;

typedef struct {
    size_t number;
    size_t space;
    FLOAT_INFORMATION *list;
} FLOAT_INFORMATION_LIST;

/* The float elements are reference to tree elements, but they are not const
   because in number_floats they are found through the listoffloats list */
typedef struct {
    char *type;
    FLOAT_INFORMATION_LIST float_list;
} LISTOFFLOATS_TYPE;

typedef struct {
    size_t number;
    size_t space;
    LISTOFFLOATS_TYPE *float_types;
} LISTOFFLOATS_TYPE_LIST;

/* element is a reference to the tree, but it is not const because it is
   used to set the listoffloats list elements list */
typedef struct {
    const char *type;
    ELEMENT *element;
    const SECTION_RELATIONS *section;
} FLOAT_RECORD;

typedef struct {
    size_t number;
    size_t space;
    FLOAT_RECORD *list;
} FLOAT_RECORD_LIST;

typedef struct {
    enum command_id *stack;
    size_t top;   /* One above last pushed command. */
    size_t space;
} COMMAND_STACK;

enum tree_added_elements_status {
   tree_added_status_none,
   tree_added_status_elements_added,
   tree_added_status_new_tree,
   tree_added_status_reused_tree,
   tree_added_status_no_tree,
};

/* not used in parser */
typedef struct TREE_ADDED_ELEMENTS {
    ELEMENT *tree;
    ELEMENT_LIST added; /* list of added elements in tree that are not in the
                           document Texinfo tree */
    int in_code;
    enum tree_added_elements_status status;
} TREE_ADDED_ELEMENTS;

/* not used in parser, used in diverse codes */
typedef struct NAME_NUMBER {
    size_t number;
    const char *name;
} NAME_NUMBER;

typedef struct NAME_NUMBER_LIST {
    size_t number;
    NAME_NUMBER *list;
} NAME_NUMBER_LIST;

typedef struct COMMENT_OR_END_LINE {
    const ELEMENT *comment;
    const char *end_line;
} COMMENT_OR_END_LINE;

typedef struct ARGUMENT_COMMENT_END_LINE {
    const ELEMENT *argument;
    COMMENT_OR_END_LINE comment_end_line;
} ARGUMENT_COMMENT_END_LINE;

/* not used in parser, here because it is used in translations */
typedef struct TRANSLATION_TREE {
    char *translated;
    char *translation;
    ELEMENT *tree;
} TRANSLATION_TREE;

typedef struct LANG_TRANSLATION_TREE_LIST {
    size_t number;
    size_t space;
    TRANSLATION_TREE **list;
    void *hash;
} LANG_TRANSLATION_TREE_LIST;

typedef struct LANG_TRANSLATION {
    char *lang;
    char *encoded_lang;
    LANG_TRANSLATION_TREE_LIST *translations;
} LANG_TRANSLATION;

/* element or string may not always be present */
typedef struct NAMED_STRING_ELEMENT {
    const char *name;
    ELEMENT *element; /* actually const until added to tree */
    char *string; /* const in gdt_string, but used temporarily in gdt_tree */
} NAMED_STRING_ELEMENT;

typedef struct NAMED_STRING_ELEMENT_LIST {
    size_t number;
    size_t space;
    NAMED_STRING_ELEMENT *list;
} NAMED_STRING_ELEMENT_LIST;

/* used for targets */
struct BUCKET;
struct BUCKET_ARENA;
typedef struct C_HASHMAP {
  struct BUCKET **bucket;
  size_t num_buckets;
  size_t count;

  struct BUCKET_ARENA *arena;
} C_HASHMAP;

#endif
