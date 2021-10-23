{-# LANGUAGE BlockArguments #-}

module Models.GoombaAction.Lib
  ( update
  , tick
  , moveLeft
  , moveRight
  ) where

import Control.Lens
import qualified Control.Monad
import qualified Linear
import qualified Lib.Math.Main as Math
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.Direction.Main as Direction
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.GoombaAction.From as From
import qualified Models.GoombaAction.Types as Types

update :: Types.GoombaActionKey -> Types.GoombaAction -> Types.GoombaAction
update key x = maybe (From.fromKey key) id $ do
  Control.Monad.guard (Types.key x == key)
  return $ tick x

tick :: Types.GoombaAction -> Types.GoombaAction
tick x = x { Types.frame = Types.frame x + 1 }

moveLeft :: Types.GoombaAction -> GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO
moveLeft action x = maybe x id $ do
  Control.Monad.guard (Types.key action == Types.MoveLeft)
  return $ x & GameObjectDTO._velocity . Linear._x .~ (-0.8)

moveRight :: Types.GoombaAction -> GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO
moveRight action x = maybe x id $ do
  Control.Monad.guard (Types.key action == Types.MoveRight)
  return $ x & GameObjectDTO._velocity . Linear._x .~ 0.8


