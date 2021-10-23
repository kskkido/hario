module Models.Area.Types
  ( Area(..)
  ) where

data Area =
    Aboveground
  | Underground
    deriving (Eq, Show)
