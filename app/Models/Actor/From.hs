module Models.Actor.From
  ( fromObject
  , fromPhysicalEntity
  ) where

import qualified Data.UUID
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.PhysicalEntity.Main as PhysicalEntity
import qualified Models.GameObject.Main as GameObject
import qualified Models.Actor.Types as Types

fromObject :: GameObject.GameObject -> Data.UUID.UUID -> Types.Actor
fromObject object uuid = Types.Actor { Types.uuid = uuid, Types.object = object }

fromPhysicalEntity :: PhysicalEntity.PhysicalEntity -> Types.Actor -> Types.Actor
fromPhysicalEntity entity actor = actor
  { Types.object = GameObject.fromPhysicalObjectDTO
      (PhysicalEntity.toPhysicalObjectDTO entity)
      (Types.object actor)
  }

