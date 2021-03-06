.PHONY: all tools compare clean tidy

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

ROM := tcg2.gbc
OBJS := src/main.o src/wram.o

MD5 := md5sum -c

all: $(ROM) compare

ifeq (,$(filter tools clean tidy,$(MAKECMDGOALS)))
Makefile: tools
endif

%.o: dep = $(shell tools/scan_includes -s -i src/ $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -h -i src/ -o $@ $<

$(ROM): $(OBJS) tcg2.link
	rgblink -n $(ROM:.gbc=.sym) -m $(ROM:.gbc=.map) -l tcg2.link -o $@ $(OBJS)
	rgbfix -Cv -k 2P -l 0x33 -m 0x1b -p 0 -r 03 -t "POKEMON-CG2" -i BP7J $@

# For contributors to make sure a change didn't affect the contents of the rom.
compare: $(ROM)
	@$(MD5) rom.md5

tools:
	$(MAKE) -C tools

tidy:
	rm -f $(ROM) $(OBJS) $(ROM:.gbc=.sym) $(ROM:.gbc=.map)
	$(MAKE) -C tools clean

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +

%.interleave.2bpp: %.interleave.png
	rgbgfx -o $@ $<
	tools/gfx --interleave --png $< -o $@ $@

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d1 -o $@ $<
