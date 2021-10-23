module Models.GameEventHandler.Types
  ( GameEventHandler(..)
  ) where

import qualified Control.Event.Handler
import qualified Models.Input.Main as Input

data GameEventHandler = GameEventHandler
  { tick :: Control.Event.Handler.Handler Integer
  , inputs :: Control.Event.Handler.Handler [Input.Input]
  }
