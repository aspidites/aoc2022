module Day1.Part1 (run) where

import Day1.Common (Elf(..), parse)
import  Data.ByteString (ByteString)

solve :: [Elf] -> Int
solve = maximum . fmap (sum . calories)

run :: ByteString -> Int
run = solve . parse
