module Models.CollisionEvent.Types
  ( CollisionEvent(..)
  ) where

import qualified Data.UUID
import qualified Models.Direction.Main as Direction

data CollisionEvent = CollisionEvent
  { from :: Data.UUID.UUID
  , into :: Data.UUID.UUID
  , direction :: Direction.Direction
  } deriving (Eq, Show)
