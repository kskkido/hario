module Models.LevelScene.Game
  ( tick
  , input
  ) where

import qualified Data.Maybe
import qualified Configs.App.Main as Config
import qualified Models.Boundary.Main as Boundary
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameField.Main as GameField
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GameResource.Main as GameResource
import qualified Models.LevelScene.From as From
import qualified Models.LevelScene.Lib as Lib
import qualified Models.LevelScene.To as To
import qualified Models.LevelScene.Types as Types

tick :: Types.LevelScene -> GameResource.GameResource -> Config.Config -> Types.LevelScene
tick scene resource config = (apply tickCamera . apply tickPhysics . apply tickField) scene
  where apply fn s = fn s resource config

tickField :: Types.LevelScene -> GameResource.GameResource -> Config.Config -> Types.LevelScene
tickField scene _ _ = Lib.modifyField GameField.tick scene

tickCamera :: Types.LevelScene -> GameResource.GameResource -> Config.Config -> Types.LevelScene
tickCamera scene resource config  = (flip Lib.modifyCamera scene) $ \camera ->
  GameResource.toBoundary (Types.level scene) resource config `GameCamera.clamp`
  maybe camera (`GameCamera.follow` camera) (Actor.object <$> (GameField.toHario $ Types.field scene))

tickPhysics :: Types.LevelScene -> GameResource.GameResource -> Config.Config -> Types.LevelScene
tickPhysics scene _ _ = (PhysicalWorld.simulate . To.toPhysicalWorld >>= From.fromPhysicalWorld) scene

input :: GameCommand.GameCommand -> Types.LevelScene -> GameResource.GameResource -> Config.Config -> Types.LevelScene
input command scene resource config = inputField command scene resource config

inputField :: GameCommand.GameCommand -> Types.LevelScene -> GameResource.GameResource -> Config.Config -> Types.LevelScene
inputField command scene resource config = Lib.modifyObject (fmap $ Actor.input command) scene
