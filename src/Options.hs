{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
module Options 
  ( Options(..)
  , exercises
  ) where

import Options.Generic 
  ( Generic
  , ParseRecord
  , Wrapped
  , Unwrapped
  , (:::)
  , type (<?>)
  )
import Numeric.Natural (Natural)

import Common (Runner)
import Day1.Part1 qualified as Day1Part1
import Day1.Part2 qualified as Day1Part2
import Day2.Part1 qualified as Day2Part1
import Day2.Part2 qualified as Day2Part2


data Options w = Options
  (w ::: FilePath <?> "Path to an input file to run an exercise against")
  (w ::: Natural  <?> "Which day's exercises to run")
  (w ::: Maybe Natural <?> "Which part of the day's exercise to run")
  deriving (Generic)

instance ParseRecord (Options Wrapped)
deriving instance Show (Options Unwrapped)

exercises :: [(Natural, [(Natural, Runner)])]
exercises = 
  [
    ( 1
      , [ ( 1
          , Day1Part1.run
          )
        , ( 2
          , Day1Part2.run
          )
        ]
    )
  , ( 2 
      , [ ( 1 
          , Day2Part1.run
          )
        , ( 2
          , Day2Part2.run
          )
        ]
    )
  ]
