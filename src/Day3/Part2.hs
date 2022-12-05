module Day3.Part2 where


import Common (RuckSack(..), ParseResult(ParseRucks))
import Day3.Common (getPriority)

import Data.Set (Set)
import Data.Set qualified as S
import Data.List.Split (chunksOf)

getTeams :: [RuckSack] -> [[Set Char]]
getTeams = map (map S.fromList) 
         . chunksOf 3 
         . map team

solve :: ParseResult -> Int
solve (ParseRucks rucks) = sum . map getPriority 
                         . concatMap (S.toList . foldr1 S.intersection) 
                         . getTeams $ rucks
solve _ = error "invalid parse result received"
