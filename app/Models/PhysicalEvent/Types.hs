module Models.PhysicalEvent.Types
  ( PhysicalEvent(..)
  ) where

import qualified Models.CollisionEvent.Main as CollisionEvent

data PhysicalEvent =
    CollisionEvent CollisionEvent.CollisionEvent
    deriving (Eq, Show)
