module Day4.Common where

import Data.Attoparsec.ByteString.Char8
import Data.ByteString (ByteString)
import Data.IntSet (IntSet)
import Data.IntSet qualified as S
import Common (ParseResult(ParseFn))

parseRange :: Parser IntSet
parseRange = do
  a1 <- read <$> many1 digit
  _ <- char '-'
  a2 <- read <$> many1 digit
  pure . S.fromAscList $ [a1..a2]

parse :: ByteString -> ParseResult
parse input = ParseFn $ \f -> parseOnly (f `sepBy1` endOfLine) input

