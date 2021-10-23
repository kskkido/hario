module Models.Solid.Types
  ( Solid(..)
  ) where

import qualified Linear
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Boundary.Main as Boundary
import qualified Models.Velocity.Main as Velocity

data Solid = Solid
  { mass         :: Float
  , friction     :: Float
  , boundary     :: Boundary.Boundary
  , velocity     :: Velocity.Velocity
  , acceleration :: Acceleration.Acceleration
  }
    deriving (Eq, Show)
