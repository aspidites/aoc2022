module Day3.Part2 where


import Day3.Common (RuckSack(..), getPriority)

import Data.Set (Set)
import Data.Set qualified as S
import Data.List.Split (chunksOf)

getTeams :: [RuckSack] -> [[Set Char]]
getTeams = map (map S.fromList) 
         . chunksOf 3 
         . map team

solve :: [RuckSack] -> Int
solve = sum . map getPriority 
                         . concatMap (S.toList . foldr1 S.intersection) 
                         . getTeams
