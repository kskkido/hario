module Models.PhysicalObject.To
  ( toBoundary
  , toVelocity
  , toPosition
  , toAcceleration
  , toMovingObject
  , toCollidableObject
  , toPhysicalObjectDTO
  ) where

import Control.Lens
import qualified Linear
import qualified Data.UUID
import qualified Data.Maybe
import qualified Control.Monad
import qualified Models.Ghost.Main as Ghost
import qualified Models.Solid.Main as Solid
import qualified Models.Static.Main as Static
import qualified Models.Contact.Main as Contact
import qualified Models.Collision.Main as Collision
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Direction.Main as Direction
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.PhysicalObjectDTO.Main as PhysicalObjectDTO
import qualified Models.PhysicalObject.Types as Types

toBoundary :: Types.PhysicalObject -> Boundary.Boundary
toBoundary (Types.Solid x)  = Solid.boundary x
toBoundary (Types.Ghost x)  = Ghost.boundary x
toBoundary (Types.Static x) = Static.boundary x

toPosition :: Types.PhysicalObject -> Position.Position
toPosition = Boundary.position . toBoundary

toVelocity :: Types.PhysicalObject -> Velocity.Velocity
toVelocity (Types.Solid x)  = Solid.velocity x
toVelocity (Types.Ghost x)  = Ghost.velocity x
toVelocity (Types.Static x) = Static.velocity x

toAcceleration :: Types.PhysicalObject -> Acceleration.Acceleration
toAcceleration (Types.Solid x)  = Solid.acceleration x
toAcceleration (Types.Ghost x)  = Ghost.acceleration x
toAcceleration (Types.Static x) = Static.acceleration x

toMovingObject :: Types.PhysicalObject -> Data.Maybe.Maybe Types.PhysicalObject
toMovingObject x = do
  Control.Monad.guard (toVelocity x /= Linear.V2 0 0 && toAcceleration x /= Linear.V2 0 0)
  return x

toCollidableObject :: Types.PhysicalObject -> Data.Maybe.Maybe Types.PhysicalObject
toCollidableObject object@(Types.Solid x)  = return object
toCollidableObject object@(Types.Static x) = return object
toCollidableObject _                       = Data.Maybe.Nothing

toPhysicalObjectDTO :: Types.PhysicalObject -> PhysicalObjectDTO.PhysicalObjectDTO
toPhysicalObjectDTO x = PhysicalObjectDTO.PhysicalObjectDTO
  { PhysicalObjectDTO.boundary     = toBoundary x
  , PhysicalObjectDTO.velocity     = toVelocity x
  , PhysicalObjectDTO.acceleration = toAcceleration x
  }
