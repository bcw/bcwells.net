.PHONY: all clean html pdf sw root

ARTICLES_SRC = rotation
SOFTWARE_SRC = org-tex-define/define
ROOT_SRC = define.setup index.org

HTML_OBJ = $(ARTICLES_SRC:%=doc/articles/%.html)
PDF_OBJ  = $(ARTICLES_SRC:%=doc/articles/%.pdf)
SW_OBJ   = \
	$(SOFTWARE_SRC:%=doc/software/%.org) \
	$(SOFTWARE_SRC:%=doc/software/%.html) \
	$(SOFTWARE_SRC:%=doc/software/%.pdf)
ROOT_OBJ = $(ROOT_SRC:%=doc/%)
ALL_OBJ = $(HTML_OBJ) $(PDF_OBJ) $(SW_OBJ) $(ROOT_OBJ)

emacs_publish = emacs -l publish.el --eval '(and (org-publish "$(1)") (save-buffers-kill-terminal))'

# note: the order from here on matters!

all: $(ALL_OBJ) doc/site.zip
html: $(HTML_OBJ)
pdf: $(PDF_OBJ)
sw: $(SW_OBJ)
root: $(ROOT_OBJ)

clean:
	rm -rf doc/ ~/.org-timestamps/website-*.cache

doc/site.zip: html pdf sw root
	cd doc; zip -r site.zip $(ALL_OBJ:doc/%=%)

doc/%.html: src/%.org
	$(call emacs_publish,website-html)

doc/articles/%.pdf: src/articles/%.org
	$(call emacs_publish,website-pdf)

doc/software/%.org: src/software/%.org
	$(call emacs_publish,website-sw)

doc/software/%.html: src/software/%.org
	$(call emacs_publish,website-sw)

doc/software/%.pdf: src/software/%.org
	$(call emacs_publish,website-sw)

doc/%.org: src/%.org
	$(call emacs_publish,website-root)

doc/%.setup: src/%.setup
	$(call emacs_publish,website-root)
