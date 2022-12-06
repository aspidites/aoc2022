import Test.Tasty.Bench

import Data.Functor ((<&>))
import Run (run, runAllParts)
import Data.ByteString qualified as B

exerciseNames :: [String]
exerciseNames = 
  [ "01"
  , "02"
  , "03"
  , "04"
  , "05"
  , "06"
  ]


main :: IO ()
main = do
  inputs <- mapM (\name -> B.readFile $ "inputs/" <> name <> ".txt") exerciseNames
  let params = zip [1..] inputs

  defaultMain $ params <&> \(day, input) ->
    bgroup ("day " <> show day)
      [ bench "part 1" $ nfIO $
          run input day 1
      , bench "part 2" $ nfIO $
          run input day 2
      , bench "whole day" $ nfIO $
          runAllParts input day False
      ]
