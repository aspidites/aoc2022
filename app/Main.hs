{-# LANGUAGE OverloadedStrings #-}
module Main where

import Options.Generic
import Options

main :: IO ()
main = do
  options <- unwrapRecord "AOC Runner"
  runWithOptions options 
