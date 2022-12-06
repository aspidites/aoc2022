module Day6 where

import Day6.Common qualified as Common
import qualified Day6.Part1 as Part1
import qualified Day6.Part2 as Part2

import Common (Solution(..), SomeSolution(..))

day6 :: SomeSolution
day6 = SomeSolution $ Solution Common.parse Part1.solve Part2.solve
