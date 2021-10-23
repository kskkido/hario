module Models.ActorMap.Types
  ( ActorMap
  ) where

import qualified Data.Map
import qualified Data.UUID
import qualified Models.Actor.Main as Actor

type ActorMap = Data.Map.Map Data.UUID.UUID Actor.Actor
