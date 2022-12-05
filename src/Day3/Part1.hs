module Day3.Part1 where

import Data.Set (Set)
import Data.Set qualified as S
import Common (RuckSack(..), ParseResult(ParseRucks))
import Day3.Common (getPriority)

findDuplicate :: RuckSack -> Set Char
findDuplicate (RuckSack _ a b) = a `S.intersection` b

prioritize :: [RuckSack] -> [Int]
prioritize = map getPriority . foldr (go . findDuplicate) [] 
  where
    go :: Set Char -> [Char] -> [Char]
    go set list = S.toAscList set <> list

solve :: ParseResult -> Int
solve (ParseRucks rucks) = sum . prioritize $ rucks
solve _ = error "invalid parse result received"
