module Models.Static.Types
  ( Static(..)
  ) where

import qualified Linear
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Boundary.Main as Boundary
import qualified Models.Velocity.Main as Velocity

data Static = Static
  { mass         :: Float
  , friction     :: Float
  , boundary     :: Boundary.Boundary
  , velocity     :: Velocity.Velocity
  , acceleration :: Acceleration.Acceleration
  }
    deriving (Eq, Show)
