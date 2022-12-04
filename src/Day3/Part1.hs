module Day3.Part1 (run, solve) where

import  Data.ByteString (ByteString)
import Numeric.Natural (Natural)
import Day3.Common
  ( RuckSack(..)
  , prioritize
  , parse
  )

solve :: [RuckSack] -> Natural
solve = sum . prioritize

run :: ByteString -> Natural
run = solve . parse
