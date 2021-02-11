module Store.Registry.Reducer
  ( reducer
  ) where

import qualified Data.Map.Strict
  as Map
import Store.Registry.Types.Action
  ( Action(..)
  )
import Store.Registry.Types.State
  ( State
  )

reducer :: Action -> State -> State
reducer (Create x) = Map.insert (uid x) x
reducer (Remove x) = Map.delete x
