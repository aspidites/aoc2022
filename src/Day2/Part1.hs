{-# LANGUAGE LambdaCase #-}
module Day2.Part1 (run, solve) where

import Numeric.Natural (Natural)
import Day2 
  ( Solver
  , Runner
  , Round(..)
  , RPS(..)
  , Us(..)
  , mkRun
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

solve :: Solver
solve = sum . fmap scoreRound

run :: Runner
run = mkRun solve
