module Models.GameState.To
  ( toPhysicalWorld
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameState.Types as Types

toPhysicalWorld :: Types.GameState -> PhysicalWorld.PhysicalWorld
toPhysicalWorld state = PhysicalWorld.PhysicalWorld
  { PhysicalWorld.entityMap = ActorMap.toPhysicalEntityMap $ Types.actorMap state
  }
