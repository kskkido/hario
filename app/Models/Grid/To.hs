module Models.Grid.To
  ( list
  , record
  ) where

import qualified Data.Map as Map
import qualified Models.Cell.Main as Cell
import qualified Models.Grid.Types as Types

list :: Types.Grid a -> [((Int,Int), a)]
list xxs = concat $ zipWith fn [0..] xxs
  where fn n xs = zipWith (gn n) [0..] xs
        gn n o (Cell.Cell x) = ((n, o), x)

record :: Types.Grid a -> Map.Map (Int,Int) a
record = Map.fromList . list
