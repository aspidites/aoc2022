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
import Data.Text.Encoding (decodeUtf8)
import Jsonifier

runWithOptions :: Options Unwrapped -> IO Text
runWithOptions (Options input day part asJson) = do
  case part of
    Nothing -> runAllParts input day asJson
    Just part' -> do
      run input day part' asJson

runAllParts :: FilePath -> Natural -> Bool -> IO Text
runAllParts input day asJson = do
  case lookup day exercises of
    Nothing -> pure . T.pack $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      if asJson then do
        results <- forM parts $ \(part, runner) -> do
          result <- runner input
          pure ("part_" <> T.pack (show part), textString result)
        pure . decodeUtf8 . toByteString $ object results
      else do
        results <- forM parts $ \(_, runner) -> runner input
        pure $ T.unlines results

run :: FilePath -> Natural -> Natural -> Bool -> IO Text
run input day part asJson = do
  case lookup day exercises of
    Nothing -> pure . T.pack $ "Solutions for day " <> show day <> "do not exist."
    Just parts -> do
      case lookup part parts of
        Nothing -> pure . T.pack $ "Solutions for day " <> show day <> ", part " <> show part <> " do not exist."
        Just runner -> 
          if asJson then do
            result <- runner input
            let results = ("part_" <> T.pack (show part), textString result)
            pure . decodeUtf8 . toByteString $ object [results]
          else runner input

