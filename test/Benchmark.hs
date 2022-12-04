import Test.Tasty.Bench

import Run (run, runAllParts)
import Data.ByteString qualified as B

main :: IO ()
main = do
  day1Input <- B.readFile "inputs/01.txt"
  day2Input <- B.readFile "inputs/02.txt"
  defaultMain
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
