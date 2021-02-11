module Types.Actor
  ( Actor
  ) where

import Lib.Entity.Types.Entity
  ( Entity(..)
  )

import Types.Dimension
  ( Trait
  )

type Actor = Entity Trait ()
