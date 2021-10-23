module Models.GameScene.Types
  ( GameScene(..)
  ) where

import qualified Models.LevelScene.Main as LevelScene

data GameScene =
    LevelScene LevelScene.LevelScene
  deriving (Eq, Show)


