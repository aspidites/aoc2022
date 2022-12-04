module Common where

import Data.Text (Text)

type Runner = FilePath -> IO Text
