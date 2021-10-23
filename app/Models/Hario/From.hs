module Models.Hario.From
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
import qualified Models.Motion.Main as Motion
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Velocity.Main as Velocity
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Boundary.Main as Boundary
import qualified Models.PhysicalObjectDTO.Main as PhysicalObjectDTO
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.HarioAction.Main as HarioAction
import qualified Models.HarioGraphic.Main as HarioGraphic
import qualified Models.Hario.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.Hario
fromTile tile position dimension = do
  Control.Monad.guard (Tile.variant tile == Tile.Hario0)
  return $ Types.Hario
    { Types.quirk        = Types.Mini
    , Types.status       = Types.Live
    , Types.position     = position
    , Types.dimension    = dimension
    , Types.velocity     = Velocity.unit
    , Types.acceleration = Acceleration.unit
    , Types.action       = HarioAction.unit
    , Types.graphic      = HarioGraphic.unit
    , Types.attribute    = Types.Attribute
      { Types.jump = 2
      , Types.speed = 3
      }
    }

fromPhysicalObjectDTO :: PhysicalObjectDTO.PhysicalObjectDTO -> Types.Hario -> Types.Hario
fromPhysicalObjectDTO dto x = x
  { Types.position     = Boundary.position  $ PhysicalObjectDTO.boundary dto
  , Types.dimension    = Boundary.dimension $ PhysicalObjectDTO.boundary dto
  , Types.velocity     = PhysicalObjectDTO.velocity dto
  , Types.acceleration = PhysicalObjectDTO.acceleration dto
  }

fromGameObjectDTO :: GameObjectDTO.GameObjectDTO -> Types.Hario -> Types.Hario
fromGameObjectDTO dto x = x
  { Types.position     = dto ^. GameObjectDTO._position
  , Types.dimension    = dto ^. GameObjectDTO._dimension
  , Types.velocity     = dto ^. GameObjectDTO._velocity
  , Types.acceleration = dto ^. GameObjectDTO._acceleration
  }
