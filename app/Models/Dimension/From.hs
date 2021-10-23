module Models.Dimension.From
  ( from
  , fromVector
  ) where

import qualified Control.Lens
import qualified Linear
import qualified Models.Dimension.Types as Types

from :: Integral a => a -> a -> Types.Dimension
from x y = Types.Dimension
  { Types.width  = fromIntegral x
  , Types.height = fromIntegral y
  }

fromVector :: Integral a => Linear.V2 a -> Types.Dimension
fromVector vector = from (vector Control.Lens.^. Linear._x) (vector Control.Lens.^. Linear._y)
