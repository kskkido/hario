module Models.GameField.To
  ( toHario
  , toObject
  , toActorMap
  , toPhysicalWorld
  ) where

import qualified Data.Map
import qualified Data.Maybe
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameObject.Main as GameObject
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameField.Types as Types

toHario :: Types.GameField -> Data.Maybe.Maybe Actor.Actor
toHario =
  Data.Maybe.listToMaybe .
  filter (Data.Maybe.isJust . GameObject.toHario . Actor.object) .
  ActorMap.toActors .
  Types.object

toObject :: Types.GameField -> ActorMap.ActorMap
toObject = Types.object

toActorMap :: Types.GameField -> ActorMap.ActorMap
toActorMap field = Types.background field `Data.Map.union` Types.object field

toPhysicalWorld :: Types.GameField -> PhysicalWorld.PhysicalWorld
toPhysicalWorld field = PhysicalWorld.PhysicalWorld
  { PhysicalWorld.entityMap = ActorMap.toPhysicalEntityMap $ Types.object field
  }
