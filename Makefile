PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin

install:
	install -m 0755 restart-into-other-helper.sh $(DESTDIR)/$(BINDIR)/restart-into-other-helper
	install -m 0755 restart-into-other.sh $(DESTDIR)/$(BINDIR)/restart-into-other
# not using PREFIX since it has to be this directory
	install -m 0644 restart-into-other.desktop $(DESTDIR)/usr/share/indicators/session/applications
