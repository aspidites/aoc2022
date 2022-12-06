module Day6.Part2 where

import Day6.Common
import Data.Containers.ListUtils (nubOrd)

solve :: DataStream -> Int
solve (DataStream buffer) = go buffer 0
  where
    go [] _ = 0
    go bs n
      | length (nubOrd $ take 14 bs) == 14 = n + 14
      | otherwise = go (tail bs) (n + 1)
