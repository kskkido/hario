module Models.GameState.Types
  ( GameState(..)
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameCamera.Main as GameCamera

data GameState = GameState
  { frame     :: Integer
  , camera    :: GameCamera.GameCamera
  , actorMap  :: ActorMap.ActorMap
  } deriving(Eq, Show)
