# Copyright, the authors of the Linux man-pages project
# SPDX-License-Identifier: LGPL-3.0-only WITH LGPL-3.0-linking-exception


SHELL       := bash
.SHELLFLAGS := -Eeuo pipefail -c


ifneq (4.4.999,$(firstword $(sort 4.4.999 $(MAKE_VERSION))))
  ifneq (R,$(findstring R, $(firstword -$(MAKEFLAGS))))
    $(error Please run make(1) with the '-R' option)
  endif
endif


MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
MAKEFLAGS += --warn-undefined-variables


ifndef srcdir
srcdir      := .
endif
MAKEFILEDIR := $(CURDIR)/share/mk


INFO_ :=


.PHONY: all
all: build;


.SECONDEXPANSION:


MK_ := $(wildcard $(addprefix $(MAKEFILEDIR)/, *.mk */*.mk */*/*.mk */*/*/*.mk))
MK  := $(CURDIR)/GNUmakefile $(MK_)
include $(MK_)
$(MK):: ;


.PHONY: nothing
nothing:;


.PHONY: help
help:
	$(info	$(INFO_)Common targets:)
	$(info	$(INFO_)	all			Synonym of 'build')
	$(info	$(INFO_)	build			Build the usual stuff)
	$(info	$(INFO_)	build-all		Build everything)
	$(info	$(INFO_)	check			Check the results of the build)
	$(info	$(INFO_)	clean			Remove all temporary files)
	$(info	$(INFO_)	dist			Produce the release tarball)
	$(info	$(INFO_)	distcheck		Check the release tarball)
	$(info	$(INFO_)	help			Print this help)
	$(info	$(INFO_)	help-list-build-depends	List build dependencies (package/program))
	$(info	$(INFO_)	help-list-targets	List all targets)
	$(info	$(INFO_)	help-list-variables	List configurable variables)
	$(info	$(INFO_)	install			Install the usual stuff)
	$(info	$(INFO_)	install-all		Install everything)
	$(info	$(INFO_)	lint			Lint the source code)
	$(info	$(INFO_)	nothing			Do nothing; useful for debugging)
	$(info	$(INFO_)	uninstall		Uninstall everything (might leave traces))
	$(info	)


.DELETE_ON_ERROR:
.SILENT:
FORCE:
