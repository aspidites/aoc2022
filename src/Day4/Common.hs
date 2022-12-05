module Day4.Common where

import Data.Either (fromRight)
import Data.Attoparsec.ByteString.Char8
import Data.ByteString (ByteString)
import Data.IntSet (IntSet)
import Data.IntSet qualified as S

data Section = Section 
  { first :: IntSet
  , second :: IntSet
  } deriving (Eq, Ord, Show)

parseRange :: Parser IntSet
parseRange = do
  a1 <- read <$> many1 digit
  _ <- char '-'
  a2 <- read <$> many1 digit
  pure . S.fromAscList $ [a1..a2]

parseSection :: Parser Section
parseSection = Section <$> parseRange <*> (char ',' *> parseRange)

parse :: ByteString -> [Section]
parse = fromRight [] . parseOnly (parseSection `sepBy1` endOfLine)
