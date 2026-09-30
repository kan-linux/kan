/* Copyright 2023-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* ALTIMP perl/Texinfo/Transformations.pm */
/* ALTIMP perl/Texinfo/Structuring.pm */
/* ALTIMP perl/Texinfo/ManipulateTree.pm */
/* ALTIMP perl/Texinfo/OutputUnits.pm */

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "options_data.h"
#include "tree_types.h"
#include "document_types.h"
#include "tree.h"
#include "utils.h"
#include "structure_list.h"
#include "manipulate_tree.h"
#include "document.h"
#include "transformations.h"
#include "structuring.h"
#include "output_unit.h"
#include "get_perl_info.h"
#include "build_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

MODULE = Texinfo::StructTransfXS	PACKAGE = Texinfo::StructTransfXS

PROTOTYPES: ENABLE

void
fill_gaps_in_sectioning_in_document (SV *document_in, ...)
    PROTOTYPE: $;$
    PREINIT:
        ELEMENT_LIST *added_sections;
        DOCUMENT *document;
     CODE:
        document = get_sv_document_document (document_in,
                              "fill_gaps_in_sectioning_in_document");
        if (document)
          {
            const ELEMENT *commands_heading_content = 0;
            if (items > 1 && SvOK(ST(1)))
              {
                DOCUMENT *commands_heading_document
                   = get_sv_tree_document (ST(1), 0);
                if (commands_heading_document)
                  commands_heading_content = commands_heading_document->tree;
              }
            added_sections = fill_gaps_in_sectioning_in_document (document,
                                                   commands_heading_content);
            /* cannot easily be used as it does not match with perl tree.
               Also the return would not be usable as error status */
            destroy_list (added_sections);
          }

# This is only used in tests, and not for all the tests, copy_treeNonXS is
# more generally used because the C tree element cannot be found in general.
SV *
copy_tree (SV *tree_in, SV *added_root_elements_sv=0)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_sv_tree_document (tree_in, "copy_tree");
        if (document)
          {
            ELEMENT_LIST *added_root_elements = new_list ();
            /* we set added_root_elements such that extra elements references
               are gathered, but it should not return any added subtree with a
               different root because of extra elements pointing to other
               subtrees, since we copy a whole tree.
             */
            ELEMENT *result = copy_tree (document->tree, added_root_elements);
            DOCUMENT *copy_document = new_document ();
          /* document additional information, global info, labels, indices...
             is not setup with copy_tree, so we only have the tree to store.
             This is not different from the Perl code and, in general,
             it is best that way.
           */
            SV *sv = build_texinfo_tree (result, 0);
            HV *hv = (HV *) SvRV (sv);
            copy_document->tree = result;
            hv_store (hv, "tree_document_descriptor",
                      strlen ("tree_document_descriptor"),
                      newSViv ((IV) copy_document->descriptor), 0);
            RETVAL = newSVsv (sv);
            if (added_root_elements_sv && SvOK (added_root_elements_sv))
              {
                size_t i;
                AV *av = (AV *)SvRV (added_root_elements_sv);
                for (i = 0; i < added_root_elements->number; i++)
                  {
                    ELEMENT *element = added_root_elements->list[i];
                    SV *sv = newSVsv ((SV *)element->sv);
                    av_push (av, sv);
                  }
              }
            destroy_list (added_root_elements);
          }
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

void
relate_index_entries_to_table_items_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_sv_document_document (document_in,
                   "relate_index_entries_to_table_items_in_document");
        if (document)
          relate_index_entries_to_table_items_in_document (document);

void
move_index_entries_after_items_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_sv_document_document (document_in,
                            "move_index_entries_after_items_in_document");
        if (document)
          move_index_entries_after_items_in_document (document);

void
reference_to_arg_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document
          = get_sv_document_document (document_in,
                                      "reference_to_arg_in_document");
        if (document)
          reference_to_arg_in_document (document);

void
associate_internal_references (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                                     "associate_internal_references");
        if (document)
          associate_internal_references (document);


void
sectioning_structure (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "sectioning_structure");
        if (document)
          {
            sectioning_structure (document);
          }

void
warn_non_empty_parts (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                                             "warn_non_empty_parts");
        if (document)
          warn_non_empty_parts (document);

void
complete_node_tree_with_menus (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                                      "complete_node_tree_with_menus");
        if (document)
          complete_node_tree_with_menus (document);

void
check_node_tree_menu_structure (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                                      "check_node_tree_menu_structure");
        if (document)
          check_node_tree_menu_structure (document);

void
check_nodes_are_referenced (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                                         "check_nodes_are_referenced");
        if (document)
          check_nodes_are_referenced (document);

void
number_floats (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in, "number_floats");
        if (document)
          number_floats (document);

void
complete_tree_nodes_menus_in_document (SV *document_in, SV *use_sections_in=0)
    PREINIT:
        DOCUMENT *document = 0;
        int use_sections = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                 "complete_tree_nodes_menus_in_document");
        if (use_sections_in && SvOK (use_sections_in))
          {
            use_sections = SvIV (use_sections_in);
          }
        if (document)
          complete_tree_nodes_menus_in_document (document, use_sections);

void
complete_tree_nodes_missing_menu (SV *document_in, SV *use_sections_in=0)
    PREINIT:
        DOCUMENT *document = 0;
        int use_sections = 0;
     CODE:
        document = get_sv_document_document (document_in,
                             "complete_tree_nodes_missing_menu");
        if (use_sections_in && SvOK (use_sections_in))
          {
            use_sections = SvIV (use_sections_in);
          }
        if (document)
          complete_tree_nodes_missing_menu (document, use_sections);

void
regenerate_master_menu (SV *document_in, SV *use_sections_in=0)
    PREINIT:
        DOCUMENT *document = 0;
        int use_sections = 0;
    CODE:
        document = get_sv_document_document (document_in,
                                             "regenerate_master_menu");
        if (use_sections_in && SvOK (use_sections_in))
          {
            use_sections = SvIV (use_sections_in);
          }
        if (document)
          regenerate_master_menu (document, use_sections);

# The perl function returns the list of added nodes.
void
insert_nodes_for_sectioning_commands (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                               "insert_nodes_for_sectioning_commands");
        if (document)
          {
            ELEMENT_LIST *added_nodes
              = insert_nodes_for_sectioning_commands (document);
            destroy_list (added_nodes);
          }

void
construct_nodes_tree (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in, "nodes_tree");
        if (document)
          {
            construct_nodes_tree (document);
          }

# Next functions are provided to be able to test the C code.  The functions
# used in Perl code should be the corresponding functions with tree in
# argument that are not overriden.
void
protect_colon_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document
          = get_sv_document_document (document_in, "protect_colon_in_document");
        if (document)
          protect_colon_in_document (document);

void
protect_comma_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "protect_comma_in_document");
        if (document)
          protect_comma_in_document (document);

void
protect_node_after_label_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                              "protect_node_after_label_in_document");
        if (document)
          protect_node_after_label_in_document (document);

void
protect_hashchar_at_line_beginning_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                           "protect_hashchar_at_line_beginning_in_document");
        if (document)
          protect_hashchar_at_line_beginning_in_document (document);

void
protect_first_parenthesis_in_targets_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                       "protect_first_parenthesis_in_targets_in_document");
        if (document)
          protect_first_parenthesis_in_targets_in_document (document);

# could that be called in a situation where the document is not found?
SV *
tree_print_details (SV *tree_in, SV *fname_encoding_in=0, SV *use_filename_in=0)
    PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_tree_document (tree_in,
                                         "tree_print_details");
        if (document)
          {
            char *result;
            const char *fname_encoding = 0;
            int use_filename = 0;

            if (fname_encoding_in && SvOK (fname_encoding_in))
              fname_encoding = (char *)SvPVbyte_nolen(fname_encoding_in);

            if (use_filename_in && SvOK (use_filename_in))
              use_filename = SvIV (use_filename_in);

            result = tree_print_details (document->tree,
                                fname_encoding, use_filename);
            result_sv = newSVpv_utf8 (result, 0);
            free (result);
          }

        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

# Simplistic wrapper around SvREFCNT.  Should be similar to
# Devel::Peek::SvREFCNT, but we do not use Devel::Peek as it cannot be loaded
# in an eval.
# The second argument is only used in the Perl subroutine.
int
SvREFCNT (SV *sv, ...)
    PROTOTYPE: $;$
    CODE:
        if (!SvOK (sv))
          RETVAL = -1;
        else
          RETVAL = SvREFCNT (sv);
    OUTPUT:
        RETVAL

# unused, avoid using
SV *
split_by_node (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in, "split_by_node");
        if (document)
          {
            size_t output_units_descriptor = split_by_node (document);
            RETVAL = build_output_units_list (document,
                                              output_units_descriptor);
          }
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

# unused, avoid using
SV *
split_by_section (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in, "split_by_section");
        if (document)
          {
            size_t output_units_descriptor = split_by_section (document);
            RETVAL = build_output_units_list (document,
                                              output_units_descriptor);
          }
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

int
unsplit (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in, "unsplit");
        if (document)
          RETVAL = unsplit (document);
        else
          RETVAL = -1;
    OUTPUT:
        RETVAL

# unused, avoid using
void
split_pages (SV *output_units_in, char *split)
    PREINIT:
        size_t output_units_descriptor = 0;
        const DOCUMENT *document = 0;
     CODE:
        output_units_descriptor
          = get_sv_output_units_descriptor (output_units_in, "split_pages",
                                            &document);

        if (output_units_descriptor && document)
          {
            OUTPUT_UNIT_LIST *output_units = retrieve_output_units (document,
                                                    output_units_descriptor);
            split_pages (output_units, &document->nodes_list, split);
          }

# for tests only
SV *
do_units_directions_pages (SV *document_in, SV *units_split_type_in, SV *split_pages_in=0, SV *debug_in=0)
    PREINIT:
        DOCUMENT *document = 0;
        SV *output_units_list = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "do_units_directions_pages");
        if (document)
          {
            enum units_split_type units_split = UST_none;
            char *split_pages = 0;
            int debug = 0;

            if (split_pages_in && SvOK (split_pages_in))
              split_pages = (char *)SvPVbyte_nolen(split_pages_in);

            if (debug_in && SvOK (debug_in))
              debug = SvIV (debug_in);

            if (SvOK (units_split_type_in))
              units_split = (int) SvIV (units_split_type_in);

            do_units_directions_pages (document, units_split,
                                       split_pages, debug);

            if (document->output_units_descriptors[OUDT_units])
              {
                output_units_list = setup_output_units_handler (document,
                           document->output_units_descriptors[OUDT_units]);
              }
          }
        if (output_units_list)
          RETVAL = output_units_list;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_output_units_tree_details (SV *output_units_in, SV *tree_in, SV *fname_encoding_in=0, SV *use_filename_in=0)
    PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_tree_document (tree_in,
                                         "print_output_units_tree_details");
        if (document)
          {
            const char *fname_encoding = 0;
            int use_filename = 0;
            OUTPUT_UNIT_LIST *output_units = 0;
            size_t output_units_descriptor
             = get_sv_output_units_descriptor (output_units_in, 0, 0);

            if (fname_encoding_in && SvOK (fname_encoding_in))
              fname_encoding = (char *)SvPVbyte_nolen(fname_encoding_in);

            if (use_filename_in && SvOK (use_filename_in))
              use_filename = SvIV (use_filename_in);

            if (output_units_descriptor)
              {
                output_units
                 = retrieve_output_units (document, output_units_descriptor);
              }
            if (output_units)
              {
                char *result = print_output_units_tree_details (output_units,
                                document->tree, fname_encoding, use_filename);
                result_sv = newSVpv_utf8 (result, 0);
                free (result);
              }
          }

        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_sections_list (SV *document_in)
   PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "print_sections_list");
        if (document)
          {
            char *result = print_sections_list (document);
            result_sv = newSVpv_utf8 (result, 0);
            free (result);
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_nodes_list (SV *document_in)
   PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "print_nodes_list");
        if (document)
          {
            char *result = print_nodes_list (document);
            result_sv = newSVpv_utf8 (result, 0);
            free (result);
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_headings_list (SV *document_in)
   PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "print_headings_list");
        if (document)
          {
            char *result = print_headings_list (document);
            result_sv = newSVpv_utf8 (result, 0);
            free (result);
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_sectioning_root (SV *document_in)
   PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "print_sectioning_root");
        if (document)
          {
            char *result = print_sectioning_root (document);
            result_sv = newSVpv_utf8 (result, 0);
            free (result);
          }
        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

SV *
print_document_listoffloats (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "print_document_listoffloats");
        if (document)
          {
            char *listoffloats_str = print_document_listoffloats (document);
            if (listoffloats_str)
              {
                RETVAL = newSVpv_utf8 (listoffloats_str, 0);
                free (listoffloats_str);
              }
            else
              RETVAL = newSV (0);
          }
        else
          RETVAL = newSV (0);

    OUTPUT:
        RETVAL



