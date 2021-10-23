module Assets.TileLayer.To
  ( toBoundary
  ) where

import qualified Linear
import qualified Data.Maybe
import qualified Control.Monad
import qualified Configs.App.Main as Config
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Assets.TileLayer.Types as Types

toBoundary :: Types.TileLayer -> Config.Config -> Boundary.Boundary
toBoundary tilemap config = Boundary.Rect
  { Boundary.position = Position.from 0 0
  , Boundary.dimension = Dimension.Dimension
    { Dimension.width  = maybe 0 (\head -> (fromIntegral $ length head) * (fromIntegral $ Config.gameTileWidth config)) $ Data.Maybe.listToMaybe tilemap
    , Dimension.height = (fromIntegral $ length tilemap) * (fromIntegral $ Config.gameTileHeight config)
    }
  }
