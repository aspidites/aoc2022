{-# LANGUAGE OverloadedStrings #-}
module Run 
  ( runWithOptions 
  , runAllParts 
  , run 
  ) where

import System.Directory
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Common (Solution(..))
import Options (Options(..), exercises)
import Data.ByteString.Char8 qualified as C
import Options.Generic (Unwrapped)
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

runAllParts :: ByteString -> Int -> Bool -> IO ByteString
runAllParts input day asJson = do
  case lookup day exercises of
    Nothing -> pure $ "Solutions for day " <> C.pack (show day) <> "do not exist"
    Just (Solution r1 r2) -> 
      if asJson 
        then pure . B.toStrict $ encode (Solution (Just (r1 input)) (Just (r2 input)))
        else pure $ C.pack (show (r1 input)) <> "\n" <> C.pack (show (r2 input))

run :: ByteString -> Int -> Int -> Bool -> IO ByteString
run input day part _ = do
  case lookup day exercises of
    Nothing -> pure $ "Solutions for day " <> C.pack (show day) <> "do not exist"
    Just (Solution r1 r2) -> 
      let r = case part of
            1 -> r1
            2 -> r2
            _ -> error "Invalid part specified"
      in pure . C.pack . show $ r input

