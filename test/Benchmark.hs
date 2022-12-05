import Test.Tasty.Bench

import Data.Functor ((<&>))
import Run (run, runAllParts)
import Data.ByteString qualified as B

inputPaths :: [FilePath]
inputPaths = 
  [ "inputs/01.txt"
  , "inputs/02.txt"
  , "inputs/03.txt"
  , "inputs/04.txt"
  ]


main :: IO ()
main = do
  inputs <- zip [1..] <$> mapM B.readFile inputPaths

  defaultMain $ inputs <&> \(day, input) ->
    bgroup ("day " <> show day)
      [ bench "part 1" $ nfIO $
          run input day 1
      , bench "part 2" $ nfIO $
          run input day 2
      , bench "whole day" $ nfIO $
          runAllParts input day False
      ]
