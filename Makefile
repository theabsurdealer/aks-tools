PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin

.PHONY: install uninstall check

install:
	@mkdir -p $(BINDIR)
	install -m 0755 kit/kit  $(BINDIR)/kit
	install -m 0755 aksc/aksc $(BINDIR)/aksc
	install -m 0755 aksm/aksm $(BINDIR)/aksm
	@echo "Installed kit, aksc, aksm to $(BINDIR)"

uninstall:
	rm -f $(BINDIR)/kit $(BINDIR)/aksc $(BINDIR)/aksm
	@echo "Removed kit, aksc, aksm from $(BINDIR)"

check:
	bash -n kit/kit
	bash -n aksc/aksc
	bash -n aksm/aksm
	@echo "Syntax OK"
