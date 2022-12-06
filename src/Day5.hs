module Day5 where

import Day5.Common qualified as Common
import qualified Day5.Part1 as Part1
import qualified Day5.Part2 as Part2
import Common (Solution(..), SomeSolution(..))

day5 :: SomeSolution
day5 = SomeSolution $ Solution Common.parse Part1.solve Part2.solve
