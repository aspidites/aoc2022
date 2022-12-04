{-# LANGUAGE LambdaCase #-}
module Day2.Part1 (run, solve) where

import  Data.ByteString (ByteString)
import Numeric.Natural (Natural)
import Day2.Common
  ( Round(..)
  , RPS(..)
  , Us(..)
  , parse
  , scoreShape
  , scoreOutcome
  , themToRPS
  )

usToRPS :: Us -> RPS
usToRPS = \case
  X -> Rock
  Y -> Paper
  Z -> Scissors

scoreRound :: Round -> Natural
scoreRound (Round them us) = shape + outcome
  where
    shape = scoreShape ourShape
    outcome = scoreOutcome (ourShape, theirShape)
    ourShape = usToRPS us
    theirShape = themToRPS them

solve :: [Round] -> Natural
solve = sum . fmap scoreRound

run :: ByteString -> Natural
run = solve . parse
