module Models.GameResource.From
  ( fromConfig
  ) where

import qualified SDL
import qualified Linear
import qualified Assets.Image.Main as Image
import qualified Assets.ImageResource.Main as ImageResource
import qualified Configs.App.Main as Config
import qualified Models.Level.Main as Level
import qualified Models.LevelTilemap.Main as LevelTilemap
import qualified Models.GameResource.Types as Types

fromConfig :: Config.Config -> IO Types.GameResource
fromConfig config = do
  SDL.initialize [SDL.InitVideo]
  window <- SDL.createWindow (Config.windowTitle config) SDL.defaultWindow
    { SDL.windowInitialSize = Linear.V2 (Config.windowWidth config) (Config.windowHeight config)
    , SDL.windowBorder = (Config.windowBorder config)
    }
  SDL.showWindow window
  imageResources <- ImageResource.fromImages Image.types config
  levelTilemap   <- LevelTilemap.fromConfig config
  return $ Types.GameResource
    { Types.window         = window
    , Types.imageResources = imageResources
    , Types.levelTilemap   = levelTilemap
    }

