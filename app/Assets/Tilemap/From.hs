module Assets.Tilemap.From
  ( fromPath
  ) where

import qualified Configs.App.Main as Config
import qualified Assets.TileLayer.Main as TileLayer
import qualified Assets.Tilemap.Types as Types

fromPath :: String -> Config.Config -> IO Types.Tilemap
fromPath path config = do
  background <- TileLayer.fromPath (path ++ "/background") config
  object     <- TileLayer.fromPath (path ++ "/object") config
  return $ Types.Tilemap
    { Types.background = background
    , Types.object     = object
    }
