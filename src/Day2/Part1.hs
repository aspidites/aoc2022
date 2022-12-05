{-# LANGUAGE LambdaCase #-}
module Day2.Part1 where

import Common
  ( Round(..)
  , Us(..)
  , Them(..)
  , ParseResult(ParseRounds)
  )
import Day2.Common (scoreShape)

scoreRound :: Round -> Int
scoreRound (Round them us) = scoreShape us + outcome (them, us)
  where
    outcome = \case
      (A, Y) -> 6
      (A, Z) -> 0 
      (B, X) -> 0
      (B, Z) -> 6
      (C, X) -> 6
      (C, Y) -> 0
      _ -> 3

solve :: ParseResult -> Int
solve (ParseRounds rounds) = sum . fmap scoreRound $ rounds
solve _ = error "invalid parse result received"
