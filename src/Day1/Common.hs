{-# LANGUAGE OverloadedStrings #-}
module Day1.Common where

import Data.ByteString (ByteString)
import Data.ByteString qualified as B

import Data.Word (Word8)
import Data.ByteString.Char8 (readInt)
import Numeric.Natural (Natural)

newtype Elf = Elf { calories :: [Natural] }

tokenize :: ByteString -> ByteString -> [ByteString]
tokenize x y = h : if B.null t then [] else tokenize x (B.drop (B.length x) t)
    where (h,t) = B.breakSubstring x y

newline :: Word8
newline = 10

parse :: ByteString -> [Elf]
parse = fmap (Elf . fmap (fromIntegral . maybe 0 fst . readInt) . B.split 10) . tokenize "\n\n"
