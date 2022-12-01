module Day1.Part2 (run) where

import Data.List (sortOn)
import Data.Ord (Down(..))
import Data.Text (Text)
import Day1 (Solver, mkRun)

solveFor :: Int -> Solver
solveFor n = sum . take n . sortOn Down . fmap sum

solve :: Solver
solve = solveFor 3

run :: Text -> Text
run = mkRun solve
