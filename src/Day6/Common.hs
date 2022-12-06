module Day6.Common where

import Data.ByteString (ByteString)
import Data.ByteString.Char8 qualified as B
import Data.Aeson (ToJSON)

newtype DataStream = DataStream 
  { buffer :: String }
  deriving (Eq, Ord, Show, ToJSON)

parse :: ByteString -> DataStream
parse = DataStream . B.unpack
