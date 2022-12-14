# Advent of Code 2022
My solutions for AoC 2022, written in [Haskell](https://www.haskell.org/). 

## Organization
Exercises are organized by day and part under the "src" directory. For
example, day one is organized as follows:

    src/Day1
    ├── Part1.hs
    └── Part2.hs


## Dependencies
This project was built using [GHC](https://www.haskell.org/ghc/) version 9.2.4, which can be installed using [ghcup](https://www.haskell.org/ghcup/):

```
ghcup install ghc 9.4.2
```

You'll also want [cabal](https://www.haskell.org/cabal/) version 3.8.1.0 so that the commands discussed later in this document work:
```
ghcup install cabal 3.8.1.0
```

## Installing

### Using Cabal
You can install the executable with:
```
cabal install
```

By default, this installs to `$HOME/.cabal/bin`. If you'd prefer to install to a different location, see the "Using Make" section below.

### Using Make (Dynamic)
You can use the `install` target, which will build a dynamically-linked executable and copy it to the local `./bin` directory:
```
make install
```

You can change the install directory by using the `INSTALLDIR` environment variable
```
INSTALLDIR=$HOME/.local/bin make install
```

### Using Make (Dynamic)
If you prefer to rebuild the static binary (located in ./static), you can do so with the `static` target:
```
make static
```

Similar to the `install` target, you can control where the resulting executable gets copied:

```
STATICINSTALLDIR=$HOME/.local/bin make install
```


## Running

### Using Cabal

You can use `cabal run aoc` to run the executable without installing it. To get full help, you can run the following:
```
❯ cabal run aoc -- -h
AOC Runner

Usage: aoc (-i|--input STRING) (-d|--day NATURAL) [-p|--part NATURAL] 
           [-j|--json]

Available options:
  -h,--help                Show this help text
  -i,--input STRING        Path to an input file to run an exercise against
  -d,--day NATURAL         Which day's exercises to run
  -p,--part NATURAL        Which part of the day's exercise to run
  -j,--json                Whether or not to show resuls as json
```

For example, to run all solutions for a day, you can run:
```
cabal run aoc -i ./inputs/01.txt -d 1
70764
203905
```

To just run the solution for part 2, you can run:
```
cabal run aoc -i ./inputs/01.txt -d 1 -p 2
203905
```

If you'd rather the results as json, just pass the `-j` flag:
```
cabal run aoc -i ./inputs/01.txt -d 1 -j
{"part_1":"70764","part_2":"203905"}
```

Note that the -j flag does not work when specifying a specific part.

### Benchmarks

Benchmarks can be run using cabal:
```
cabal bench
```

## Posting
Since this runs in the command line, it's rather trivial to copy a solution
to the clipboard for submission. 

### On Linux

```
cabal run -v0 aoc ./inputs/01.txt 1 1 | xclip --selection clipboard
```

### On Mac OSX
```
cabal run -v0 aoc ./inputs/01.txt 1 1 | pbcopy
```

### On Windows

Uh.. I'll get back to you on that.
