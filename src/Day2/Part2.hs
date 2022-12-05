module Day2.Part2 where

import Day2.Part1 (scoreRound)

import Day2.Common 
  ( Us(..)
  , Them(..)
  , Round(..)
  )

predictRound :: Round -> Round
predictRound (Round them us) = 
  Round them $ case (them, us) of
    (A, X) -> Z
    (A, Y) -> X
    (A, Z) -> Y
    (B, X) -> X
    (B, Y) -> Y
    (B, Z) -> Z
    (C, X) -> Y
    (C, Y) -> Z
    (C, Z) -> X

solve :: [Round] -> Int
solve = sum . fmap (scoreRound . predictRound)
