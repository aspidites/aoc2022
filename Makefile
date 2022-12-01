INSTALLDIR ?= bin
STATICINSTALLDIR ?= static
install:
	mkdir -p "$(INSTALLDIR)"
	cabal install \
		--install-method=copy \
		--overwrite-policy=always \
		--installdir="$(INSTALLDIR)"

static:
	docker compose run haskell \
		bash -c "cd /mnt && cabal install \
		--install-method=copy \
		--overwrite-policy=always \
		--installdir='$(STATICINSTALLDIR)' \
		--ghc-options='-O2 -Wall -optl-static -optl-pthread'"
	sudo strip static/aoc

clean:
	sudo rm -rf static bin
