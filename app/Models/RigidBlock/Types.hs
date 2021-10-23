module Models.RigidBlock.Types
  ( RigidBlock(..)
  ) where

import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension

data RigidBlock = RigidBlock
  { position :: Position.Position
  , dimension :: Dimension.Dimension
  }
  deriving (Eq, Show)

