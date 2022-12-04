module Common (Runner) where

import Data.Text (Text)

type Runner = FilePath -> IO Text
