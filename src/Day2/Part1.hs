{-# LANGUAGE LambdaCase #-}
module Day2.Part1 where

import Day2.Common
  ( Round(..)
  , Us(..)
  , Them(..)
  , scoreShape
  )

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

solve :: [Round] -> Int
solve = sum . fmap scoreRound 
