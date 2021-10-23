module Models.Actor.Game
  ( tick
  , input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GameObject.Main as GameObject
import qualified Models.Actor.Lib as Lib
import qualified Models.Actor.Types as Types

tick :: Types.Actor -> Types.Actor
tick = Lib.modifyObject GameObject.tick

input :: GameCommand.GameCommand -> Types.Actor -> Types.Actor
input command = Lib.modifyObject (GameObject.input command)

