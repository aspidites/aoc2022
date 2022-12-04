{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveFunctor #-}
module Common where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)

data Solution a = Solution
  { part_1 :: Maybe a
  , part_2 :: Maybe a 
  } deriving (Eq, Ord, Show, Generic, FromJSON, ToJSON, Functor)

data Exercise a = Exercise
  { ex1 :: a
  , ex2 :: a 
  } deriving (Eq, Ord, Show, Generic, FromJSON, ToJSON, Functor)
