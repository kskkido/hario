module Models.PipeBlock.From
  ( fromTile
  ) where

import Data.Functor (($>))
import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Applicative
import qualified Assets.Tile.Main as Tile
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.PipeBlock.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.PipeBlock
fromTile tile position dimension = do
  variant <-
    (Control.Monad.guard (Tile.variant tile == Tile.Pipe2) $> Types.Left) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Pipe3) $> Types.Right)
  return $ Types.PipeBlock
    { Types.position = position
    , Types.dimension = dimension
    , Types.variant = variant
    }
