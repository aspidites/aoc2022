module Day3.Part2 where


import Day3.Common 
  ( RuckSack(..)
  , getPriority
  , parse
  )

import Data.Set (Set)
import Data.Set qualified as S
import Numeric.Natural (Natural)
import  Data.ByteString (ByteString)
import Data.List.Split (chunksOf)

data Group = Group
  { one :: Set Char
  , two :: Set Char
  , three :: Set Char
  } deriving (Eq, Ord, Show)

solve :: [RuckSack] -> Natural
solve = sum . fmap getPriority . concatMap (S.toList . foldr1 S.intersection) . getTeams

getTeams :: [RuckSack] -> [[Set Char]]
getTeams = fmap (fmap S.fromList) . chunksOf 3 . fmap team

run :: ByteString -> Natural
run = solve . parse
