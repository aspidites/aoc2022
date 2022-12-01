{-# LANGUAGE OverloadedStrings #-}
module Main where

import Day1 (run)
import System.Environment
import Data.Either (rights)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Read (decimal)
import Data.Text.IO qualified as T
import Numeric.Natural

parse :: Text -> [[Natural]]
parse = fmap (go . T.lines) . T.splitOn "\n\n"
  where
    go :: [Text] -> [Natural]
    go = fmap fst . rights . fmap decimal

solve :: [[Natural]] -> Natural
solve = maximum . fmap sum

main :: IO ()
main = T.interact run
