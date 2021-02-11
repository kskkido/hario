module Store.Root.Types.Action
  ( Action(..)
  ) where

import Store.Registry.Types.Action
  as Registry

data Action =
    Registry Registry.Action
  | Noop