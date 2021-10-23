{-# LANGUAGE BlockArguments #-}

module Models.ActorMap.From
  ( fromActors
  , fromPhysicalEntityMap
  ) where

import qualified Data.Map
import qualified Control.Monad
import qualified Models.PhysicalEntityMap.Main as PhysicalEntityMap
import qualified Models.CollisionEvent.Main as CollisionEvent
import qualified Models.GameEvent.Main as GameEvent
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Types as Types

fromActors :: [Actor.Actor] -> Types.ActorMap
fromActors = foldr (Actor.uuid >>= Data.Map.insert) Data.Map.empty

fromPhysicalEntityMap :: PhysicalEntityMap.PhysicalEntityMap -> Types.ActorMap -> Types.ActorMap
fromPhysicalEntityMap entityMap actorMap = Data.Map.foldrWithKey step actorMap entityMap
  where step k v acc = maybe acc id $ do
          entity <- Data.Map.lookup k entityMap
          actor  <- Data.Map.lookup k actorMap
          return $ Data.Map.insert k (Actor.fromPhysicalEntity entity actor) acc

fromEvent :: GameEvent.GameEvent -> Types.ActorMap -> Types.ActorMap
fromEvent (GameEvent.CollisionEvent event) actorMap = maybe actorMap id $ do
  from      <- Data.Map.lookup (CollisionEvent.from event) actorMap
  into      <- Data.Map.lookup (CollisionEvent.into event) actorMap
  Control.Monad.guard (from /= into)
  return actorMap
fromEvent _     actorMap = actorMap
