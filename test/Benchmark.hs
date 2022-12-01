import Test.Tasty.Bench

import Run (run, runAllParts)

day1Input :: FilePath
day1Input = "inputs/01.txt"

main :: IO ()
main = defaultMain
  [ bgroup "day 1"
    [ bench "part 1" $ nfIO $ 
        run day1Input 1 1
    , bench "part 2" $ nfIO $ 
        run day1Input 1 2
    , bench "whole day" $ nfIO $ 
        runAllParts day1Input 1
    ]
  ]
