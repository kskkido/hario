module Models.GroundBlock.From
  ( fromTile
  ) where

import Data.Functor (($>))
import qualified Data.Maybe
import qualified Control.Monad
import qualified Assets.Tile.Main as Tile
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GroundBlock.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.GroundBlock
fromTile tile position dimension = do
  Control.Monad.guard (Tile.variant tile == Tile.Block0)
  return $ Types.GroundBlock
    { Types.position = position
    , Types.dimension = dimension
    }
