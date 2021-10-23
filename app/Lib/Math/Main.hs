module Lib.Math.Main
  ( max
  , min
  , clamp
  , degree
  ) where

import Prelude hiding (max, min)

max :: Ord a => a -> a -> a
max x y = if x >= y then x else y

min :: Ord a => a -> a -> a
min x y = if x >= y then y else x

clamp :: Ord a => a -> a -> a -> a
clamp x y z = min (max x y) z

degree :: Floating a => a -> a
degree x = x * (180 / pi)

radian :: Floating a => a -> a
radian x = 180 * (pi / x)

