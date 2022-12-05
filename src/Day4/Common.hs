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

parseLine :: (IntSet -> IntSet -> Bool) -> Parser Int
parseLine predicate = do
  r1 <- parseRange
  _ <- char ','
  r2 <- parseRange

  pure $ if predicate r1 r2 then 1 else 0

parse :: ByteString -> ParseResult
parse input = ParseFn $ \predicate -> either (const 0) sum $ parseOnly (parseLine predicate `sepBy1` endOfLine) input
