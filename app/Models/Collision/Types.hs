module Models.Collision.Types
  ( Collision(..)
  ) where

import qualified Data.UUID
import qualified Models.Contact.Main as Contact

data Collision = Collision
  { contactX :: Contact.Contact
  , contactY :: Contact.Contact
  }
    deriving (Eq, Show)
