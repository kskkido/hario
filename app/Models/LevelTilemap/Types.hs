module Models.LevelTilemap.Types
  ( LevelTilemap(..)
  ) where

import qualified Assets.Tilemap.Main as Tilemap

data LevelTilemap = LevelTilemap
  { world1Stage1Aboveground :: Tilemap.Tilemap
  , world1Stage1Underground :: Tilemap.Tilemap
  }
