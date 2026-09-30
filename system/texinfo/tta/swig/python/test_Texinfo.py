#! /usr/bin/env python

# Copyright 2025-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# example of use of the SWIG interface

import os
import sys
import Texinfo

def skip_to_cmdname(reader, cmdname):
    while True:
        next_token = Texinfo.reader_read(reader)
        if not next_token:
            return None
        element = next_token.element
        elt_cmdname = Texinfo.element_cmdname(element)
        if elt_cmdname is not None and elt_cmdname == cmdname:
            return element

def printindex_output(element):
    result = ''
    misc_args = Texinfo.element_misc_args(element)
    if misc_args and Texinfo.string_list_strings_number(misc_args) > 0:
        index_name = Texinfo.string_list_string_by_index(misc_args, 0)
        result += ' PRINTINDEX '+index_name+"\n"
        sorted_index = Texinfo.get_index_sorted_by_index (document, index_name)
        sorted_index_entries_nr = Texinfo.sorted_index_entries_number(sorted_index);
        for i in range(sorted_index_entries_nr):
            index_entry = Texinfo.sorted_index_entries_by_index(sorted_index, i)
            main_entry_element = index_entry.entry_element
            entry_content_element = Texinfo.index_content_element(main_entry_element)
            result += '  '+Texinfo.convert_to_texinfo(entry_content_element)
    return result

def sectioning_command_output(element):
    result = Texinfo.element_cmdname(element)+ ' '
    section_heading_number = Texinfo.element_attribute_string(element, 'section_heading_number')
    if section_heading_number and section_heading_number != '':
        result += section_heading_number + ' '
    arguments_line = Texinfo.element_get_child(element, 0)
    line_arg = Texinfo.element_get_child(arguments_line, 0)
    if line_arg:
        result += Texinfo.convert_to_texinfo(line_arg)
    return result

if __name__ == '__main__':
    sys.stderr.write("Starting\n")
    # FIXME there is an error with Perl embedding:
    # python: symbol lookup error: ..../Cwd.so: undefined symbol: Perl_xs_handshake
    # Therefore, so do not to start an embedded interpreter at runtime.
    #Texinfo.setup(1)
    Texinfo.setup(1, Texinfo.txi_interpreter_use_no_interpreter)
    sys.stderr.write("Texinfo interface is now setup\n")
    input_file_name = '../../../doc/texinfo.texi'
    #input_file_name = '../../../tta/perl/t/input_files/simplest.texi'
    if len(sys.argv) - 1  > 0:
        input_file_name = sys.argv[1]
    input_dir = os.path.dirname(input_file_name)
    parser = Texinfo.parser()
    Texinfo.parser_conf_add_include_directory(parser, input_dir)
    document, status = Texinfo.parse_file(parser, input_file_name)
    Texinfo.destroy_parser(parser)
    Texinfo.output_parser_error_messages(document)
    sys.stderr.write("Parsing done ("+str(status)+")\n")

    Texinfo.set_document_options(document)
    Texinfo.complete_document(document, Texinfo.STTF_nodes_tree | Texinfo.STTF_floats | Texinfo.STTF_setup_index_entries_sort_strings, 0)
    Texinfo.output_document_error_messages(document)
    sys.stderr.write("Structuring done\n")

    toplevel_sections = Texinfo.sectioning_root_children(document)
    if toplevel_sections:
        sys.stdout.write('TOPLEVEL\n')
        toplevel_sections_number = Texinfo.section_relation_list_section_relations_number(toplevel_sections)
        for i in range(toplevel_sections_number):
            toplevel_relations = Texinfo.section_relation_list_section_relation_by_index(toplevel_sections, i)
            toplevel_element = toplevel_relations.element
            toplevel_element_text = sectioning_command_output(toplevel_element)
            sys.stdout.write(toplevel_element_text)

    tree = Texinfo.document_tree(document)
    reader = Texinfo.new_reader(tree, document)

    while True:
        next_token = Texinfo.reader_read(reader)
        if not next_token:
            break
        element = next_token.element
        cmdname = Texinfo.element_cmdname(element)
        if cmdname and cmdname == 'printindex':
            sys.stdout.write(printindex_output(element))
        #print (Texinfo.element_type(element))

    Texinfo.destroy_document(document)

