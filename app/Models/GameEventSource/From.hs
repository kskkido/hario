module Models.GameEventSource.From
  ( fromConfig
  ) where

import Control.Event.Handler
import Configs.App.Main as Config
import Models.GameEventAddHandler.Main as GameEventAddHandler
import Models.GameEventHandler.Main as GameEventHandler
import Models.GameEventSource.Types as Types

fromConfig :: Config.Config -> IO Types.GameEventSource
fromConfig _ = do
  (addTick,  tick)  <- Control.Event.Handler.newAddHandler
  (addInputs, inputs) <- Control.Event.Handler.newAddHandler
  return
    (
      GameEventAddHandler.GameEventAddHandler
        { GameEventAddHandler.tick = addTick
        , GameEventAddHandler.inputs = addInputs
        }
    , GameEventHandler.GameEventHandler
        { GameEventHandler.tick = tick
        , GameEventHandler.inputs = inputs
        }
    )
