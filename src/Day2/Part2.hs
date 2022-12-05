module Day2.Part2 where

import Day2.Part1 (scoreRound)

import Common 
  ( Us(..)
  , Them(..)
  , Round(..)
  , ParseResult (ParseRounds)
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

solve :: ParseResult -> Int
solve (ParseRounds rounds) = sum . fmap (scoreRound . predictRound) $ rounds
solve _ = error "invalid parse result received"
