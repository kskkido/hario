module Models.ActorMap.Game
  ( tick
  ) where

import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Types as Types

tick :: Types.ActorMap -> Types.ActorMap
tick = fmap Actor.tick

