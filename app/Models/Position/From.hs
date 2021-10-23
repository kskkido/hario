module Models.Position.From
  ( from
  , fromVector
  ) where

import qualified Control.Lens
import qualified Linear
import qualified Models.Position.Types as Types

from :: Float -> Float -> Types.Position
from x y = Linear.V2 x y

fromVector :: Integral a => Linear.V2 a -> Types.Position
fromVector x = from (fromIntegral $ x Control.Lens.^. Linear._x) (fromIntegral $ x Control.Lens.^. Linear._y)
