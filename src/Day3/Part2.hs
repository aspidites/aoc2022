module Day3.Part2 (run, solve) where


import Day3.Common 
  ( RuckSack(..)
  , parse
  )

import Numeric.Natural (Natural)
import  Data.ByteString (ByteString)


solve :: [RuckSack] -> Natural
solve = undefined

run :: ByteString -> Natural
run = solve . parse
