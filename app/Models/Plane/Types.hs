module Models.Plane.Types
  ( Plane(..)
  ) where

data Plane =
    Vertical
  | Horizontal
    deriving (Eq, Show)
