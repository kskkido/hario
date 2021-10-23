module Models.PhysicalEntity.Types
  ( PhysicalEntity(..)
  ) where

import qualified Data.UUID
import qualified Models.PhysicalObject.Main as PhysicalObject

data PhysicalEntity = PhysicalEntity
  { uuid :: Data.UUID.UUID
  , object :: PhysicalObject.PhysicalObject
  }
