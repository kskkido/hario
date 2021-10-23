module Models.Goomba.From
  ( fromTile
  , fromPhysicalObjectDTO
  , fromGameObjectDTO
  ) where

import Control.Lens
import qualified Control.Monad
import qualified Data.Maybe
import qualified Linear
import qualified Configs.App.Main as Config
import qualified Assets.Tile.Main as Tile
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Velocity.Main as Velocity
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Boundary.Main as Boundary
import qualified Models.PhysicalObjectDTO.Main as PhysicalObjectDTO
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.GoombaAction.Main as GoombaAction
import qualified Models.GoombaGraphic.Main as GoombaGraphic
import qualified Models.Goomba.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.Goomba
fromTile tile position dimension = do
  Control.Monad.guard (Tile.variant tile == Tile.Goomba0)
  return $ Types.Goomba
    { Types.status       = Types.Live
    , Types.position     = position
    , Types.dimension    = dimension
    , Types.velocity     = Velocity.unit
    , Types.acceleration = Acceleration.unit
    , Types.action       = GoombaAction.unit
    , Types.graphic      = GoombaGraphic.unit
    }

fromPhysicalObjectDTO :: PhysicalObjectDTO.PhysicalObjectDTO -> Types.Goomba -> Types.Goomba
fromPhysicalObjectDTO dto x = x
  { Types.position     = Boundary.position  $ PhysicalObjectDTO.boundary dto
  , Types.dimension    = Boundary.dimension $ PhysicalObjectDTO.boundary dto
  , Types.velocity     = PhysicalObjectDTO.velocity dto
  , Types.acceleration = PhysicalObjectDTO.acceleration dto
  }

fromGameObjectDTO :: GameObjectDTO.GameObjectDTO -> Types.Goomba -> Types.Goomba
fromGameObjectDTO dto x = x
  { Types.position     = dto ^. GameObjectDTO._position
  , Types.dimension    = dto ^. GameObjectDTO._dimension
  , Types.velocity     = dto ^. GameObjectDTO._velocity
  , Types.acceleration = dto ^. GameObjectDTO._acceleration
  }
