module Models.GroundBlock.Types
  ( GroundBlock(..)
  ) where

import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension

data GroundBlock = GroundBlock
  { position :: Position.Position
  , dimension :: Dimension.Dimension
  }
  deriving (Eq, Show)

