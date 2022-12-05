module Day1.Part1 where

import Common (ParseResult(ParseElves), Elf(..))

solve :: ParseResult -> Int
solve (ParseElves elves) = maximum . fmap (sum . calories) $ elves
solve _ = error "invalid parse result received"
