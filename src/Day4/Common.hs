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
  (a, rest) <- readDecimal line
  (b, rest') <- readDecimal $ B.drop 1 rest
  (x, rest'') <- readDecimal $ B.drop 1 rest'
  (y, _) <- readDecimal rest''
  pure $ Section (S.fromAscList [a..b]) (S.fromAscList [x..y])

data Section = Section 
  { first :: IntSet
  , second :: IntSet
  } deriving (Eq, Ord, Show)

parse :: ByteString -> [Section]
parse = fromMaybe [] . mapM parseSection . B.lines
