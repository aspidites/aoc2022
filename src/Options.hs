{-# LANGUAGE DataKinds #-}

module Options where

import Options.Generic 

data Options w = Options
  { input :: w ::: FilePath <?> "Path to an input file to run an exercise against"
  , day :: w ::: Int <?> "Which day's exercises to run"
  , part :: w ::: Maybe Int <?> "Which part of the day's exercise to run"
  , json :: w ::: Bool <?> "Whether or not to show resuls as json"
  } deriving (Generic)

instance ParseRecord (Options Wrapped) where
  parseRecord = parseRecordWithModifiers modifiers
    where
      modifiers = defaultModifiers { shortNameModifier = firstLetter }
deriving instance Show (Options Unwrapped)
