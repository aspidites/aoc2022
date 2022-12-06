module Day5.Part2 where

import Day5.Common 
  ( Instructions(..)
  , Stack(..)
  , Crate(..)
  , interpretInstructions
  )

solve :: Instructions -> String
solve = concatMap (map item . take 1 . crates) . interpretInstructions id
