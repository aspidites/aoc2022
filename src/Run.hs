{-# LANGUAGE OverloadedStrings #-}
module Run 
  ( runWithOptions 
  , runAllParts 
  , run 
  ) where

import System.Directory
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Common (Output(..), Solution(..), SomeSolution(..))
import Options (Options(..))
import Data.ByteString.Char8 qualified as C
import Options.Generic (Unwrapped)
import Data.Aeson (encode)

import Day1
import Day2
import Day3
import Day4
import Day5

exercises :: [(Int, SomeSolution)]
exercises = 
  [ (1, day1)
  , (2, day2)
  , (3, day3)
  , (4, day4)
  , (5, day5)
  ]


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
          run input day part'

runAllParts :: ByteString -> Int -> Bool -> IO ByteString
runAllParts input day asJson = do
  case lookup day exercises of
    Nothing -> pure $ "Solutions for day " <> C.pack (show day) <> "do not exist"
    Just (SomeSolution (Solution p s1 s2 )) -> do
      let r = p input
          s1' = s1 r
          s2' = s2 r
      if asJson
        then pure . B.toStrict $ encode (Output s1' s2')
        else pure $ C.pack (show s1') <> C.pack (show s2')
      

run :: ByteString -> Int -> Int -> IO ByteString
run input day part = do
  case lookup day exercises of
    Nothing -> pure $ "Solutions for day " <> C.pack (show day) <> "do not exist"
    Just (SomeSolution (Solution p s1 s2)) -> do
      let r = p input
          s = if part == 1 then s1 r else s2 r
      pure $ C.pack (show s)
