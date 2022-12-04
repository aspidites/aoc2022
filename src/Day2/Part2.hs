{-# LANGUAGE LambdaCase #-}
module Day2.Part2 (run, solve) where

import Common (Runner)
import Day2.Common

import Numeric.Natural (Natural)

data Outcome
  = Lose
  | Draw
  | Win
  deriving (Eq, Ord, Show)

usToOutcome :: Us -> Outcome
usToOutcome = \case
  X -> Lose
  Y -> Draw
  Z -> Win

predictShape :: Us -> Them -> RPS
predictShape us them = 
  case (themToRPS them, usToOutcome us) of
    (Rock, Lose) -> Scissors
    (Rock, Win) -> Paper
    (Paper, Lose) -> Rock
    (Paper, Win) -> Scissors
    (Scissors, Lose) -> Paper
    (Scissors, Win) -> Rock
    (shape, Draw) -> shape 

predictRound :: Round -> Natural
predictRound (Round them us) = shape + outcome
  where
    shape = scoreShape ourShape
    outcome = scoreOutcome (ourShape, theirShape)
    ourShape = predictShape us them
    theirShape = themToRPS them
  
solve :: Solver
solve = sum . fmap predictRound

run :: Runner
run = mkRun solve
