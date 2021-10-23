module Models.GameEventSource.Types
  ( GameEventSource
  ) where

import Models.GameEventAddHandler.Main as GameEventAddHandler
import Models.GameEventHandler.Main as GameEventHandler

type GameEventSource =
  ( GameEventAddHandler.GameEventAddHandler
  , GameEventHandler.GameEventHandler
  )

