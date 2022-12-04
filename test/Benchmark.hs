import Test.Tasty.Bench

import Run (run, runAllParts)

day1Input :: FilePath
day1Input = "inputs/01.txt"

day2Input :: FilePath
day2Input = "inputs/02.txt"

main :: IO ()
main = defaultMain
  [ bgroup "day 1"
    [ bench "part 1" $ nfIO $ 
        run day1Input 1 1 False
    , bench "part 2" $ nfIO $ 
        run day1Input 1 2 False
    , bench "whole day" $ nfIO $ 
        runAllParts day1Input 1 False
    ]
  , bgroup "day 2"
    [ bench "part 1" $ nfIO $ 
        run day2Input 2 1 False
    , bench "part 2" $ nfIO $ 
        run day2Input 2 2 False
    , bench "whole day" $ nfIO $ 
        runAllParts day2Input 2 False
    ]
  ]
