module Day3.Part1 (run, solve) where

import  Data.ByteString (ByteString)
import Numeric.Natural (Natural)
import Data.Set (Set)
import Data.Set qualified as S
import Day3.Common
  ( RuckSack(..)
  , parse
  , getPriority
  )

findDuplicate :: RuckSack -> Set Char
findDuplicate (RuckSack _ a b) = a `S.intersection` b

prioritize :: [RuckSack] -> [Natural]
prioritize = fmap getPriority . foldr go [] . fmap findDuplicate
  where
    go :: Set Char -> [Char] -> [Char]
    go set list = S.toAscList set <> list

solve :: [RuckSack] -> Natural
solve = sum . prioritize

run :: ByteString -> Natural
run = solve . parse