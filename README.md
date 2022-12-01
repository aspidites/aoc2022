# Advent of Code 2022
My solutions for AoC 2022. 

## Organization
Exercises are organized by day and part under the "src" directory. For
example, day one is organized as follows:

    src/Day1
    ├── Part1.hs
    └── Part2.hs

## Running
You can run a given solution using cabal as follows:
```
cabal run aoc2022 --day 1 --part 1
```

If a part is omitted, all parts for that day are run. If day is ommitted
solutions for all days are run.

## Posting
Since this runs in the command line, it's rather trivial to copy a solution
to the clipboard for submission. On linux:

```
cabal run -v0 aoc2022 --day 1 --part 1 | xclip --selection clipboard
```

On mac:
```
cabal run -v0 aoc2022 --day 1 --part 1 | pbcopy
```
