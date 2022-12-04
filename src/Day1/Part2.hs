module Day1.Part2 (run) where

import Data.List (sortOn)
import Data.Ord (Down(..))
import Day1.Common (Elf(..), parse)
import Numeric.Natural (Natural)
import  Data.ByteString (ByteString)

solve :: [Elf] -> Natural
solve = sum . take 3 . sortOn Down . fmap (sum . calories)

run :: ByteString -> Natural
run = solve . parse
