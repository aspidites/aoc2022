module Day1.Part1 (run) where

import Day1.Common (Elf(..), parse)
import Numeric.Natural (Natural)
import  Data.ByteString (ByteString)

solve :: [Elf] -> Natural
solve = maximum . fmap (sum . calories)

run :: ByteString -> Natural
run = solve . parse
