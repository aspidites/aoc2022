module Day6.Part1 where

import Day6.Common
import Data.Containers.ListUtils (nubOrd)

solve :: DataStream -> Int
solve (DataStream buffer) = go buffer 0
  where
    go [] _ = 0
    go (w:x:y:z:ws) n
      | length (nubOrd [w, x, y, z]) == 4 = n + 4
      | otherwise = go (x:y:z:ws) (n + 1)
    go _ n = n
