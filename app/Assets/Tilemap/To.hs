module Assets.Tilemap.To
  ( toBoundary
  ) where

import qualified Configs.App.Main as Config
import qualified Models.Boundary.Main as Boundary
import qualified Assets.TileLayer.Main as TileLayer
import qualified Assets.Tilemap.Types as Types

toBoundary :: Types.Tilemap -> Config.Config -> Boundary.Boundary
toBoundary tilemap config = TileLayer.toBoundary (Types.object tilemap) config
