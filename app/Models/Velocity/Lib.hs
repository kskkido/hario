module Models.Velocity.Lib
  ( max
  , min
  , maxX
  , maxY
  , minX
  , minY
  , reverse
  , setX
  , setY
  , stopLeft
  , stopRight
  , stopUp
  , stopDown
  , stopDirection
  ) where

import Prelude hiding (max, min, reverse)
import Control.Lens
import qualified Linear
import qualified Lib.Math.Main as Math
import qualified Models.Direction.Main as Direction
import qualified Models.Velocity.Types as Types

max :: Types.Velocity -> Types.Velocity -> Types.Velocity
max x y = Linear.V2 (Math.max (x ^. Linear._x) (y ^. Linear._x)) (Math.max (x ^. Linear._y) (y ^. Linear._y))

min :: Types.Velocity -> Types.Velocity -> Types.Velocity
min x y = Linear.V2 (Math.min (x ^. Linear._x) (y ^. Linear._x)) (Math.min (x ^. Linear._y) (y ^. Linear._y))

maxX :: Float -> Types.Velocity -> Types.Velocity
maxX n = Linear._x %~ (Math.max n)

maxY :: Float -> Types.Velocity -> Types.Velocity
maxY n = Linear._y %~ (Math.max n)

minX :: Float -> Types.Velocity -> Types.Velocity
minX n = Linear._x %~ (Math.min n)

minY :: Float -> Types.Velocity -> Types.Velocity
minY n = Linear._y %~ (Math.min n)

reverse :: Types.Velocity -> Types.Velocity
reverse = fmap (* (-1))

setX :: Float -> Types.Velocity -> Types.Velocity
setX n x = x & Linear._x .~ n

setY :: Float -> Types.Velocity -> Types.Velocity
setY n x = x & Linear._y .~ n

stopLeft :: Types.Velocity -> Types.Velocity
stopLeft = Linear._x %~ Math.max 0

stopRight :: Types.Velocity -> Types.Velocity
stopRight = Linear._x %~ Math.min 0

stopUp :: Types.Velocity -> Types.Velocity
stopUp = Linear._y %~ Math.max 0

stopDown :: Types.Velocity -> Types.Velocity
stopDown = Linear._y %~ Math.min 0

stopDirection :: Direction.Direction -> Types.Velocity -> Types.Velocity
stopDirection direction = case direction of
  Direction.Left  -> stopLeft
  Direction.Right -> stopRight
  Direction.Up    -> stopUp
  Direction.Down  -> stopDown

