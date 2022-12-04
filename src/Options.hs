{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
module Options 
  ( Options(..)
  , exercises
  ) where

import Options.Generic 
import Common (Exercise(..))
import Numeric.Natural (Natural)

import Day1.Part1 qualified as Day1Part1
import Day1.Part2 qualified as Day1Part2
import Day2.Part1 qualified as Day2Part1
import Day2.Part2 qualified as Day2Part2
import Day3.Part1 qualified as Day3Part1
import Day3.Part2 qualified as Day3Part2

import Data.ByteString (ByteString)

data Options w = Options
  { input :: w ::: FilePath <?> "Path to an input file to run an exercise against"
  , day :: w ::: Natural  <?> "Which day's exercises to run"
  , part :: w ::: Maybe Natural <?> "Which part of the day's exercise to run"
  , json :: w ::: Bool <?> "Whether or not to show resuls as json"
  } deriving (Generic)

instance ParseRecord (Options Wrapped) where
  parseRecord = parseRecordWithModifiers modifiers
    where
      modifiers = defaultModifiers { shortNameModifier = firstLetter }
deriving instance Show (Options Unwrapped)

exercises :: [(Natural, Exercise (ByteString -> Natural))]
exercises = 
  [ (1, Exercise Day1Part1.run Day1Part2.run)
  , (2, Exercise Day2Part1.run Day2Part2.run)
  , (3, Exercise Day3Part1.run Day3Part2.run)
  ]
