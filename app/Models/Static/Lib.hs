module Models.Static.Lib
  ( move
  , setPosition
  ) where

import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Static.Types as Types

move :: Types.Static -> Types.Static
move = id

setPosition :: Position.Position -> Types.Static -> Types.Static
setPosition position = do
  boundary <- Types.boundary
  \x -> x
    { Types.boundary = Boundary.setPosition position boundary
    }
