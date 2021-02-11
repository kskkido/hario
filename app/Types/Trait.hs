module Types.Trait
  ( Trait(..)
  )
  where 

import Lib.Point.Types.Point
  ( Point
  )

data Trait = Trait
  { position :: Point
  , velocity :: Point
  }