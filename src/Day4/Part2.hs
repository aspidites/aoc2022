module Day4.Part2 where

import Data.IntSet qualified as S
import Day4.Common (Section(..))

solve :: [Section] -> Int
solve = foldr go 0
  where
    go :: Section -> Int -> Int
    go (Section r1 r2) result = 
      result + if r1 `S.disjoint` r2 then 0 else 1
