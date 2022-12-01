{-# LANGUAGE OverloadedStrings #-}
module Main where

import Options.Generic
import Data.Text.IO qualified as T
import Run

main :: IO ()
main = do
  options <- unwrapRecord "AOC Runner"
  T.putStrLn =<< runWithOptions options 
