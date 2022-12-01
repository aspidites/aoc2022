module Day1.Part2 (run) where

import Data.List (sortOn)
import Data.Ord (Down(..))
import Day1 (Runner, Solver, mkRun)

solveFor :: Int -> Solver
solveFor n = sum . take n . sortOn Down . fmap sum

solve :: Solver
solve = solveFor 3

run :: Runner
run = mkRun solve
