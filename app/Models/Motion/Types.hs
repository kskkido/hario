module Models.Motion.Types
  ( Motion(..)
  ) where

import qualified Models.Velocity.Main as Velocity
import qualified Models.Acceleration.Main as Acceleration

data Motion = Motion
  { velocity :: Velocity.Velocity
  , acceleration :: Acceleration.Acceleration
  }
  deriving (Eq, Show)
