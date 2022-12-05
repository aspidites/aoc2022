{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveFunctor #-}

module Common where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Data.ByteString (ByteString)

data Output a = Output
  { part_1 :: a
  , part_2 :: a 
  } deriving (Eq, Ord, Show, Generic, FromJSON, ToJSON, Functor)

data Solution a = Solution
  { parser :: ByteString -> a
  , solve_1 :: a -> Int
  , solve_2 :: a -> Int
  }

data SomeSolution = forall a. SomeSolution (Solution a)
