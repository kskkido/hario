module Models.Motion.To
  ( toAcceleration
  , toVelocity
  , toDirectionX
  , toDirectionY
  ) where

import Data.Functor (($>))
import Control.Lens
import qualified Data.Maybe
import qualified Control.Monad
import qualified Linear
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Direction.Main as Direction
import qualified Models.Velocity.Main as Velocity
import qualified Models.Motion.Types as Types

toAcceleration :: Types.Motion -> Acceleration.Acceleration
toAcceleration = Types.acceleration

toVelocity :: Types.Motion -> Velocity.Velocity
toVelocity = Types.velocity

toDirectionX :: Types.Motion -> Data.Maybe.Maybe Direction.Direction
toDirectionX motion = Control.Monad.msum
  [ Control.Monad.guard (Types.velocity motion ^. Linear._x > 0) $> Direction.Right
  , Control.Monad.guard (Types.velocity motion ^. Linear._x < 0) $> Direction.Left
  ]

toDirectionY :: Types.Motion -> Data.Maybe.Maybe Direction.Direction
toDirectionY motion = Control.Monad.msum
  [ Control.Monad.guard (Types.velocity motion ^. Linear._y > 0) $> Direction.Down
  , Control.Monad.guard (Types.velocity motion ^. Linear._y < 0) $> Direction.Up
  ]
