module Models.GameState.Game
  ( tick
  , input
  ) where

import qualified Data.Maybe
import qualified Configs.App.Main as Config
import qualified Models.Boundary.Main as Boundary
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GameResource.Main as GameResource
import qualified Models.GameState.From as From
import qualified Models.GameState.Lib as Lib
import qualified Models.GameState.To as To
import qualified Models.GameState.Types as Types

tick :: Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
tick state resource config = undefined
-- tick state resource config = (apply tickCamera . apply tickPhysics . apply tickActorMap . apply tickFrame) state
--   where apply fn s = fn s resource config

tickFrame :: Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
tickFrame state _ _ = Lib.modifyFrame ((+) 1) state

tickActorMap :: Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
tickActorMap state _ _ = Lib.modifyActorMap ActorMap.tick state

tickCamera :: Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
tickCamera state resource config = undefined
--tickCamera state resource config  = (flip Lib.modifyCamera state) $ \camera ->
--  GameResource.toBoundary resource config `GameCamera.clamp`
--  maybe camera (`GameCamera.follow` camera) (Data.Maybe.listToMaybe $ GameObject.toHarios (ActorMap.toObjects actorMap))
--  where actorMap = Types.actorMap state

tickPhysics :: Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
tickPhysics state _ _ = (PhysicalWorld.simulate . To.toPhysicalWorld >>= From.fromPhysicalWorld) state

input :: GameCommand.GameCommand -> Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
input command state resource config = inputActorMap command state resource config

inputActorMap :: GameCommand.GameCommand -> Types.GameState -> GameResource.GameResource -> Config.Config -> Types.GameState
inputActorMap command state resource config = Lib.modifyActorMap (fmap $ Actor.modifyObject $ GameObject.input command) state
