module Models.Level.To
  ( toPath
  , toTilemap
  ) where

import qualified Configs.App.Main as Config
import qualified Assets.Tilemap.Main as Tilemap
import qualified Models.MapLayer.Main as MapLayer
import qualified Models.Level.Types as Types

toPath :: Types.Level -> String
toPath Types.World1Stage1Aboveground = "1-1/aboveground"
toPath Types.World1Stage1Underground = "1-1/underground"

toTilemap :: Types.Level -> Config.Config -> IO Tilemap.Tilemap
toTilemap level = Tilemap.fromPath (toPath level)
