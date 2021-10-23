module Models.Pole.Types
  ( Pole(..)
  , Variant(..)
  ) where

import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension

data Pole = Pole
  { position :: Position.Position
  , dimension :: Dimension.Dimension
  , variant :: Variant
  }
  deriving (Eq, Show)

data Variant =
    Tip
  | Bar
  deriving (Eq, Show)

