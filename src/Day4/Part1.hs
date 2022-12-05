module Day4.Part1 where

import Common (ParseResult(ParseFn))
import Day4.Common (parseRange)
import Data.Attoparsec.ByteString.Char8 hiding (parse)
import Data.IntSet qualified as S

parseLine :: Parser Int
parseLine = do
  r1 <- parseRange
  _ <- char ','
  r2 <- parseRange
  let isRedundant = r1 `S.isSubsetOf` r2 || r2 `S.isSubsetOf` r1

  pure $ if isRedundant then 1 else 0

solve :: ParseResult -> Int
solve (ParseFn parse) = either (const 0) sum (parse parseLine)
solve _ = error "invalid parse result received"
