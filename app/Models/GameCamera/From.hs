module Models.GameCamera.From
  ( fromConfig
  , fromBoundary
  ) where

import qualified Linear as Linear
import qualified Configs.App.Main as Config
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameCamera.Types as Types

fromConfig :: Config.Config -> Types.GameCamera
fromConfig config = Types.GameCamera
  { Types.dimension = Dimension.from (toInteger $ Config.windowWidth config) (toInteger $ Config.windowHeight config)
  , Types.position = Position.from 0 0
  }

fromBoundary :: Boundary.Boundary -> Types.GameCamera
fromBoundary ra = Types.GameCamera
  { Types.dimension = Boundary.dimension ra
  , Types.position = Boundary.position ra
  }
