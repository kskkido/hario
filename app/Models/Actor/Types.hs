module Models.Actor.Types
  ( Actor(..)
  ) where

import qualified Data.UUID
import qualified Models.GameObject.Main as GameObject

data Actor = Actor
  { uuid   :: Data.UUID.UUID
  , object :: GameObject.GameObject
  } deriving (Eq, Show)
