{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveFunctor #-}

module Common where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Data.ByteString (ByteString)

data Output a = Output
  { part_1 :: !a
  , part_2 :: !a 
  } deriving (Eq, Ord, Show, Generic, FromJSON, ToJSON, Functor)

data Solution a b = Solution
  { parser :: ByteString -> a
  , solve_1 :: a -> b
  , solve_2 :: a -> b
  }

data SomeSolution = forall a b. (ToJSON b, Show b) => SomeSolution (Solution a b)

parse = undefined
