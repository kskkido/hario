module Models.GameResource.To
  ( toPosition
  , toBoundary
  , toTilemap
  ) where

import Control.Lens
import qualified Linear
import qualified Configs.App.Main as Config
import qualified Assets.Tilemap.Main as Tilemap
import qualified Models.Level.Main as Level
import qualified Models.LevelTilemap.Main as LevelTilemap
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.GameResource.Types as Types

toPosition :: Linear.V2 Integer -> Types.GameResource -> Config.Config -> Position.Position
toPosition vector resource config = fromIntegral <$> (vector &
  Linear._x %~ (* (toInteger $ Config.gameTileWidth config)) &
  Linear._y %~ (* (toInteger $ Config.gameTileHeight config)))

toTilemap :: Level.Level -> Types.GameResource -> Tilemap.Tilemap
toTilemap level = LevelTilemap.toTilemap level . Types.levelTilemap

toBoundary :: Level.Level -> Types.GameResource -> Config.Config -> Boundary.Boundary
toBoundary level resource config = Tilemap.toBoundary (toTilemap level resource) config
