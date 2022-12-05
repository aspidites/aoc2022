module Day4.Part2 where

import Common (ParseResult(ParseFn))
import Day4.Common (parseRange)
import Data.Attoparsec.ByteString.Char8 hiding (parse)
import Data.IntSet qualified as S

parseLine :: Parser Int
parseLine = do
  r1 <- parseRange
  _ <- char ','
  r2 <- parseRange

  pure $ if r1 `S.disjoint` r2 then 0 else 1

solve :: ParseResult -> Int
solve (ParseFn parse) = either (const 0) sum (parse parseLine)
solve _ = error "invalid parse result received"
