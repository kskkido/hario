module Models.GameCamera.Types
  ( GameCamera(..)
  ) where

import qualified Linear
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension

data GameCamera = GameCamera
  { dimension :: Dimension.Dimension
  , position :: Position.Position
  } deriving(Eq, Show)
