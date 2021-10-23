module Models.Direction.Types
  ( Direction(..)
  ) where

data Direction =
    Up
  | Down
  | Left
  | Right
    deriving (Eq, Show)
