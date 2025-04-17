PREFIX ?= $(DESTDIR)/usr/share/X11/xorg.conf.d

XORG_CONFS	:= $(patsubst %,$(PREFIX)/%,$(wildcard *.conf))

.PHONY : install

xorg_confs:
	mkdir -p $(PREFIX)

$(PREFIX)/%.conf: xorg_confs
	install -p -m 644 $(patsubst $(PREFIX)/%,%,$@) $@

install: $(XORG_CONFS)
