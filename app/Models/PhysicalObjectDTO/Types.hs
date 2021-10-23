module Models.PhysicalObjectDTO.Types
  ( PhysicalObjectDTO(..)
  ) where

import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Boundary.Main as Boundary
import qualified Models.Velocity.Main as Velocity

data PhysicalObjectDTO = PhysicalObjectDTO
  { boundary :: Boundary.Boundary
  , velocity :: Velocity.Velocity
  , acceleration :: Acceleration.Acceleration
  } deriving (Eq, Show)
