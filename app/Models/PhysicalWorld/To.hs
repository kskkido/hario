module Models.PhysicalWorld.To
  ( toCollisions
  , toEvents
  ) where

import qualified Models.Collision.Main as Collision
import qualified Models.CollisionEvent.Main as CollisionEvent
import qualified Models.PhysicalEvent.Main as PhysicalEvent
import qualified Models.PhysicalEntityMap.Main as PhysicalEntityMap
import qualified Models.PhysicalWorld.Types as Types

toCollisions :: Types.PhysicalWorld -> [Collision.Collision]
toCollisions = PhysicalEntityMap.toCollisions . Types.entityMap

toEvents :: Types.PhysicalWorld -> [PhysicalEvent.PhysicalEvent]
toEvents = fmap (PhysicalEvent.CollisionEvent . CollisionEvent.fromCollision) . toCollisions
