module Models.LevelTilemap.To
  ( toTilemap
  ) where

import qualified Assets.Tilemap.Main as Tilemap
import qualified Models.Level.Main as Level
import qualified Models.LevelTilemap.Types as Types

toTilemap :: Level.Level -> Types.LevelTilemap -> Tilemap.Tilemap
toTilemap Level.World1Stage1Aboveground = Types.world1Stage1Aboveground
toTilemap Level.World1Stage1Underground = Types.world1Stage1Underground
