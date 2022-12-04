{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Day2.Common where


import Data.ByteString (ByteString)
import Data.ByteString.Char8 qualified as B

data Them = A | B | C
  deriving (Eq, Ord, Read, Show)

data Round = Round Them Us
  deriving (Eq, Ord, Read, Show)

data Us = X | Y | Z
  deriving (Eq, Ord, Read, Show)

scoreShape :: Us -> Int
scoreShape = \case
  X -> 1
  Y -> 2 
  Z -> 3

parseRound :: ByteString -> Round
parseRound = \case
  "A X" -> Round A X
  "B X" -> Round B X
  "C X" -> Round C X
  "A Y" -> Round A Y
  "B Y" -> Round B Y
  "C Y" -> Round C Y
  "A Z" -> Round A Z
  "B Z" -> Round B Z
  "C Z" -> Round C Z
  _ -> error "Unknown format for round"

parse :: ByteString -> [Round]
parse = fmap parseRound . B.lines
