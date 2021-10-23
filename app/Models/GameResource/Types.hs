module Models.GameResource.Types
  ( GameResource(..)
  ) where

import qualified SDL
import qualified Foreign.C.Types
import qualified Assets.ImageResource.Main as ImageResource
import qualified Models.LevelTilemap.Main as LevelTilemap

data GameResource = GameResource
  { window         :: SDL.Window
  , imageResources :: [ImageResource.ImageResource]
  , levelTilemap   :: LevelTilemap.LevelTilemap
  }
