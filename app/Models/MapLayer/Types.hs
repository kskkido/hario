module Models.MapLayer.Types
  ( MapLayer(..)
  ) where

data MapLayer =
    Background
  | Object
    deriving (Eq, Show)
