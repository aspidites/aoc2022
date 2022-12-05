module Day3.Part1 where

import Data.Set (Set)
import Data.Set qualified as S
import Day3.Common (RuckSack(..), getPriority)

findDuplicate :: RuckSack -> Set Char
findDuplicate (RuckSack _ a b) = a `S.intersection` b

prioritize :: [RuckSack] -> [Int]
prioritize = map getPriority . foldr (go . findDuplicate) [] 
  where
    go :: Set Char -> [Char] -> [Char]
    go set list = S.toAscList set <> list

solve :: [RuckSack] -> Int
solve = sum . prioritize 
