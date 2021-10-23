module Models.LevelScene.Types
  ( LevelScene(..)
  ) where

import qualified Models.Level.Main as Level
import qualified Models.GameField.Main as GameField
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.ActorMap.Main as ActorMap

data LevelScene = LevelScene
  { level  :: Level.Level
  , score  :: Integer
  , timer  :: Integer
  , field  :: GameField.GameField
  , camera :: GameCamera.GameCamera
  } deriving (Eq, Show)
