.PHONY: all clean site

PUBLISH = emacs --script publish.el

all: site doc/site.zip

clean:
	rm -rf doc/

site:
	$(PUBLISH)

doc/site.zip: site
	cd doc && zip -r site.zip .
