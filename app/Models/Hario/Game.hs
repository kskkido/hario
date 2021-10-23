{-# LANGUAGE BlockArguments #-}

module Models.Hario.Game
  ( tick
  , input
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
import qualified Models.HarioAction.Main as HarioAction
import qualified Models.HarioGraphic.Main as HarioGraphic
import qualified Models.Hario.To as To
import qualified Models.Hario.Lib as Lib
import qualified Models.Hario.Types as Types

tick :: Types.Hario -> Types.Hario
tick = tickGraphic . tickAction

tickAction :: Types.Hario -> Types.Hario
tickAction = Lib.updateAction <$> To.toActionKey <*> \x -> case To.toActionKey x of
  HarioAction.Idle      -> x
  HarioAction.Jump      -> Lib.modifyGameObjectDTO (HarioAction.jump      $ Types.action x) x
  HarioAction.MoveLeft  -> Lib.modifyGameObjectDTO (HarioAction.moveLeft  $ Types.action x) x
  HarioAction.MoveRight -> Lib.modifyGameObjectDTO (HarioAction.moveRight $ Types.action x) x

tickGraphic :: Types.Hario -> Types.Hario
tickGraphic = HarioGraphic.fromGameObjectDTO . To.toGameObjectDTO >>= Lib.updateGraphic . HarioGraphic.toKey

input :: GameCommand.GameCommand -> Types.Hario -> Types.Hario
input = inputAction

inputAction :: GameCommand.GameCommand -> Types.Hario -> Types.Hario
inputAction command x = case To.toActionKey x of
  HarioAction.Idle      -> maybe x id $ Control.Monad.msum
    [ KeyState.toPressed  (GameCommand.toA command)     $> Lib.updateAction HarioAction.Jump x
    , KeyState.toPressed  (GameCommand.toLeft command)  $> Lib.updateAction HarioAction.MoveLeft x
    , KeyState.toPressed  (GameCommand.toRight command) $> Lib.updateAction HarioAction.MoveRight x
    ]
  HarioAction.Jump      -> maybe x id $ Control.Monad.msum
    [ KeyState.toPressed  (GameCommand.toLeft command)  $> Lib.updateAction HarioAction.MoveLeft x
    , KeyState.toPressed  (GameCommand.toRight command) $> Lib.updateAction HarioAction.MoveRight x
    , KeyState.toReleased (GameCommand.toA command)     $> Lib.updateAction HarioAction.Idle x
    ]
  HarioAction.MoveLeft  -> maybe x id $ Control.Monad.msum
    [ KeyState.toPressed  (GameCommand.toA command)     $> Lib.updateAction HarioAction.Jump x
    , KeyState.toPressed  (GameCommand.toRight command) $> Lib.updateAction HarioAction.MoveRight x
    , KeyState.toReleased (GameCommand.toLeft command)  $> Lib.updateAction HarioAction.Idle x
    ]
  HarioAction.MoveRight -> maybe x id $ Control.Monad.msum
    [ KeyState.toPressed  (GameCommand.toA command)     $> Lib.updateAction HarioAction.Jump x
    , KeyState.toPressed  (GameCommand.toLeft command)  $> Lib.updateAction HarioAction.MoveLeft x
    , KeyState.toReleased (GameCommand.toRight command) $> Lib.updateAction HarioAction.Idle x
    ]

