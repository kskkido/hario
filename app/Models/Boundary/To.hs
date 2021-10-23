module Models.Boundary.To
  ( toCenter
  , toLeftEdge
  , toRightEdge
  , toTopEdge
  , toBottomEdge
  , toLeftEdgeOf
  , toRightEdgeOf
  , toTopEdgeOf
  , toBottomEdgeOf
  , toEdgeOf
  , toDirection
  , toCollisionDirection
  ) where

import Control.Lens
import qualified Linear
import qualified Control.Monad
import qualified Data.Maybe
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Direction.Main as Direction
import qualified Models.Boundary.Lib as Lib
import qualified Models.Boundary.Types as Types

toPosition :: Types.Boundary -> Position.Position
toPosition = Types.position

toDimension :: Types.Boundary -> Dimension.Dimension
toDimension = Types.dimension

toCenter :: Types.Boundary -> Position.Position
toCenter ra = Position.from cx cy
  where cx = Types.position ra ^. Linear._x + (Dimension.width  $ Types.dimension ra)
        cy = Types.position ra ^. Linear._y + (Dimension.height $ Types.dimension ra)

toLeftEdge :: Types.Boundary -> Position.Position
toLeftEdge = toPosition

toRightEdge :: Types.Boundary -> Position.Position
toRightEdge x = toPosition x & Linear._x %~ (+ (Dimension.width $ toDimension x))

toTopEdge :: Types.Boundary -> Position.Position
toTopEdge = toPosition

toBottomEdge :: Types.Boundary -> Position.Position
toBottomEdge x = toPosition x & Linear._y %~ (+ (Dimension.height $ toDimension x))

toLeftEdgeOf :: Types.Boundary -> Types.Boundary -> Position.Position
toLeftEdgeOf x y = toPosition x & Linear._x .~ ((toLeftEdge y ^. Linear._x) - (Dimension.width $ toDimension x))

toRightEdgeOf :: Types.Boundary -> Types.Boundary -> Position.Position
toRightEdgeOf x y = toPosition x & Linear._x .~ (toRightEdge y ^. Linear._x)

toTopEdgeOf :: Types.Boundary -> Types.Boundary -> Position.Position
toTopEdgeOf x y = toPosition x & Linear._y .~ ((toTopEdge y ^. Linear._y) - (Dimension.height $ toDimension x))

toBottomEdgeOf :: Types.Boundary -> Types.Boundary -> Position.Position
toBottomEdgeOf x y = toPosition x & Linear._y .~ (toBottomEdge y ^. Linear._y)

toEdgeOf :: Direction.Direction -> Types.Boundary -> Types.Boundary -> Position.Position
toEdgeOf d = case d of
  Direction.Left  -> toLeftEdgeOf
  Direction.Right -> toRightEdgeOf
  Direction.Up    -> toTopEdgeOf
  Direction.Down  -> toBottomEdgeOf

toDirection :: Types.Boundary -> Types.Boundary -> Data.Maybe.Maybe Direction.Direction
toDirection x y = Direction.fromPosition $ (toCenter y - toCenter x)

toCollisionDirection :: Types.Boundary -> Types.Boundary -> Data.Maybe.Maybe Direction.Direction
toCollisionDirection x y = Control.Monad.guard (x `Lib.collides` y) >> toDirection x y
