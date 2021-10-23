module Models.Ghost.To
  ( toForce
  , toMomentum
  , toPosition
  ) where

import qualified Models.Boundary.Main as Boundary
import qualified Models.Momentum.Main as Momentum
import qualified Models.Position.Main as Position
import qualified Models.Force.Main as Force
import qualified Models.Ghost.Types as Types

toForce :: Types.Ghost -> Force.Force
toForce x = (* Types.mass x) <$> Types.acceleration x

toMomentum :: Types.Ghost -> Force.Force
toMomentum x = (* Types.mass x) <$> Types.velocity x

toPosition :: Types.Ghost -> Position.Position
toPosition = Boundary.position . Types.boundary
