{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
module Day2.Common where

import Common (Us(..), Them(..), Round(..), ParseResult(ParseRounds))
import Data.ByteString (ByteString)
import Data.ByteString.Char8 qualified as B

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

parse :: ByteString -> ParseResult
parse = ParseRounds . fmap parseRound . B.lines
