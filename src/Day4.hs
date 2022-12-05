module Day4 where

import Day4.Common qualified as Common
import qualified Day4.Part1 as Part1
import qualified Day4.Part2 as Part2
import Common (Solution(..))

day4 :: Solution
day4 = Solution Common.parse Part1.solve Part2.solve
