module Models.GameCamera.To
  ( toBoundary
  ) where

import Control.Lens
import qualified Linear
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameCamera.Types as Types

toBoundary :: Types.GameCamera -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }
