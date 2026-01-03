PAGES := $(wildcard pages/*.html)
PUBLIC_PAGES := $(subst pages/,public/,$(PAGES))
ASSETS := $(wildcard assets/*)

all: public $(PUBLIC_PAGES)
.PHONY: all

public/%.html: pages/%.html layout/before.html layout/after.html
	./scripts/buildpage.sh $<

public: $(ASSETS)
	mkdir -p public
	cp -r assets/* public/ || true
	touch public

clean:
	rm -rf public
.PHONY: clean

test: all
	cd public && python3 -m http.server 8000
.PHONY: test
