module Models.Dimension.To
  ( toVector
  ) where

import qualified Linear
import qualified Models.Dimension.Types as Types

toVector :: Types.Dimension -> Linear.V2 Float
toVector dimension = Linear.V2 (Types.width dimension) (Types.height dimension)

