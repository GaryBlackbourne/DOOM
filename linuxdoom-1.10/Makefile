name              ?= linuxdoom
version           ?= 1.11       # patched compilation errors

linuxdoom-sources := $(wildcard linuxdoom-1.10/*.c)
linuxdoom-objects := $(patsubst linuxdoom-1.10/%.c, $(object-dir)/doom/%.o, $(linuxdoom-sources))
linuxdoom-deps    := $(patsubst linuxdoom-1.10/%.c, $(object-dir)/doom/%.d, $(linuxdoom-sources))

bin               := $(build-dir)/$(name)-$(version)

CFLAGS            += -g
CFLAGS            += -Wall
CFLAGS            += -DNORMALUNIX
CFLAGS            += -DLINUX
# CFLAGS += -m32 # for 32bit builds

LDFLAGS           += -L/usr/X11R6/lib
LDFLAGS           += -lXext
LDFLAGS           += -lX11
LDFLAGS           += -lnsl
LDFLAGS           += -lm

linuxdoom: $(bin)

$(bin): $(linuxdoom-objects)
	@mkdir -p $(@D)
	$(CC) $^ -o $@ $(LDFLAGS)

$(object-dir)/doom/%.o: linuxdoom-1.10/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -MMD -c $< -o $@

-include $(linuxdoom-deps)

clean:
	rm $(bin)
	rm $(linuxdoom-deps)
	rm $(linuxdoom-objects)
.PHONY: clean
