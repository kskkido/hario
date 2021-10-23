{-# LANGUAGE BlockArguments #-}

module Models.PhysicalEntity.To
  ( toUUID
  , toObject
  , toBoundary
  , toPosition
  , toVelocity
  , toFriction
  , toMovingEntity
  , toMovingObject
  , toCollidableEntity
  , toCollidableObject
  , toCollision
  , toPhysicalObjectDTO
  ) where

import qualified Data.UUID
import qualified Data.Maybe
import qualified Control.Monad
import qualified Models.Contact.Main as Contact
import qualified Models.Collision.Main as Collision
import qualified Models.Direction.Main as Direction
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Friction.Main as Friction
import qualified Models.Velocity.Main as Velocity
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.PhysicalObjectDTO.Main as PhysicalObjectDTO
import qualified Models.PhysicalEntity.Types as Types

toUUID :: Types.PhysicalEntity -> Data.UUID.UUID
toUUID = Types.uuid

toObject :: Types.PhysicalEntity -> PhysicalObject.PhysicalObject
toObject = Types.object

toPosition :: Types.PhysicalEntity -> Position.Position
toPosition = PhysicalObject.toPosition . toObject

toBoundary :: Types.PhysicalEntity -> Boundary.Boundary
toBoundary = PhysicalObject.toBoundary . toObject

toVelocity :: Types.PhysicalEntity -> Position.Position
toVelocity = PhysicalObject.toVelocity . toObject

toMovingEntity :: Types.PhysicalEntity -> Data.Maybe.Maybe Types.PhysicalEntity
toMovingEntity x = (\object -> x { Types.object = object }) <$> toMovingObject x

toMovingObject :: Types.PhysicalEntity -> Data.Maybe.Maybe PhysicalObject.PhysicalObject
toMovingObject = PhysicalObject.toMovingObject . toObject

toCollidableEntity :: Types.PhysicalEntity -> Data.Maybe.Maybe Types.PhysicalEntity
toCollidableEntity x = (\object -> x { Types.object = object }) <$> toCollidableObject x

toCollidableObject :: Types.PhysicalEntity -> Data.Maybe.Maybe PhysicalObject.PhysicalObject
toCollidableObject = PhysicalObject.toCollidableObject . toObject

toCollision :: Types.PhysicalEntity -> Types.PhysicalEntity -> Data.Maybe.Maybe Collision.Collision
toCollision x y = do
  collidableX <- toCollidableEntity x
  collidableY <- toCollidableEntity y
  Control.Monad.guard (toUUID collidableX /= toUUID collidableY)
  Control.Monad.guard (toBoundary collidableX `Boundary.collides` toBoundary collidableY)
  return $ Collision.Collision
    { Collision.contactX = Contact.Contact
      { Contact.uuid      = toUUID collidableX
      , Contact.direction = maybe Direction.Down id $ Direction.fromPositions (toPosition collidableY) (toPosition collidableX)
      }
    , Collision.contactY = Contact.Contact
      { Contact.uuid      = toUUID collidableY
      , Contact.direction = maybe Direction.Up id $ Direction.fromPositions (toPosition collidableX) (toPosition collidableY)
      }
    }

toPhysicalObjectDTO :: Types.PhysicalEntity -> PhysicalObjectDTO.PhysicalObjectDTO
toPhysicalObjectDTO = PhysicalObject.toPhysicalObjectDTO . Types.object

toFriction :: Types.PhysicalEntity -> Types.PhysicalEntity -> Friction.Friction
toFriction x y = maybe Friction.unit id $ do
  direction <- Boundary.toDirection (toBoundary y) (toBoundary x)
  Control.Monad.guard (direction == Direction.Down)
  friction  <- return $ Friction.fromVelocity (0.25) (toVelocity x)
  return $ Friction.toFrictionX friction

