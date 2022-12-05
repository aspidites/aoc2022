{-# LANGUAGE OverloadedStrings #-}
module Day4.Common where

import Data.Maybe
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Data.ByteString.Char8 qualified as B
import Data.IntSet (IntSet)
import Data.IntSet qualified as S
import Data.ByteString.Lex.Integral (readDecimal)

parseSection :: ByteString -> Maybe Section
parseSection line = do
  (a, as) <- readDecimal line
  (b, bs) <- readDecimal $ B.drop 1 as
  (x, cs) <- readDecimal $ B.drop 1 bs
  (y, _) <- readDecimal $ B.drop 1 cs
  pure $ Section (S.fromAscList [a..b]) (S.fromAscList [x..y])

data Section = Section 
  { first :: IntSet
  , second :: IntSet
  } deriving (Eq, Ord, Show)

parse :: ByteString -> [Section]
parse = fromMaybe [] . mapM parseSection . B.lines
