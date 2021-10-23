module Models.Grid.From
  ( stream
  ) where

import qualified Models.Cell.Main as Cell
import qualified Models.Grid.Types as Types

stream :: Types.Grid ()
stream = repeat <$> repeat Cell.unit
