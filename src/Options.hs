{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
module Options where

import Options.Generic
import Numeric.Natural
import Control.Monad (forM_)

import Day1 (Runner)
import Day1.Part1 qualified as Day1Part1
import Day1.Part2 qualified as Day1Part2


data Options w = Options
  { day :: w ::: Maybe Natural  <?> "Which day's exercises to run"
  , part :: w ::: Maybe Natural <?> "Which part of the day's exercise to run"
  } deriving (Generic)

instance ParseRecord (Options Wrapped)
deriving instance Show (Options Unwrapped)

exercises :: [(Natural, [(Natural, (Runner, FilePath))])]
exercises = 
  [
    ( 1
      , [ ( 1
          , ( Day1Part1.run, "./inputs/01.txt" )
          )
        , ( 2
          , ( Day1Part2.run, "./inputs/01.txt")
          )
        ]
    )
  ]

runWithOptions :: Options Unwrapped -> IO ()
runWithOptions (Options day part) = do
  case day of
    Nothing -> runAllDays
    Just day' -> do
      case part of
        Nothing -> runAllParts day'
        Just part' -> do
          run day' part' 

runAllDays :: IO ()
runAllDays = sequence_ $ do
  (_, parts) <- exercises
  (_, (runner, path)) <- parts
  pure $ runner path
  

runAllParts :: Natural -> IO ()
runAllParts day = do
  case lookup day exercises of
    Nothing -> error $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      forM_ parts $ \(_, (runner, path)) -> runner path


run :: Natural -> Natural -> IO ()
run day part = do
  case lookup day exercises of
    Nothing -> error $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      case lookup part parts of
        Nothing -> error $ "Solutions for day " <> show day <> ", part " <> show part <> " do not exist."
        Just (runner, path) -> runner path
