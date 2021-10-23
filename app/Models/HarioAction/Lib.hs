{-# LANGUAGE BlockArguments #-}

module Models.HarioAction.Lib
  ( update
  , tick
  , moveLeft
  , moveRight
  , jump
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
import qualified Models.HarioAction.From as From
import qualified Models.HarioAction.Types as Types

update :: Types.HarioActionKey -> Types.HarioAction -> Types.HarioAction
update key x = maybe (From.fromKey key) id $ do
  Control.Monad.guard (Types.key x == key)
  return $ tick x

tick :: Types.HarioAction -> Types.HarioAction
tick x = x { Types.frame = Types.frame x + 1 }

moveLeft :: Types.HarioAction -> GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO
moveLeft action x = maybe x id $ do
  Control.Monad.guard (Types.key action == Types.MoveLeft)
  frame  <- return $ Math.min 10 $ fromInteger $ Types.frame action
  offset <- return $ (frame + 1) * 0.3
  return $ x & GameObjectDTO._velocity . Linear._x %~ Math.max (-3) . \x -> x - offset

moveRight :: Types.HarioAction -> GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO
moveRight action x = maybe x id $ do
  Control.Monad.guard (Types.key action == Types.MoveRight)
  frame  <- return $ Math.min 10 $ fromInteger $ Types.frame action
  offset <- return $ (frame + 1) * 0.3
  return $ x & GameObjectDTO._velocity . Linear._x %~ Math.min (3) . \x -> x + offset

jump :: Types.HarioAction -> GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO
jump action x = maybe x id $ do
  Control.Monad.guard (Types.key action == Types.Jump)
  velocity <- return $ x ^. GameObjectDTO._velocity
  frame    <- return $ fromInteger $ Types.frame action
  offset   <- return $ Math.max 0 (5 - (frame * 0.05))
  Control.Monad.guard (0 == x ^. GameObjectDTO._velocity . Linear._y)
  return $ x & GameObjectDTO._velocity . Linear._y %~ \y -> y - offset

