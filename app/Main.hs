module Main where

import qualified SDL
import qualified SDL.Vect
import qualified Linear
import qualified Control.Monad
import qualified Control.Event.Handler
import qualified Control.Monad.Trans
import qualified Control.Monad.Trans.Maybe
import qualified Data.Maybe
import qualified Reactive.Banana
import qualified Reactive.Banana.Frameworks
import qualified Configs.App.Main as Config
import qualified Assets.Image.Main as Image
import qualified Assets.ImageResource.Main as ImageResource
import qualified Models.Level.Main as Level
import qualified Models.LevelScene.Main as LevelScene
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameLoop.Main as GameLoop
import qualified Models.GameMeta.Main as GameMeta
import qualified Models.GameState.Main as GameState
import qualified Models.GameNetwork.Main as GameNetwork
import qualified Models.GameResource.Main as GameResource
import qualified Models.GameEventSource.Main as GameEventSource

main :: IO ()
main = do
  let config = Config.fromEnv ()
  Control.Monad.mapM_ putStrLn ["Hello there!"]
  resource <- GameResource.fromConfig config
  level    <- return $ Level.World1Stage1Aboveground
  scene    <- LevelScene.fromLevel level GameMeta.unit resource config
  LevelScene.render scene resource config
  (addHandler, handler) <- GameEventSource.fromConfig config
  network <- Reactive.Banana.compile $ GameNetwork.fromGameEventAddHandler addHandler scene resource config
  Reactive.Banana.Frameworks.actuate network
  GameLoop.fromGameEventHandler handler config
  Control.Monad.mapM_ putStrLn ["Bye!"]
