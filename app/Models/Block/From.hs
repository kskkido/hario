module Models.Block.From
  ( fromTile
  , fromResource
  ) where

import Data.Functor (($>))
import qualified Data.Maybe
import qualified Control.Monad
import qualified Linear
import qualified Assets.Tile.Main as Tile
import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position
import qualified Configs.App.Main as Config
import qualified Models.GameResource.Main as GameResource
import qualified Models.Block.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.Block
fromTile tile position dimension = do
  Control.Monad.guard (Tile.variant tile == Tile.Block1)
  return $ Types.Block
    { Types.position = position
    , Types.dimension = dimension
    }

fromResource :: GameResource.GameResource -> Config.Config -> Types.Block
fromResource resources config = Types.Block
  { Types.position  = Position.fromVector  $ Linear.V2 0 0
  , Types.dimension = Dimension.fromVector $ Linear.V2 (Config.gameTileWidth config) (Config.gameTileHeight config)
  }
