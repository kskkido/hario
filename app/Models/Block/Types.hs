module Models.Block.Types
  ( Block(..)
  ) where

import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position

data Block = Block
  { position :: Position.Position
  , dimension :: Dimension.Dimension
  }
  deriving (Eq, Show)
