{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveFunctor #-}
module Common where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)

data Solution a = Solution
  { part_1 :: !a
  , part_2 :: !a 
  } deriving (Eq, Ord, Show, Generic, FromJSON, ToJSON, Functor)
