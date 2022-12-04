{-# LANGUAGE LambdaCase #-}
module Day2.Part1 (run, solve, scoreRound) where

import  Data.ByteString (ByteString)
import Numeric.Natural (Natural)
import Day2.Common
  ( Round(..)
  , Us(..)
  , Them(..)
  , parse
  , scoreShape
  )

scoreRound :: Round -> Natural
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


solve :: [Round] -> Natural
solve = sum . fmap scoreRound

run :: ByteString -> Natural
run = solve . parse
