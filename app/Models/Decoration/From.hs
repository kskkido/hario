module Models.Decoration.From
  ( fromTile
  ) where

import Data.Functor (($>))
import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Applicative
import qualified Assets.Tile.Main as Tile
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Decoration.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.Decoration
fromTile tile position dimension = do
  variant <-
    (Control.Monad.guard (Tile.variant tile == Tile.Cloud0) $> Types.Cloud0) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Cloud1) $> Types.Cloud1) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Cloud2) $> Types.Cloud2) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Cloud3) $> Types.Cloud3) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Cloud4) $> Types.Cloud4) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Cloud5) $> Types.Cloud5) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Grass0) $> Types.Grass0) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Grass1) $> Types.Grass1) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Grass2) $> Types.Grass2) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Mountain0) $> Types.Mountain0) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Mountain1) $> Types.Mountain1) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Mountain2) $> Types.Mountain2) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Mountain3) $> Types.Mountain3) Control.Applicative.<|>
    (Control.Monad.guard (Tile.variant tile == Tile.Mountain4) $> Types.Mountain4)
  return $ Types.Decoration
    { Types.position = position
    , Types.dimension = dimension
    , Types.variant = variant
    }
