module Models.Boundary.Types
  ( Boundary(..)
  ) where

import qualified Foreign.C.Types
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension

data Boundary = Rect
  { position  :: Position.Position
  , dimension :: Dimension.Dimension
  } deriving (Eq, Show)
