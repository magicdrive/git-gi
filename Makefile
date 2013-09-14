PREFIX=${HOME}
CURRENTDIR=$(shell pwd)

all:
	@echo "make [intall|uninstall]"

install:
	mkdir -p $(PREFIX)/bin/
	cp -af $(CURRENTDIR)/bin/git-gi $(PREFIX)/bin/
	mkdir -p $(PREFIX)/share/man/man1/
	cp -af $(CURRENTDIR)/share/man/man1/git-gi.1 $(PREFIX)/share/man/man1/
	mkdir -p $(PREFIX)/share/git-gi/
	cp -af $(CURRENTDIR)/share/git-gi/gitignore $(PREFIX)/share/git-gi/

uninstall:
	rm -rf $(PREFIX)/share/man/man1/git-gi.1
	rm -rf $(PREFIX)/bin/git-gi
	rm -rf $(PREFIX)/share/git-gi

man:
	[ -e $(shell which md2man-roff) ] && md2man-roff $(CURRENTDIR)/README.md > $(CURRENTDIR)/share/man/man1/git-gi.1

