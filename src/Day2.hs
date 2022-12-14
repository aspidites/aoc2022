module Day2 where

import Common (Solution(..), SomeSolution(..))
import Day2.Common qualified as Common
import qualified Day2.Part1 as Part1
import qualified Day2.Part2 as Part2

day2 :: SomeSolution
day2 = SomeSolution $ Solution Common.parse Part1.solve Part2.solve
