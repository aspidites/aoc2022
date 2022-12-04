module Day1.Part1 (run) where

import Common (Runner)
import Day1.Common (Solver, mkRun)

solve :: Solver
solve = maximum . fmap sum

run :: Runner
run = mkRun solve
