module Models.GameCamera.Lib
  ( move
  , offset
  , offsetX
  , offsetY
  , visible
  , clamp
  ) where

import qualified Linear
import qualified Foreign.C.Types
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GameCamera.From as From
import qualified Models.GameCamera.To as To
import qualified Models.GameCamera.Types as Types

move :: Position.Position -> Types.GameCamera -> Types.GameCamera
move position camera = camera { Types.position = position }

offset :: Position.Position -> Types.GameCamera -> Types.GameCamera
offset position camera = move (Types.position camera + position) camera

offsetX :: Float -> Types.GameCamera -> Types.GameCamera
offsetX n camera = offset (Position.from n 0) camera

offsetY :: Float -> Types.GameCamera -> Types.GameCamera
offsetY n camera = offset (Position.from 0 n) camera

visible :: Boundary.Boundary -> Types.GameCamera -> Bool
visible boundary camera = boundary `Boundary.collides` To.toBoundary camera

clamp :: Boundary.Boundary -> Types.GameCamera -> Types.GameCamera
clamp ra x = From.fromBoundary $ To.toBoundary x `Boundary.clamp` ra

