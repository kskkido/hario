module Models.Position.To
  ( toAngle
  ) where

import qualified Linear
import qualified Lib.Math.Main as Math
import qualified Models.Position.Types as Types

toAngle :: Types.Position -> Float
toAngle (Linear.V2 x y) = Math.degree $ atan2 y x
