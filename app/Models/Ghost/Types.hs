module Models.Ghost.Types
  ( Ghost(..)
  ) where

import qualified Linear
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Boundary.Main as Boundary
import qualified Models.Velocity.Main as Velocity

data Ghost = Ghost
  { mass         :: Float
  , boundary     :: Boundary.Boundary
  , velocity     :: Velocity.Velocity
  , acceleration :: Acceleration.Acceleration
  }
    deriving (Eq, Show)
