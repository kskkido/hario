module Models.GameField.Game
  ( tick
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameField.Lib as Lib
import qualified Models.GameField.Types as Types

tick :: Types.GameField -> Types.GameField
tick = Lib.modifyObject ActorMap.tick
