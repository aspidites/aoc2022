module Day3 where

import qualified Day3.Part1 as Part1
import qualified Day3.Part2 as Part2
import Common (Solution(..))
import Day3.Common qualified as Common

day3 :: Solution
day3 = Solution Common.parse Part1.solve Part2.solve
