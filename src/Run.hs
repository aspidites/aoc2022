{-# LANGUAGE OverloadedStrings #-}
module Run 
  ( runWithOptions 
  , runAllParts 
  , run 
  ) where

import System.Directory
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Common (Solution(..), Exercise(..))
import Options (Options(..), exercises)
import Data.ByteString.Char8 qualified as C
import Options.Generic (Unwrapped)
import Numeric.Natural (Natural)
import Data.Aeson (encode)

runWithOptions :: Options Unwrapped -> IO ByteString
runWithOptions (Options path day part asJson) = do
  exists <- doesFileExist path
  if not exists 
    then pure ""
    else do
      input <- B.readFile path
      case part of
        Nothing -> runAllParts input day asJson
        Just part' -> do
          run input day part' asJson

runAllParts :: ByteString -> Natural -> Bool -> IO ByteString
runAllParts input day asJson = do
  case lookup day exercises of
    Nothing -> pure $ "Solutions for day " <> C.pack (show day) <> "do not exist"
    Just (Exercise r1 r2) -> 
      if asJson 
        then pure . B.toStrict $ encode (Solution (Just (r1 input)) (Just (r2 input)))
        else pure $ C.pack (show (r1 input)) <> "\n" <> C.pack (show (r2 input))

run :: ByteString -> Natural -> Natural -> Bool -> IO ByteString
run input day part asJson = do
  case lookup day exercises of
    Nothing -> pure $ "Solutions for day " <> C.pack (show day) <> "do not exist"
    -- TODO: better model types so I dont' have to do this terriblness
    Just (Exercise r1 r2) -> 
      if asJson
        then 
          if part == 1 
            then pure . B.toStrict $ encode (Solution (Just (r1 input)) Nothing)
            else pure . B.toStrict $ encode (Solution Nothing (Just (r2 input)))
        else 
          pure $ C.pack (show ((if part == 1 then r1 else r2) input))

