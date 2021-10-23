module Models.ActorMap.Lib
  ( filterByObject
  ) where

import qualified Data.Map
import qualified Models.GameObject.Main as GameObject
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Types as Types

filterByObject :: (GameObject.GameObject -> Bool) -> Types.ActorMap -> Types.ActorMap
filterByObject fn = Data.Map.filter (fn . Actor.object)
