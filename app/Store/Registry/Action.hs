module Store.Registry.Action
  ( create
  , remove
  ) where

import Store.Registry.Types.Action
  ( Action(..)
  )

import Types.Actor
  ( Actor
  )
import Types.UID
  ( UID
  )

create :: Actor -> Action
create = Create

remove :: UID -> Action
remove = Remove