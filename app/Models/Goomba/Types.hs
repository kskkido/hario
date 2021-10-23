module Models.Goomba.Types
  ( Goomba(..)
  , Status(..)
  ) where

import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Dimension.Main as Dimension
import qualified Models.Velocity.Main as Velocity
import qualified Models.Position.Main as Position
import qualified Models.GoombaAction.Main as GoombaAction
import qualified Models.GoombaGraphic.Main as GoombaGraphic

data Goomba = Goomba
  { status :: Status
  , acceleration :: Acceleration.Acceleration
  , velocity :: Velocity.Velocity
  , position :: Position.Position
  , dimension :: Dimension.Dimension
  , action :: GoombaAction.GoombaAction
  , graphic :: GoombaGraphic.GoombaGraphic
  }
  deriving (Eq, Show)

data Status =
    Live
  | Dead
  deriving (Eq, Show)

