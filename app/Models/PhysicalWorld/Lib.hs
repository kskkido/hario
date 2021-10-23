module Models.PhysicalWorld.Lib
  ( modifyEntityMap
  , modifyEntities
  , simulate
  ) where

import qualified Data.Map
import qualified Data.UUID
import qualified Models.PhysicalEntity.Main as PhysicalEntity
import qualified Models.PhysicalEntityMap.Main as PhysicalEntityMap
import qualified Models.PhysicalWorld.To as To
import qualified Models.PhysicalWorld.Types as Types

modifyEntityMap :: (PhysicalEntityMap.PhysicalEntityMap -> PhysicalEntityMap.PhysicalEntityMap) -> Types.PhysicalWorld -> Types.PhysicalWorld
modifyEntityMap fn world = world { Types.entityMap = fn $ Types.entityMap world }

modifyEntities :: (PhysicalEntity.PhysicalEntity -> PhysicalEntity.PhysicalEntity) -> Types.PhysicalWorld -> Types.PhysicalWorld
modifyEntities fn = modifyEntityMap (Data.Map.map fn)

simulate :: Types.PhysicalWorld -> Types.PhysicalWorld
simulate = do
  entities <- PhysicalEntityMap.toCollidableEntities <$> Types.entityMap
  entities <- return $ PhysicalEntity.move <$> entities
  modifyEntityMap (PhysicalEntityMap.resolveCollisions . PhysicalEntityMap.insert entities)
