module Day3.Part2 where


import Day3.Common 
  ( RuckSack(..)
  , getPriority
  , parse
  )

import Data.Set (Set)
import Data.Set qualified as S
import  Data.ByteString (ByteString)
import Data.List.Split (chunksOf)

solve :: [RuckSack] -> Int
solve = sum . map getPriority 
      . concatMap (S.toList . foldr1 S.intersection) 
      . getTeams

getTeams :: [RuckSack] -> [[Set Char]]
getTeams = map (map S.fromList) 
         . chunksOf 3 
         . map team

run :: ByteString -> Int
run = solve . parse
