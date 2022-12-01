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
  (w ::: FilePath <?> "Path to an input file to run an exercise against")
  (w ::: Maybe Natural  <?> "Which day's exercises to run")
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
  ]

runWithOptions :: Options Unwrapped -> IO ()
runWithOptions (Options input day part) = do
  case day of
    Nothing -> runAllDays input
    Just day' -> do
      case part of
        Nothing -> runAllParts input day'
        Just part' -> do
          run input day' part' 

runAllDays :: FilePath -> IO ()
runAllDays input = sequence_ $ do
  (_, parts) <- exercises
  (_, runner) <- parts
  pure $ runner input
  

runAllParts :: FilePath -> Natural -> IO ()
runAllParts input day = do
  case lookup day exercises of
    Nothing -> putStrLn $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      forM_ parts $ \(_, runner) -> runner input


run :: FilePath -> Natural -> Natural -> IO ()
run input day part = do
  case lookup day exercises of
    Nothing -> putStrLn $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      case lookup part parts of
        Nothing -> putStrLn $ "Solutions for day " <> show day <> ", part " <> show part <> " do not exist."
        Just runner -> runner input
