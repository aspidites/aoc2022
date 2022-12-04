module Day1.Part2 (run) where

import Data.List (sortOn)
import Data.Ord (Down(..))
import Day1.Common (Elf(..), parse)
import  Data.ByteString (ByteString)

solve :: [Elf] -> Int
solve = sum . take 3 . sortOn Down . fmap (sum . calories)

run :: ByteString -> Int
run = solve . parse
