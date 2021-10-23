module Models.GameLoop.From
  ( fromGameEventHandler
  ) where

import qualified SDL
import qualified SDL.Event
import qualified Control.Concurrent
import qualified Control.Monad
import qualified Data.Maybe
import qualified Lib.Time.Main as Time
import qualified Reactive.Banana.Frameworks
import qualified Configs.App.Main as Config
import qualified Models.Input.Main as Input
import qualified Models.GameEventHandler.Main as GameEventHandler

fromGameEventHandler :: GameEventHandler.GameEventHandler -> Config.Config -> IO ()
fromGameEventHandler handler config = do
  init <- Time.getTimeMS
  let iter prev = do
          curr           <- Time.getTimeMS
          GameEventHandler.tick handler (curr - prev)
          payloads       <- (fmap . fmap) SDL.eventPayload SDL.pollEvents
          (inputs, quit) <- return $ Input.fromEventPayloads payloads
          (GameEventHandler.inputs handler) inputs
          Control.Concurrent.threadDelay (1000000 `div` Config.frameRate config)
          Control.Monad.unless (Data.Maybe.isJust quit) (iter curr)
  iter init
