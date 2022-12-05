module Day4.Part1 where

import Data.IntSet qualified as S
import Day4.Common (Section(..))

solve :: [Section] -> Int
solve = foldr go 0
  where
    go :: Section -> Int -> Int
    go (Section r1 r2) result = 
      result + if r1 `S.isSubsetOf` r2 || r2 `S.isSubsetOf` r1 then 1 else 0
