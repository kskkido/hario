module Store.Root.Reducer
  ( reducer
  ) where

import Store.Root.Types.Action
  ( Action(..)
  )
import Store.Root.Types.State
  ( State(..)
  )
import Store.Registry.Reducer
  as Registry

reducer :: Action -> State -> State
reducer (Registry a) s = s { registry = Registry.reducer a (registry s) }