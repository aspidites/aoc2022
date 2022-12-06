module Main where

import Test.Tasty
import Test.Tasty.HUnit
import Data.Functor ((<&>))
import Data.ByteString qualified as B
import Data.ByteString.Char8 qualified as B
import Run (runAllParts)

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
  outputs <- mapM (\name -> B.readFile $ "outputs/" <> name <> ".txt") exerciseNames
  let params = zip3 [1..] inputs outputs

  defaultMain $
    testGroup "Validate Answers" $ 
      params <&> \(day, input, output) -> 
        testCase (show day <> " solves correctly") $ do
          result <- runAllParts input day True
          result @?= B.strip output
