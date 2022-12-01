INSTALLDIR ?= bin
install:
	mkdir -p "$(INSTALLDIR)"
	cabal install \
		--install-method=copy \
		--overwrite-policy=always \
		--installdir="$(INSTALLDIR)"
