{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}
module Day2.Common where


import Data.ByteString (ByteString)
import Data.ByteString.Char8 qualified as B
import Numeric.Natural (Natural)

data Them = A | B | C
  deriving (Eq, Ord, Read, Show)

data RPS = Rock | Paper | Scissors
  deriving (Eq, Ord, Read, Show)

data Round = Round Them Us
  deriving (Eq, Ord, Read, Show)

data Us = X | Y | Z
  deriving (Eq, Ord, Read, Show)

themToRPS :: Them -> RPS
themToRPS = \case
  A -> Rock
  B -> Paper
  C -> Scissors

scoreOutcome :: (RPS, RPS) -> Natural
scoreOutcome = \case
  (Rock, Paper) -> 0
  (Rock, Scissors) -> 6
  (Paper, Scissors) -> 0
  (Paper, Rock) -> 6
  (Scissors, Rock) -> 0
  (Scissors, Paper) -> 6
  _ -> 3

scoreShape :: RPS -> Natural
scoreShape = \case 
  Rock -> 1 
  Paper -> 2 
  Scissors -> 3

parse :: ByteString -> [Round]
parse = fmap (\x -> read . B.unpack $ "Round " <> x) . B.lines
