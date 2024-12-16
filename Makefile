build-dir   := build
object-dir  := $(build-dir)/.obj

CC          ?= gcc

all: linuxdoom sndserver assets

-include linuxdoom-1.10/Makefile
-include sndserv/Makefile

doom-assets-remote := https://distro.ibiblio.org/slitaz/sources/packages/d/doom1.wad
assets: $(build-dir)/doom1.wad
	curl -O $(doom-assets-remote)

clean: doom-clean sndserver-clean
.PHONY: clean

distclean:
	rm -rf $(build-dir)
.PHONY: distclean

