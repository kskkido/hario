module Models.Solid.To
  ( toForce
  , toMomentum
  , toPosition
  ) where

import qualified Models.Boundary.Main as Boundary
import qualified Models.Momentum.Main as Momentum
import qualified Models.Position.Main as Position
import qualified Models.Force.Main as Force
import qualified Models.Solid.Types as Types

toForce :: Types.Solid -> Force.Force
toForce x = (* Types.mass x) <$> Types.acceleration x

toMomentum :: Types.Solid -> Force.Force
toMomentum x = (* Types.mass x) <$> Types.velocity x

toPosition :: Types.Solid -> Position.Position
toPosition = Boundary.position . Types.boundary
