module Models.Pole.From
  ( fromTile
  ) where

import Data.Functor (($>))
import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Applicative
import qualified Assets.Tile.Main as Tile
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Pole.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.Pole
fromTile tile position dimension = do
  variant <-
    (Control.Monad.guard (Tile.variant tile == Tile.Pole0) $> Types.Tip) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Pole1) $> Types.Bar)
  return $ Types.Pole
    { Types.position = position
    , Types.dimension = dimension
    , Types.variant = variant
    }
