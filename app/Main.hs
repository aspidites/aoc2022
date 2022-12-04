{-# LANGUAGE OverloadedStrings #-}
module Main where

import Options.Generic
import Data.ByteString.Char8 qualified as B
import Run

main :: IO ()
main = do
  options <- unwrapRecord "AOC CLI"
  B.putStrLn =<< runWithOptions options 
