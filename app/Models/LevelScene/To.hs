module Models.LevelScene.To
  ( toActorMap
  , toPhysicalWorld
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameField.Main as GameField
import qualified Models.LevelScene.Types as Types

toActorMap :: Types.LevelScene -> ActorMap.ActorMap
toActorMap = GameField.toActorMap . Types.field

toObjectLayer :: Types.LevelScene -> ActorMap.ActorMap
toObjectLayer = GameField.object . Types.field

toPhysicalWorld :: Types.LevelScene -> PhysicalWorld.PhysicalWorld
toPhysicalWorld scene = PhysicalWorld.PhysicalWorld
  { PhysicalWorld.entityMap = ActorMap.toPhysicalEntityMap $ toObjectLayer scene
  }
