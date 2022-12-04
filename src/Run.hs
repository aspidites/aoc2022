{-# LANGUAGE OverloadedStrings #-}
module Run 
  ( runWithOptions 
  , runAllParts 
  , run 
  ) where

import Options (Options(..), exercises)
import Control.Monad (forM)
import Options.Generic (Unwrapped)
import Numeric.Natural (Natural)
import Data.Text (Text)
import Data.Text qualified as T

runWithOptions :: Options Unwrapped -> IO Text
runWithOptions (Options input day part) = do
  case part of
    Nothing -> runAllParts input day
    Just part' -> do
      run input day part' 

runAllParts :: FilePath -> Natural -> IO Text
runAllParts input day = do
  case lookup day exercises of
    Nothing -> pure . T.pack $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      results <- forM parts $ \(_, runner) -> runner input
      pure $ T.unlines results

run :: FilePath -> Natural -> Natural -> IO Text
run input day part = do
  case lookup day exercises of
    Nothing -> pure . T.pack $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      case lookup part parts of
        Nothing -> pure . T.pack $ "Solutions for day " <> show day <> ", part " <> show part <> " do not exist."
        Just runner -> runner input
