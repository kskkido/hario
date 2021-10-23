module Models.Boundary.Lib
  ( setPosition
  , sumX
  , sumY
  , collides
  , clamp
  ) where

import Control.Lens
import qualified Linear
import qualified Lib.Math.Main as Math
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Boundary.Types as Types

setPosition :: Position.Position -> Types.Boundary -> Types.Boundary
setPosition position x = x { Types.position = position }

sumX :: Types.Boundary -> Float
sumX ra = Types.position ra ^. Linear._x + (Dimension.width $ Types.dimension ra)

sumY :: Types.Boundary -> Float
sumY ra = Types.position ra ^. Linear._y + (Dimension.height $ Types.dimension ra)

collides :: Types.Boundary -> Types.Boundary -> Bool
collides ra rb =
  (Types.position ra ^. Linear._x <= sumX rb) &&
  (Types.position rb ^. Linear._x <= sumX ra) &&
  (Types.position ra ^. Linear._y <= sumY rb) &&
  (Types.position rb ^. Linear._y <= sumY ra)

clamp :: Types.Boundary -> Types.Boundary -> Types.Boundary
clamp ra rb = Types.Rect
  { Types.position  = Position.from x y
  , Types.dimension = Dimension.Dimension
    { Dimension.width  = width
    , Dimension.height = height
    }
  }
  where
    x      = Math.clamp (Types.position ra ^. Linear._x) (Types.position rb ^. Linear._x) (sumX rb - width)
    y      = Math.clamp (Types.position ra ^. Linear._y) (Types.position rb ^. Linear._y) (sumY rb - height)
    width  = Math.min (Dimension.width $ Types.dimension ra) (Dimension.width $ Types.dimension  rb)
    height = Math.min (Dimension.height $ Types.dimension ra) (Dimension.height $ Types.dimension rb)
