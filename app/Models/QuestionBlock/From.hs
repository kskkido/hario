module Models.QuestionBlock.From
  ( fromTile
  ) where

import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Applicative
import qualified Assets.Tile.Main as Tile
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.QuestionBlockGraphic.Main as QuestionBlockGraphic
import qualified Models.QuestionBlock.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.QuestionBlock
fromTile tile position dimension = do
  Control.Monad.guard (Tile.variant tile == Tile.Block3)
  return $ Types.QuestionBlock
    { Types.position  = position
    , Types.dimension = dimension
    , Types.variant   = Types.Coin
    , Types.status    = Types.Active
    , Types.graphic   = QuestionBlockGraphic.unit
    }
