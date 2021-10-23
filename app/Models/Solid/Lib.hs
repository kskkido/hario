module Models.Solid.Lib
  ( move
  , setPosition
  , setVelocity
  ) where

import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.Solid.Types as Types

move :: Types.Solid -> Types.Solid
move = do
  acceleration <- Types.acceleration
  velocity     <- Types.velocity
  boundary     <- Types.boundary
  position     <- return $ Boundary.position boundary
  \x -> x
    { Types.velocity     = velocity + acceleration
    , Types.boundary     = Boundary.setPosition (position + velocity) boundary
    }

setPosition :: Position.Position -> Types.Solid -> Types.Solid
setPosition position = do
  boundary <- Types.boundary
  \x -> x
    { Types.boundary = Boundary.setPosition position boundary
    }

setVelocity :: Velocity.Velocity -> Types.Solid -> Types.Solid
setVelocity velocity x = x { Types.velocity = velocity }
