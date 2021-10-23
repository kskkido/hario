module Models.Velocity.To
  ( toX
  , toY
  , toVelocityX
  , toVelocityY
  , toMagnitude
  ) where

import Control.Lens
import qualified Linear
import qualified Lib.Math.Main as Math
import qualified Models.Velocity.Types as Types

toX :: Types.Velocity -> Float
toX x = x ^. Linear._x

toY :: Types.Velocity -> Float
toY x = x ^. Linear._y

toVelocityX :: Types.Velocity -> Types.Velocity
toVelocityX = Linear._y .~ 0

toVelocityY :: Types.Velocity -> Types.Velocity
toVelocityY = Linear._x .~ 0

toMagnitude :: Types.Velocity -> Float
toMagnitude (Linear.V2 x y) = sqrt (x ^ 2 + y ^ 2)

toAngle :: Types.Velocity -> Float
toAngle (Linear.V2 x y) = Math.degree $ atan2 y x
