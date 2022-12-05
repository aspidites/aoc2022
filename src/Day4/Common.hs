{-# LANGUAGE OverloadedStrings #-}
module Day4.Common where

import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Data.ByteString.Char8 qualified as B
import Data.IntSet (IntSet)
import Data.IntSet qualified as S
import Data.ByteString.Lex.Integral (readDecimal_)

data Section = Section 
  { first :: IntSet
  , second :: IntSet
  } deriving (Eq, Ord, Show)

parseSection :: ByteString -> Section
parseSection line = Section first second
  where
    (left, right) = B.breakSubstring "," line
    (a, b) = B.breakSubstring "-" left
    (x, y) = B.breakSubstring "-" right
    first = S.fromAscList [readDecimal_ a..readDecimal_ b]
    second = S.fromAscList [readDecimal_ x..readDecimal_ y]
    
parse :: ByteString -> [Section]
parse = map parseSection . B.lines
