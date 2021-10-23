module Models.CollisionEvent.From
  ( fromCollision
  ) where

import qualified Models.Contact.Main as Contact
import qualified Models.Collision.Main as Collision
import qualified Models.CollisionEvent.Types as Types

fromCollision :: Collision.Collision -> Types.CollisionEvent
fromCollision collision = Types.CollisionEvent
  { Types.from      = Contact.uuid      $ Collision.contactX collision
  , Types.into      = Contact.uuid      $ Collision.contactY collision
  , Types.direction = Contact.direction $ Collision.contactX collision
  }
