module Store.Root.Action
  ( registry
  ) where

import Store.Root.Types.Action
  ( Action(..)
  )
import Store.Registry.Types.Action
  as Registry

registry :: Registry.Action -> Action
registry = Registry