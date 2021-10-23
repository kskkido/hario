module Models.GameEvent.Types
  ( GameEvent(..)
  ) where

import qualified Models.CollisionEvent.Main as CollisionEvent

data GameEvent =
    UpdatePosition
  | UpdateMotion
  | UpdateAction
  | CollisionEvent CollisionEvent.CollisionEvent
    deriving (Eq, Show)
