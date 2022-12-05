module Day2 where

import Common (Solution(..))
import Day2.Common qualified as Common
import qualified Day2.Part1 as Part1
import qualified Day2.Part2 as Part2

day2 :: Solution
day2 = Solution Common.parse Part1.solve Part2.solve
