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
		bash -c "cd /mnt && apk add llvm-static && cabal install \
		--install-method=copy \
		--overwrite-policy=always \
		--installdir='$(STATICINSTALLDIR)' \
		--ghc-options='-O2 -Wall -optl-static -optl-pthread'"
	sudo strip static/aoc

clean:
	sudo rm -rf static bin

solution:
	@mkdir "src/Day$(day)"
	@touch "src/Day$(day).hs" "src/Day$(day)/Common.hs" "src/Day$(day)/Part1.hs" "src/Day$(day)/Part2.hs"
	@cat "src/Day1.hs" > "src/Day$(day).hs"
	@sed "s/Day1/Day$(day)/" "src/Day$(day).hs" -i
	@sed "s/day1/day$(day)/" "src/Day$(day).hs" -i
	@echo -e "module Day$(day).Common where\n\nparse = undefined" >> "src/Day$(day)/Common.hs"
	@echo -e "module Day$(day).Part1 where\n\nimport Day$(day).Common\n\nsolve = undefined" >> "src/Day$(day)/Part1.hs"
	@echo -e "module Day$(day).Part2 where\n\nimport Day$(day).Common\n\nsolve = undefined" >> "src/Day$(day)/Part2.hs"
	@echo "Don't forget to update Run.hs, tests, and the cabal file! to include references to day $(day)!"

watch-bench:
	ls src/**/*.hs app/**/*.hs *.cabal | entr -c cabal bench --benchmark-options '--baseline baseline.csv' $(args)

watch-test:
	ls src/**/*.hs app/**/*.hs *.cabal | entr -c cabal test $(args)

watch-run:
	ls src/**/*.hs app/**/*.hs *.cabal | entr -c cabal run aoc -- "$(args)"
