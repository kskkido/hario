module Models.Actor.To
  ( toPhysicalEntity
  , toGameEntity
  ) where

import qualified Data.Maybe
import qualified Models.PhysicalEntity.Main as PhysicalEntity
import qualified Models.GameEntity.Main as GameEntity
import qualified Models.GameObject.Main as GameObject
import qualified Models.Actor.Types as Types

toPhysicalEntity :: Types.Actor -> Data.Maybe.Maybe PhysicalEntity.PhysicalEntity
toPhysicalEntity actor = do
  object <- GameObject.toPhysicalObject $ Types.object actor
  return $ PhysicalEntity.PhysicalEntity
    { PhysicalEntity.uuid   = Types.uuid actor
    , PhysicalEntity.object = object
    }

toGameEntity :: Types.Actor -> GameEntity.GameEntity
toGameEntity = GameObject.toGameEntity . Types.object
