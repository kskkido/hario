module Models.PipeBlock.Types
  ( PipeBlock(..)
  , Variant(..)
  ) where

import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension

data PipeBlock = PipeBlock
  { position :: Position.Position
  , dimension :: Dimension.Dimension
  , variant :: Variant
  }
  deriving (Eq, Show)

data Variant =
    Left
  | Right
  deriving (Eq, Show)
