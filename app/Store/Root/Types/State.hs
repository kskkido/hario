module Store.Root.Types.Action
  ( State(..)
  ) where

import Store.Registry.Types.State
  as Registry

newtype State = State
  { registry :: Registry.State
  }
