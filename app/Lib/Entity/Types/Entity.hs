module Lib.Entity.Types.Entity
  ( Entity(..)
  ) where

data Entity a b = Entity
  { uid :: Int
  , trait :: a
  , state :: b
  }