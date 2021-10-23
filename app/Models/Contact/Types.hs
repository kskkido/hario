module Models.Contact.Types
  ( Contact(..)
  ) where

import qualified Data.UUID
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Direction.Main as Direction

data Contact = Contact
  { uuid :: Data.UUID.UUID
  , direction :: Direction.Direction
  }
    deriving (Eq, Show)
