{-# LANGUAGE OverloadedStrings #-}
module Day1 where

import Data.Either (rights)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Read (decimal)
import Numeric.Natural (Natural)

type Solver = [[Natural]] -> Natural

parse :: Text -> [[Natural]]
parse = fmap (go . T.lines) . T.splitOn "\n\n"
  where
    go :: [Text] -> [Natural]
    go = fmap fst . rights . fmap decimal

mkRun :: Solver -> (Text -> Text)
mkRun solve = T.pack . show . solve . parse
