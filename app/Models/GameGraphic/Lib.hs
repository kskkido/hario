module Models.GameGraphic.Lib
  ( move
  , offset
  ) where

import qualified Linear
import qualified Foreign.C.Types
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.GameGraphic.To as To
import qualified Models.GameGraphic.Types as Types

move :: Position.Position -> Types.GameGraphic -> Types.GameGraphic
move position graphic = graphic { Types.position = position }

offset :: Position.Position -> Types.GameGraphic -> Types.GameGraphic
offset position graphic = graphic { Types.position = Types.position graphic - position  }

