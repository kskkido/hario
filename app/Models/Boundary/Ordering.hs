module Models.Boundary.Ordering
  ( orderByPosition
  ) where

import qualified Models.Boundary.Types as Types

orderByPosition :: Types.Boundary -> Types.Boundary -> Ordering
orderByPosition x y = Types.position x `compare` Types.position y
