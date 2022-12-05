module Day4.Part1 where

import Common (ParseResult(ParseFn))
import Data.IntSet qualified as S

solve :: ParseResult -> Int
solve (ParseFn parse) = parse $ \r1 r2 -> r1 `S.isSubsetOf` r2 || r2 `S.isSubsetOf` r1
solve _ = error "invalid parse result received"
