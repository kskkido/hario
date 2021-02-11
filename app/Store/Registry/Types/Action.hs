module Store.Registry.Types.Action
  ( Action(..)
  ) where

import Types.Actor
  ( Actor
  )
import Types.UID
  ( UID
  )

data Action
  = Create
    {
      payload :: Actor
    }
  | Remove
    {
      payload :: UID
    }