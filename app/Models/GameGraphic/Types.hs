module Models.GameGraphic.Types
  ( GameGraphic(..)
  ) where

import qualified Linear
import qualified Assets.Image.Main as Image
import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position
import qualified Models.GameGraphicLayer.Main as GameGraphicLayer

data GameGraphic = GameGraphic
  { layer :: GameGraphicLayer.GameGraphicLayer
  , image :: Image.Image
  , position :: Position.Position
  , dimension :: Dimension.Dimension
  } deriving (Eq, Show)

instance Ord GameGraphic where
  compare x y = layer x `compare` layer y
