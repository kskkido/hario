module Models.Position.Lib
  ( offset
  , offsetX
  , offsetY
  ) where

import qualified Models.Position.From as From
import qualified Models.Position.Types as Types

offset :: Types.Position -> Types.Position -> Types.Position
offset x y = x + y

offsetX :: Float -> Types.Position -> Types.Position
offsetX n x = offset x (From.from n 0)

offsetY :: Float -> Types.Position -> Types.Position
offsetY n x = offset x (From.from 0 n)
