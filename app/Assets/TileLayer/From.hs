module Assets.TileLayer.From
  ( fromLines
  , fromPath
  ) where

import qualified Control.Monad
import qualified Configs.App.Main as Config
import qualified Assets.Tile.Main as Tile
import qualified Assets.TileLayer.Types as Types

fromLines :: [String] -> Types.TileLayer
fromLines = (fmap . fmap) Tile.fromChar

fromPath :: String -> Config.Config -> IO Types.TileLayer
fromPath path config = do
  file <- readFile $ Config.filePathAssetTilemap config ++ path ++ ".txt"
  return $ fromLines $ lines file

