module Store.Registry.Types.State
  ( State
  ) where

import qualified Data.Map.Strict
  as Map
import Types.Actor
  ( Actor
  )
import Types.UID
  ( UID
  )

type State = Map UID Actor