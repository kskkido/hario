module Models.LevelTilemap.From
  ( fromConfig
  ) where

import qualified Configs.App.Main as Config
import qualified Models.Level.Main as Level
import qualified Models.LevelTilemap.Types as Types

fromConfig :: Config.Config -> IO Types.LevelTilemap
fromConfig config = do
  world1Stage1Aboveground <- Level.toTilemap Level.World1Stage1Aboveground config
  world1Stage1Underground <- Level.toTilemap Level.World1Stage1Underground config
  return $ Types.LevelTilemap
    { Types.world1Stage1Aboveground = world1Stage1Aboveground
    , Types.world1Stage1Underground = world1Stage1Underground
    }

