module Models.GameEventAddHandler.Types
  ( GameEventAddHandler(..)
  ) where

import qualified Control.Event.Handler
import qualified Models.Input.Main as Input

data GameEventAddHandler = GameEventAddHandler
  { tick :: Control.Event.Handler.AddHandler Integer
  , inputs :: Control.Event.Handler.AddHandler [Input.Input]
  }
