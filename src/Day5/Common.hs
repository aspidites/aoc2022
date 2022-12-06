{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE OverloadedStrings #-}
module Day5.Common where

import Data.Either (fromRight)
import Data.List (transpose)
import Control.Applicative ((<|>))
import Data.Attoparsec.ByteString (Parser)
import Data.Attoparsec.ByteString.Char8 qualified as A
import Data.ByteString (ByteString)
import Data.Aeson (ToJSON)
import GHC.Generics

data Instructions = Instructions [Stack] [Move]
  deriving (Eq, Ord, Show, Generic)

newtype Crate = Crate 
  { item :: Char } 
  deriving (Eq, Ord, Show, Generic)

data Stack = Stack 
  { header :: Int 
  , crates :: [Crate] 
  } deriving (Eq, Ord, Show, Generic)

data Move = Move
  { quantity :: Int
  , from :: Int 
  , to :: Int 
  } deriving (Eq, Ord, Show, Generic, ToJSON)

emptyInstructions :: Instructions
emptyInstructions = Instructions [] []

lexeme :: Parser a -> Parser a
lexeme p = A.skipWhile A.isSpace *> p <* A.skipWhile A.isSpace

parseInt :: Parser Int
parseInt = read <$> A.many1 A.digit

parseStackHeader :: Parser Stack
parseStackHeader = do
  A.skipSpace
  header <- parseInt
  pure $ Stack header []

parseStackHeaders :: Parser [Stack]
parseStackHeaders = parseStackHeader `A.sepBy` " "

parseCrateMissing :: Parser Crate
parseCrateMissing = do
  _ <- A.string "   "
  pure $ Crate '\0'

parseCrateExists :: Parser Crate
parseCrateExists = do
  _ <- A.char '['
  c <- A.anyChar
  _ <- A.char ']'
  pure $ Crate c

parseCrate :: Parser Crate
parseCrate = (parseCrateMissing <|> parseCrateExists) <* A.option ' ' (A.char ' ')

parseCrateLine :: Parser [Crate]
parseCrateLine = A.many1 parseCrate 

parseCrates :: Parser [[Crate]]
parseCrates = parseCrateLine `A.sepBy` "\n"

parseMove :: Parser Move
parseMove = do
  q <- lexeme (A.string "move") *> parseInt
  f <- lexeme (A.string "from") *> parseInt
  t <- lexeme (A.string "to") *> parseInt
  pure $ Move q f t

parseMoves :: Parser [Move]
parseMoves = parseMove `A.sepBy` "\n"

parseFile :: Parser Instructions
parseFile = do
  cs <- transpose <$> parseCrates
  A.skipSpace
  headers <- A.skipSpace *> parseStackHeaders
  let stacks = zipWith (\h c -> h { crates = filter crateFull c}) headers cs
  Instructions stacks <$> parseMoves

crateFull :: Crate -> Bool
crateFull (Crate x) = x /= '\0'

interpretInstructions :: ([Crate] -> [Crate]) -> Instructions -> [Stack]
interpretInstructions fn (Instructions s m) = interpretMoves fn m s

interpretMoves :: ([Crate] -> [Crate]) -> [Move] -> [Stack] -> [Stack]
interpretMoves _ [] [] = []
interpretMoves _ [] ss = ss
interpretMoves fn (Move q f t : rs) ss = interpretMoves fn rs ss'
  where
    toStack = ss !! (t - 1)
    fromStack = ss !! (f - 1)
    (movedCrates, fromCrates) = splitAt q (crates fromStack)
    newFromStack = fromStack { crates = fromCrates }
    newToStack = toStack { crates = fn movedCrates <> crates toStack}
    ss' = foldr go [] ss
    go :: Stack -> [Stack] -> [Stack]
    go current@(Stack h _) result
      | h == f = newFromStack : result
      | h == t = newToStack : result
      | otherwise = current : result
    
parse :: ByteString -> Instructions
parse = fromRight emptyInstructions . A.parseOnly parseFile
