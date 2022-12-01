module Day1.Part1 (solve, run) where

import Data.Text (Text)
import Day1 (Solver, mkRun)

solve :: Solver
solve = maximum . fmap sum

run :: Text -> Text
run = mkRun solve
