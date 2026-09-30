# Copyright, the authors of the Linux man-pages project
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


ifndef MAKEFILE_HELP_LIST_INCLUDED
MAKEFILE_HELP_LIST_INCLUDED := 1


include $(MAKEFILEDIR)/configure/build-depends/coreutils/cut.mk
include $(MAKEFILEDIR)/configure/build-depends/coreutils/sort.mk
include $(MAKEFILEDIR)/configure/build-depends/coreutils/tr.mk
include $(MAKEFILEDIR)/configure/build-depends/coreutils/uniq.mk
include $(MAKEFILEDIR)/configure/build-depends/findutils/find.mk
include $(MAKEFILEDIR)/configure/build-depends/findutils/xargs.mk
include $(MAKEFILEDIR)/configure/build-depends/grep/grep.mk
include $(MAKEFILEDIR)/configure/build-depends/sed/sed.mk


.PHONY: help-list-targets
help-list-targets:
	$(MAKE) -p -n nothing \
	| $(GREP) '^\.PHONY:' \
	| $(TR) ' ' '\n' \
	| $(GREP) -v '^\.PHONY:' \
	| $(SORT)


.PHONY: help-list-variables
help-list-variables:
	$(FIND) $(CURDIR)/GNUmakefile $(MAKEFILEDIR) -type f \
	| $(GREP) -e '/GNUmakefile$$' -e '\.mk$$' \
	| $(SORT) \
	| $(XARGS) $(GREP) '^[^[:space:]].*=' \
	| $(SED) 's,$(CURDIR)/,,' \
	| $(SED) 's/=.*/=/' \
	| $(GREP) -v -e ':DEFAULT_.*=' -e ':MAKEFILE_.*INCLUDED :=' \
	| $(GREP) -v -f \
		<( \
			$(FIND) $(MAKEFILEDIR) -type f \
			| $(XARGS) $(GREP) -h '^undefine ' \
			| $(SORT) \
			| $(UNIQ) \
			| $(CUT) -f2 -d' '; \
		)


.PHONY: help-list-build-depends
help-list-build-depends:
	$(FIND) $(MAKEFILEDIR)/configure/build-depends -type f \
	| $(GREP) -e '\.mk$$' -e '\.mk$$' \
	| $(SED) 's,$(MAKEFILEDIR)/configure/build-depends/,,' \
	| $(SED) 's,\.mk$$,,' \
	| $(SORT)


endif  # include guard
