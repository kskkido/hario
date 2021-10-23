module Models.Direction.To
  ( toPlane
  , toOpposite
  ) where

import qualified Models.Plane.Main as Plane
import qualified Models.Direction.Types as Types

toPlane :: Types.Direction -> Plane.Plane
toPlane Types.Up    = Plane.Vertical
toPlane Types.Down  = Plane.Vertical
toPlane Types.Left  = Plane.Horizontal
toPlane Types.Right = Plane.Horizontal

toOpposite :: Types.Direction -> Types.Direction
toOpposite Types.Up    = Types.Down
toOpposite Types.Down  = Types.Up
toOpposite Types.Left  = Types.Right
toOpposite Types.Right = Types.Left
