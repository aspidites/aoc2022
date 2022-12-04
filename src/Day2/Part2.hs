module Day2.Part2 (run, solve) where

import Day2.Part1 qualified as P1

import Day2.Common 
  ( Us(..)
  , Them(..)
  , Round(..)
  , parse
  )

import Numeric.Natural (Natural)
import  Data.ByteString (ByteString)

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

solve :: [Round] -> Natural
solve = sum . fmap (P1.scoreRound . predictRound)

run :: ByteString -> Natural
run = solve . parse
