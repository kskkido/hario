module Configs.App.From
  ( fromEnv
  ) where

import qualified Linear
import qualified Data.Text
import qualified Configs.App.Types as Types

fromEnv :: () -> Types.Config
fromEnv _ = Types.Config
  { Types.windowTitle = Data.Text.pack "Hario"
  , Types.windowWidth = 256
  , Types.windowHeight = 240
  , Types.windowBorder = True
  , Types.windowBackgroundColor = Linear.V4 80 128 255 1
  , Types.gameTileWidth = 16
  , Types.gameTileHeight = 16
  , Types.frameRate = 60
  , Types.filePathAssetImage = "assets/image/"
  , Types.filePathAssetTilemap = "assets/map/"
  , Types.physicsGravity = 9.8
  }

