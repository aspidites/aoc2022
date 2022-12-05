module Day1.Part2 where

import Data.List (sortOn)
import Common (ParseResult(ParseElves), Elf(..))
import Data.Ord (Down(..))

solve :: ParseResult -> Int
solve (ParseElves elves) = sum . take 3 
                         . sortOn Down 
                         . fmap (sum . calories) $ elves
solve _ = error "invalid parse result received"
