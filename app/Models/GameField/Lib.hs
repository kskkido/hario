module Models.GameField.Lib
  ( modifyObject
  ) where

import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameField.Types as Types

modifyObject :: (ActorMap.ActorMap -> ActorMap.ActorMap) -> Types.GameField -> Types.GameField
modifyObject fn field = field { Types.object = fn $ Types.object field }
