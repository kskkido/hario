module Models.Actor.Lib
  ( modifyObject
  ) where

import qualified Models.GameObject.Main as GameObject
import qualified Models.Actor.Types as Types

modifyObject :: (GameObject.GameObject -> GameObject.GameObject) -> Types.Actor -> Types.Actor
modifyObject fn actor = actor { Types.object = fn $ Types.object actor }

