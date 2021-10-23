module Models.PhysicalEntityMap.Types
  ( PhysicalEntityMap
  ) where

import qualified Data.Map
import qualified Data.UUID
import qualified Models.PhysicalEntity.Main as PhysicalEntity

type PhysicalEntityMap = Data.Map.Map Data.UUID.UUID PhysicalEntity.PhysicalEntity
