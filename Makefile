build-dir   := build
object-dir := $(build-dir)/.obj

CC          ?= gcc

all: linuxdoom

-include linuxdoom-1.10/Makefile
-include sndserver/Makefile

distclean:
	rm -rf $(build-dir)
.PHONY: distclean

