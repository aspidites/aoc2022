module Day1.Part1 (run, solve) where

import Day1 (Solver, Runner, mkRun)

solve :: Solver
solve = maximum . fmap sum

run :: Runner
run = mkRun solve
