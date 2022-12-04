module Day3
  ( part1 
  , part2 
  ) where

import qualified Day3.Part1 as Part1
import qualified Day3.Part2 as Part2
import Data.ByteString (ByteString)
import Numeric.Natural (Natural)

part1 :: ByteString -> Natural
part1 = Part1.run

part2 :: ByteString -> Natural
part2 = Part2.run
