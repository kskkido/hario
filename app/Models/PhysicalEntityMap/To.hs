module Models.PhysicalEntityMap.To
  ( toObjects
  , toMovingEntities
  , toMovingEntityMap
  , toCollidableEntities
  , toCollidableEntityMap
  , toCollisions
  , toCollisionEvents
  ) where

import qualified Data.Map
import qualified Data.Maybe
import qualified Models.Contact.Main as Contact
import qualified Models.Collision.Main as Collision
import qualified Models.CollisionEvent.Main as CollisionEvent
import qualified Models.Position.Main as Position
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.PhysicalEntity.Main as PhysicalEntity
import qualified Models.PhysicalEntityMap.Types as Types

toEntities :: Types.PhysicalEntityMap -> [PhysicalEntity.PhysicalEntity]
toEntities = fmap snd . Data.Map.toList

toObjects :: Types.PhysicalEntityMap -> [PhysicalObject.PhysicalObject]
toObjects = fmap PhysicalEntity.toObject . toEntities

toCollidableEntityMap :: Types.PhysicalEntityMap -> Types.PhysicalEntityMap
toCollidableEntityMap = Data.Map.filter (Data.Maybe.isJust . PhysicalEntity.toCollidableEntity)

toCollidableEntities :: Types.PhysicalEntityMap -> [PhysicalEntity.PhysicalEntity]
toCollidableEntities = toEntities . toCollidableEntityMap

toMovingEntityMap :: Types.PhysicalEntityMap -> Types.PhysicalEntityMap
toMovingEntityMap = Data.Map.filter (Data.Maybe.isJust . PhysicalEntity.toMovingEntity)

toMovingEntities :: Types.PhysicalEntityMap -> [PhysicalEntity.PhysicalEntity]
toMovingEntities = toEntities . toMovingEntityMap

toCollisions :: Types.PhysicalEntityMap -> [Collision.Collision]
toCollisions = do
  collidableEntities <- toCollidableEntities
  movingEntities     <- toMovingEntities
  tuples             <- return $ movingEntities >>= (flip zip collidableEntities . repeat)
  return $ Data.Maybe.catMaybes $ uncurry PhysicalEntity.toCollision <$> tuples

toCollisionEvents :: Types.PhysicalEntityMap -> [CollisionEvent.CollisionEvent]
toCollisionEvents = fmap CollisionEvent.fromCollision . toCollisions
