module Models.GameState.Lib
  ( modifyFrame
  , modifyCamera
  , modifyActorMap
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameState.Types as Types

modifyFrame :: (Integer -> Integer) -> Types.GameState -> Types.GameState
modifyFrame fn x = x { Types.frame = fn $ Types.frame x }

modifyCamera :: (GameCamera.GameCamera -> GameCamera.GameCamera) -> Types.GameState -> Types.GameState
modifyCamera fn x = x { Types.camera = fn $ Types.camera x }

modifyActorMap :: (ActorMap.ActorMap -> ActorMap.ActorMap) -> Types.GameState -> Types.GameState
modifyActorMap fn x = x { Types.actorMap = fn $ Types.actorMap x }
