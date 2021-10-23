{-# LANGUAGE BlockArguments #-}

module Models.PhysicalEntityMap.Lib
  ( insert
  , resolveCollisions
  ) where

import qualified Data.Map
import qualified Data.UUID
import qualified Models.Boundary.Main as Boundary
import qualified Models.Contact.Main as Contact
import qualified Models.Collision.Main as Collision
import qualified Models.PhysicalEntity.Main as PhysicalEntity
import qualified Models.PhysicalEntityMap.To as To
import qualified Models.PhysicalEntityMap.Types as Types

insert :: [PhysicalEntity.PhysicalEntity] -> Types.PhysicalEntityMap -> Types.PhysicalEntityMap
insert objects objectMap = foldr (PhysicalEntity.toUUID >>= Data.Map.insert) objectMap objects

resolveCollision :: Collision.Collision -> Types.PhysicalEntityMap -> Types.PhysicalEntityMap
resolveCollision collision entityMap = maybe entityMap id $ do
  contactX <- return $ Collision.contactX collision
  contactY <- return $ Collision.contactY collision
  entityX  <- Data.Map.lookup (Contact.uuid contactX) entityMap
  entityY  <- Data.Map.lookup (Contact.uuid contactY) entityMap
  resolved <- return $ PhysicalEntity.resolveCollision entityX entityY
  return $ Data.Map.insert (PhysicalEntity.uuid entityX) resolved entityMap

resolveCollisions :: Types.PhysicalEntityMap -> Types.PhysicalEntityMap
resolveCollisions = To.toCollisions >>= flip (foldr resolveCollision)
