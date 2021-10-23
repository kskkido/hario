module Models.Motion.Lib
  ( modifyVelocity
  , setVelocityX
  , setVelocityY
  , offsetVelocityX
  , offsetVelocityY
  , modifyAcceleration
  , setAccelerationX
  , setAccelerationY
  , offsetAccelerationX
  , offsetAccelerationY
  , accelerate
  , move
  , moveX
  , moveY
  , stop
  , stopX
  , stopY
  , stopLeft
  , stopRight
  , stopUp
  , stopDown
  , maxVelocity
  , minVelocity
  ) where

import Control.Lens
import qualified Linear
import qualified Lib.Math.Main as Math
import qualified Models.Velocity.Main as Velocity
import qualified Models.Position.Main as Position
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Motion.Types as Types

modifyVelocity :: (Velocity.Velocity -> Velocity.Velocity) -> Types.Motion -> Types.Motion
modifyVelocity fn motion = motion { Types.velocity = fn $ Types.velocity motion }

setVelocity :: Velocity.Velocity -> Types.Motion -> Types.Motion
setVelocity velocity = modifyVelocity $ const velocity

setVelocityX :: Float -> Types.Motion -> Types.Motion
setVelocityX n = modifyVelocity $ Linear._x .~ n

setVelocityY :: Float -> Types.Motion -> Types.Motion
setVelocityY n = modifyVelocity $ Linear._y .~ n

offsetVelocityX :: Float -> Types.Motion -> Types.Motion
offsetVelocityX n = modifyVelocity $ Linear._x %~ (+ n)

offsetVelocityY :: Float -> Types.Motion -> Types.Motion
offsetVelocityY n = modifyVelocity $ Linear._y %~ (+ n)

modifyAcceleration :: (Acceleration.Acceleration -> Acceleration.Acceleration) -> Types.Motion -> Types.Motion
modifyAcceleration fn motion = motion { Types.acceleration = fn $ Types.acceleration motion }

setAcceleration :: Acceleration.Acceleration -> Types.Motion -> Types.Motion
setAcceleration acceleration  = modifyAcceleration $ const acceleration

setAccelerationX :: Float -> Types.Motion -> Types.Motion
setAccelerationX n = modifyAcceleration $ Linear._x .~ n

setAccelerationY :: Float -> Types.Motion -> Types.Motion
setAccelerationY n = modifyAcceleration $ Linear._y .~ n

offsetAccelerationX :: Float -> Types.Motion -> Types.Motion
offsetAccelerationX n = modifyAcceleration $ Linear._x %~ (+ n)

offsetAccelerationY :: Float -> Types.Motion -> Types.Motion
offsetAccelerationY n = modifyAcceleration $ Linear._y %~ (+ n)

accelerate :: Types.Motion -> Types.Motion
accelerate motion = motion
  { Types.velocity = Types.velocity motion + Types.acceleration motion
  }

move :: Types.Motion -> Position.Position -> Position.Position
move motion = moveY motion . moveX motion

moveX :: Types.Motion -> Position.Position -> Position.Position
moveX motion position = Position.offsetX (Types.velocity motion ^. Linear._x) position

moveY :: Types.Motion -> Position.Position -> Position.Position
moveY motion position = Position.offsetY (Types.velocity motion ^. Linear._y) position

stop = stopY . stopX

stopX :: Types.Motion -> Types.Motion
stopX motion = motion
  { Types.velocity = Types.velocity motion & Linear._x .~ 0
  , Types.acceleration = Types.acceleration motion & Linear._x .~ 0
  }

stopY :: Types.Motion -> Types.Motion
stopY motion = motion
  { Types.velocity = Types.velocity motion & Linear._y .~ 0
  , Types.acceleration = Types.acceleration motion & Linear._y .~ 0
  }

stopLeft :: Types.Motion -> Types.Motion
stopLeft motion = motion
  { Types.velocity = Types.velocity motion & Linear._x %~ Math.max 0
  , Types.acceleration = Types.acceleration motion & Linear._x %~ Math.max 0
  }

stopRight :: Types.Motion -> Types.Motion
stopRight motion = motion
  { Types.velocity = Types.velocity motion & Linear._x %~ Math.min 0
  , Types.acceleration = Types.acceleration motion & Linear._x %~ Math.min 0
  }

stopUp :: Types.Motion -> Types.Motion
stopUp motion = motion
  { Types.velocity = Types.velocity motion & Linear._y %~ Math.max 0
  , Types.acceleration = Types.acceleration motion & Linear._y %~ Math.max 0
  }

stopDown :: Types.Motion -> Types.Motion
stopDown motion = motion
  { Types.velocity = Types.velocity motion & Linear._y %~ Math.min 0
  , Types.acceleration = Types.acceleration motion & Linear._y %~ Math.min 0
  }

maxVelocity :: Velocity.Velocity -> Types.Motion -> Types.Motion
maxVelocity velocity = modifyVelocity (Velocity.max velocity)

minVelocity :: Velocity.Velocity -> Types.Motion -> Types.Motion
minVelocity velocity = modifyVelocity (Velocity.min velocity)

clampVelocity :: Velocity.Velocity -> Velocity.Velocity -> Types.Motion -> Types.Motion
clampVelocity vmin vmax = maxVelocity vmin . minVelocity vmax
