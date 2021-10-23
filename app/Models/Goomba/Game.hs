{-# LANGUAGE BlockArguments #-}

module Models.Goomba.Game
  ( tick
  ) where

import Control.Lens
import Data.Functor (($>))
import qualified Linear
import qualified Control.Monad
import qualified Lib.Math.Main as Math
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.Direction.Main as Direction
import qualified Models.KeyState.Main as KeyState
import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GoombaAction.Main as GoombaAction
import qualified Models.GoombaGraphic.Main as GoombaGraphic
import qualified Models.Goomba.To as To
import qualified Models.Goomba.Lib as Lib
import qualified Models.Goomba.Types as Types

tick :: Types.Goomba -> Types.Goomba
tick = tickGraphic . tickAction

tickAction :: Types.Goomba -> Types.Goomba
tickAction = do
  x <- \x -> case To.toActionKey x of
    GoombaAction.Idle      -> Lib.updateAction GoombaAction.MoveLeft x
    GoombaAction.MoveLeft  -> Lib.modifyGameObjectDTO (GoombaAction.moveLeft  $ Types.action x) x
    GoombaAction.MoveRight -> Lib.modifyGameObjectDTO (GoombaAction.moveRight $ Types.action x) x
  return $ Lib.updateAction (To.toActionKey x) x

tickGraphic :: Types.Goomba -> Types.Goomba
tickGraphic = GoombaGraphic.fromGameObjectDTO . To.toGameObjectDTO >>= Lib.updateGraphic . GoombaGraphic.toKey
