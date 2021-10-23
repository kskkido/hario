module Models.GameEvent.From
  ( fromPhysicalEvent
  ) where

import qualified Models.PhysicalEvent.Main as PhysicalEvent
import qualified Models.GameEvent.Types as Types

fromPhysicalEvent :: PhysicalEvent.PhysicalEvent -> Types.GameEvent
fromPhysicalEvent (PhysicalEvent.CollisionEvent x) = Types.CollisionEvent x
