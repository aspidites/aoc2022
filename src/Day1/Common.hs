{-# LANGUAGE OverloadedStrings #-}
module Day1.Common where

import Common (Elf(..), ParseResult(ParseElves))
import Data.ByteString (ByteString)
import Data.ByteString qualified as B
import Data.ByteString.Lex.Integral (readDecimal_)

import Data.Word (Word8)


tokenize :: ByteString -> ByteString -> [ByteString]
tokenize x y = h : if B.null t then [] else tokenize x (B.drop (B.length x) t)
    where (h, t) = B.breakSubstring x y

newline :: Word8
newline = 10

parse :: ByteString -> ParseResult
parse = ParseElves . fmap (Elf . fmap readDecimal_ . B.split 10) . tokenize "\n\n"
