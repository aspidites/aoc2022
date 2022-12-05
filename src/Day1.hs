module Day1 where

import Day1.Common qualified as Common
import qualified Day1.Part1 as Part1
import qualified Day1.Part2 as Part2

import Common (Solution(..), SomeSolution(..))

day1 :: SomeSolution
day1 = SomeSolution $ Solution Common.parse Part1.solve Part2.solve
