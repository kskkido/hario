{-# LANGUAGE BlockArguments #-}

module Models.PhysicalEntity.Lib
  ( setPosition
  , setVelocity
  , move
  , collides
  , resolveCollision
  ) where

import qualified Control.Monad
import qualified Linear.Metric
import qualified Models.Solid.Main as Solid
import qualified Models.Static.Main as Static
import qualified Models.Direction.Main as Direction
import qualified Models.Boundary.Main as Boundary
import qualified Models.Friction.Main as Friction
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.PhysicalEntity.To as To
import qualified Models.PhysicalEntity.Types as Types

setPosition :: Position.Position -> Types.PhysicalEntity -> Types.PhysicalEntity
setPosition position = do
  object <- Types.object
  \x -> x { Types.object = PhysicalObject.setPosition position object }

setVelocity :: Velocity.Velocity -> Types.PhysicalEntity -> Types.PhysicalEntity
setVelocity velocity = do
  object <- Types.object
  \x -> x { Types.object = PhysicalObject.setVelocity velocity object }

move :: Types.PhysicalEntity -> Types.PhysicalEntity
move x = x { Types.object = PhysicalObject.move $ Types.object x }

collides :: Types.PhysicalEntity -> Types.PhysicalEntity -> Bool
collides x y = To.toBoundary x `Boundary.collides` To.toBoundary y

resolveCollision :: Types.PhysicalEntity -> Types.PhysicalEntity -> Types.PhysicalEntity
resolveCollision x y = maybe x id $ do
  Control.Monad.guard (x `collides` y)
  direction <- Boundary.toDirection (To.toBoundary y) (To.toBoundary x)
  position  <- return $ Boundary.toEdgeOf (Direction.toOpposite direction) (To.toBoundary x) (To.toBoundary y)
  velocity  <- return $ Velocity.stopDirection direction (To.toVelocity x)
  friction  <- return $ To.toFriction x y
  resolved  <- return $ setVelocity (friction + velocity) $ setPosition position x
  return resolved
