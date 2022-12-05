{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveFunctor #-}

module Common where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics (Generic)
import Data.ByteString (ByteString)
import Data.Attoparsec.ByteString.Char8 (Parser)
import Data.Set (Set)

newtype Elf = Elf { calories :: [Int] }
data RuckSack = RuckSack 
  { team :: [Char]
  , first :: Set Char
  , second :: Set Char
  }
  deriving (Eq, Ord, Show)

data Them = A | B | C
  deriving (Eq, Ord, Read, Show)

data Round = Round Them Us
  deriving (Eq, Ord, Read, Show)

data Us = X | Y | Z
  deriving (Eq, Ord, Read, Show)

data Output a = Output
  { part_1 :: a
  , part_2 :: a 
  } deriving (Eq, Ord, Show, Generic, FromJSON, ToJSON, Functor)

data ParseResult 
  = ParseRounds [Round]
  | ParseElves [Elf]
  | ParseRucks [RuckSack]
  | ParseFn  (Parser Int -> Either String [Int]) 

data Solution = Solution
  { parser :: ByteString -> ParseResult
  , solve_1 :: ParseResult -> Int
  , solve_2 :: ParseResult -> Int
  }
