module Day1.Part2 where

import Data.List (sortOn)
import Day1.Common (Elf(..))
import Data.Ord (Down(..))

solve :: [Elf] -> Int
solve = sum . take 3 
     . sortOn Down 
     . fmap (sum . calories)
