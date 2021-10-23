module Assets.Tilemap.Types
  ( Tilemap(..)
  ) where

import qualified Assets.TileLayer.Main as TileLayer

data Tilemap = Tilemap
  { background :: TileLayer.TileLayer
  , object     :: TileLayer.TileLayer
  }
