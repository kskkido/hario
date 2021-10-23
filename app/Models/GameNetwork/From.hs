module Models.GameNetwork.From
  ( fromGameEventAddHandler
  ) where

import Data.Functor ((<$))
import qualified Reactive.Banana.Combinators
import qualified Reactive.Banana.Frameworks
import qualified Configs.App.Main as Config
import qualified Models.GameMeta.Main as GameMeta
import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GameResource.Main as GameResource
import qualified Models.GameState.Main as GameState
import qualified Models.GameEventAddHandler.Main as GameEventAddHandler
import qualified Models.LevelScene.Main as LevelScene

fromGameEventAddHandler :: GameEventAddHandler.GameEventAddHandler -> LevelScene.LevelScene -> GameResource.GameResource -> Config.Config -> Reactive.Banana.Frameworks.MomentIO ()
fromGameEventAddHandler addHandler scene resource config = do
  eventTick          <- Reactive.Banana.Frameworks.fromAddHandler (GameEventAddHandler.tick addHandler)
  eventInputs        <- Reactive.Banana.Frameworks.fromAddHandler (GameEventAddHandler.inputs addHandler)
  eventGameMeta      <- Reactive.Banana.Combinators.accumE GameMeta.unit $ Reactive.Banana.Combinators.unions
    [ GameMeta.tick  <$ eventTick
    ]
  eventGameCommand   <- Reactive.Banana.Combinators.accumE GameCommand.unit $ Reactive.Banana.Combinators.unions
    [ GameCommand.fromInputs <$> eventInputs
    ]
  behaviorLevelScene <- Reactive.Banana.Combinators.accumB scene $ Reactive.Banana.Combinators.unions
    [ (\command current -> LevelScene.input command current resource config) <$> eventGameCommand
    , (\current         -> LevelScene.tick current resource config)          <$  eventTick
    ]
  eventLevelScene    <- Reactive.Banana.Frameworks.changes behaviorLevelScene
  Reactive.Banana.Frameworks.reactimate' $
    (fmap . fmap)
    (\scene -> LevelScene.render scene resource config)
    eventLevelScene
