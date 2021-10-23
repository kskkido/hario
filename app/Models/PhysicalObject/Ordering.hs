module Models.PhysicalObject.Ordering
  ( orderByPosition
  ) where

import qualified Models.Boundary.Main as Boundary
import qualified Models.PhysicalObject.To as To
import qualified Models.PhysicalObject.Types as Types

orderByPosition :: Types.PhysicalObject -> Types.PhysicalObject -> Ordering
orderByPosition x y = To.toBoundary x `Boundary.orderByPosition` To.toBoundary y
