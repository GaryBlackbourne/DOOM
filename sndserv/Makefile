sndserver-name    ?= sndserver
# version := 1.0

sndserver-sources := $(wildcard sndserv/*.c)
sndserver-objects := $(patsubst sndserv/%.c, $(object-dir)/sndserv/%.o, $(sndserver-sources))
sndserver-deps    := $(patsubst sndserv/%.c, $(object-dir)/sndserv/%.d, $(sndserver-sources))

sndserver-bin     := $(build-dir)/$(sndserver-name)

CFLAGS            += -O
CFLAGS            += -DNORMALUNIX
CFLAGS            += -DLINUX
# CFLAGS            += -m32 # for 32 bit builds

LDFLAGS           += -lm

sndserver: $(sndserver-bin)

$(sndserver-bin): $(sndserver-objects)
	@mkdir -p $(@D)
	$(CC) $^ -o $@ $(LDFLAGS)

$(object-dir)/sndserv/%.o: sndserv/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -MMD -c $< -o $@

-include $(sndserver-deps)

sndserver-clean:
	rm $(sndserver-bin)
	rm $(sndserver-deps)
	rm $(sndserver-objects)
.PHONY: sndserver-clean

