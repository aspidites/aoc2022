{-# LANGUAGE OverloadedStrings #-}
module Day1 (parse, solve, run) where

import Data.Text (Text)
import Data.Text qualified as T
import Data.Either (rights)
import Data.Text.Read (decimal)
import Numeric.Natural (Natural)

parse :: Text -> [[Natural]]
parse = fmap (go . T.lines) . T.splitOn "\n\n"
  where
    go :: [Text] -> [Natural]
    go = fmap fst . rights . fmap decimal

solve :: [[Natural]] -> Natural
solve = maximum . fmap sum

run :: Text -> Text
run = T.pack . show . solve . parse
