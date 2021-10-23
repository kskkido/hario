module Models.PhysicalObject.Lib
  ( move
  , setPosition
  , setVelocity
  ) where

import qualified Models.Solid.Main as Solid
import qualified Models.Static.Main as Static
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.PhysicalObject.Types as Types

move :: Types.PhysicalObject -> Types.PhysicalObject
move (Types.Solid  object) = Types.Solid $ Solid.move object
move (Types.Static object) = Types.Static $ Static.move object
move x                     = x

setPosition :: Position.Position -> Types.PhysicalObject -> Types.PhysicalObject
setPosition position (Types.Solid object)  = Types.Solid  $ Solid.setPosition position object
setPosition position (Types.Static object) = Types.Static $ Static.setPosition position object
setPosition position x                     = x

setVelocity :: Velocity.Velocity -> Types.PhysicalObject -> Types.PhysicalObject
setVelocity velocity (Types.Solid object)  = Types.Solid  $ Solid.setVelocity velocity object
setVelocity velocity x                     = x
