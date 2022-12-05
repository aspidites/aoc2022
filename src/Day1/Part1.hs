module Day1.Part1 where

import Day1.Common (Elf(..))

solve :: [Elf] -> Int
solve = maximum . fmap (sum . calories)
