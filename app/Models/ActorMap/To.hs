module Models.ActorMap.To
  ( toActors
  , toObjects
  , toGraphics
  , toPhysicalEntityMap
  ) where

import qualified Data.Map
import qualified Data.List
import qualified Models.Boundary.Main as Boundary
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.PhysicalEntityMap.Main as PhysicalEntityMap
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Types as Types

toActors :: Types.ActorMap -> [Actor.Actor]
toActors = fmap snd . Data.Map.toList

toObjects :: Types.ActorMap -> [GameObject.GameObject]
toObjects = fmap Actor.object . toActors

toGraphics :: Types.ActorMap -> [GameGraphic.GameGraphic]
toGraphics = Data.List.sort . fmap GameObject.toGraphic . toObjects

toBoundaries :: Types.ActorMap -> [Boundary.Boundary]
toBoundaries = fmap GameObject.toBoundary . toObjects

toPhysicalEntityMap :: Types.ActorMap -> PhysicalEntityMap.PhysicalEntityMap
toPhysicalEntityMap = Data.Map.foldrWithKey step Data.Map.empty
  where step k v acc = maybe acc (flip (Data.Map.insert k) acc) (Actor.toPhysicalEntity v)
