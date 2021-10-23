module Models.LevelScene.Lib
  ( modifyCamera
  , modifyField
  , modifyObject
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameField.Main as GameField
import qualified Models.LevelScene.Types as Types

modifyCamera :: (GameCamera.GameCamera -> GameCamera.GameCamera) -> Types.LevelScene -> Types.LevelScene
modifyCamera fn x = x { Types.camera = fn $ Types.camera x }

modifyField :: (GameField.GameField -> GameField.GameField) -> Types.LevelScene -> Types.LevelScene
modifyField fn x = x { Types.field = fn $ Types.field x }

modifyObject :: (ActorMap.ActorMap -> ActorMap.ActorMap) -> Types.LevelScene -> Types.LevelScene
modifyObject fn  = modifyField (GameField.modifyObject fn)
