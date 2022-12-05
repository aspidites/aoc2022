module Day4.Part2 where

import Common (ParseResult(ParseFn))
import Data.IntSet qualified as S

solve :: ParseResult -> Int
solve (ParseFn parse) = parse $ \r1 r2 -> not $ r1 `S.disjoint` r2
solve _ = error "invalid parse result received"
