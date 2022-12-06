module Day5.Part1 where

import Day5.Common (Instructions(..), Stack(..), Move(..), Crate(..))

interpretMove :: Move -> [Stack] -> [Stack]
interpretMove (Move q f t) s = foldr go [] (zip [1..] s)
  where 
    go :: (Int, Stack) -> [Stack] -> [Stack]
    go (stackNum, stack@(Stack _ cs)) stacks
      | stackNum == f = stack { crates = drop q cs} : stacks
      | stackNum == t = stack { crates = reverse items <> cs} : stacks
      | otherwise = stack : stacks

    items = take q $ crates (s !! (f - 1))

interpretMoves :: Instructions -> [Stack]
interpretMoves (Instructions stacks moves) = foldr interpretMove stacks moves

solve :: Instructions -> String
solve = foldr go "" . interpretMoves
  where
    go :: Stack -> String -> String
    go (Stack _ (x:_)) result = item x : result
    go _ result =  ' ' : result
