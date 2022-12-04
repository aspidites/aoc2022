module Day1.Part2 (run) where

import Data.List (sortOn)
import Data.Ord (Down(..))
import Common (Runner)
import Day1.Common (Solver, mkRun)

solveFor :: Int -> Solver
solveFor n = sum . take n . sortOn Down . fmap sum

solve :: Solver
solve = solveFor 3

run :: Runner
run = mkRun solve
