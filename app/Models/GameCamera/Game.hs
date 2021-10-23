module Models.GameCamera.Game
  ( follow
  ) where

import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameCamera.Lib as Lib
import qualified Models.GameCamera.Types as Types

follow :: GameObject.GameObject -> Types.GameCamera -> Types.GameCamera
follow object camera = Lib.move (GameObject.toPosition object - ((/ 2) <$> (Dimension.toVector $ Types.dimension camera))) camera
