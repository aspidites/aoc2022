# Advent of Code 2022
My solutions for AoC 2022. 

## Organization
Exercises are organized by day and part under the "src" directory. For
example, day one is organized as follows:

    src/Day1
    ├── Part1.hs
    └── Part2.hs

## Running

You can use `cabal run aoc` to run the program. To get full help, you can run the following:
```
❯ cabal run aoc -- -h
Up to date
AOC Runner

Usage: aoc STRING [NATURAL] [NATURAL]

Available options:
  -h,--help                Show this help text
  STRING                   Path to an input file to run an exercise against
  NATURAL                  Which day's exercises to run
  NATURAL                  Which part of the day's exercise to run
```

For example, to run all solutions for a day, you can run:
```
cabal run aoc ./inputs/01.txt 1
```

To just run the solution for part 2, you can run:
```
cabal run aoc ./inputs/01.txt 1 2
```

## Posting
Since this runs in the command line, it's rather trivial to copy a solution
to the clipboard for submission. On linux:

```
cabal run -v0 aoc2022 ./inputs/01.txt 1 1 | xclip --selection clipboard
```

On mac:
```
cabal run -v0 aoc2022 ./inputs/01.txt 1 1 | pbcopy
```
