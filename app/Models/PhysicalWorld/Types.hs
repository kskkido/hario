module Models.PhysicalWorld.Types
  ( PhysicalWorld(..)
  ) where

import qualified Models.PhysicalEntityMap.Main as PhysicalEntityMap

data PhysicalWorld = PhysicalWorld
  { entityMap :: PhysicalEntityMap.PhysicalEntityMap
  }
