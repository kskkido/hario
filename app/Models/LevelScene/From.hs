{-# LANGUAGE BlockArguments #-}

module Models.LevelScene.From
  ( fromLevel
  , fromPhysicalWorld
  , fromEvent
  ) where

import qualified Control.Monad
import qualified Data.Map
import qualified Data.UUID
import qualified System.Random
import qualified Linear
import qualified Configs.App.Main as Config
import qualified Models.Level.Main as Level
import qualified Models.Hario.Main as Hario
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.CollisionEvent.Main as CollisionEvent
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameMeta.Main as GameMeta
import qualified Models.GameEvent.Main as GameEvent
import qualified Models.GameField.Main as GameField
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameResource.Main as GameResource
import qualified Models.LevelScene.Types as Types

fromLevel :: Level.Level -> GameMeta.GameMeta -> GameResource.GameResource -> Config.Config -> IO Types.LevelScene
fromLevel level meta resource config = do
  field  <- return $ GameField.fromTilemap (GameResource.toTilemap level resource) meta config
  camera <- return $ GameCamera.fromConfig config
  return $ Types.LevelScene
    { Types.score  = 0
    , Types.timer  = 0
    , Types.level  = level
    , Types.field  = field
    , Types.camera = camera
    }

fromPhysicalWorld :: PhysicalWorld.PhysicalWorld -> Types.LevelScene -> Types.LevelScene
fromPhysicalWorld world scene = scene
  { Types.field = GameField.fromPhysicalWorld world $ Types.field scene
  }
  where events = fmap GameEvent.fromPhysicalEvent $ PhysicalWorld.toEvents world

fromEvent :: GameEvent.GameEvent -> Types.LevelScene -> Types.LevelScene
fromEvent (GameEvent.CollisionEvent event) scene = maybe scene id $ do
  Control.Monad.guard (CollisionEvent.from event /= CollisionEvent.into event)
  actorMap <- return $ GameField.toObject $ Types.field scene
  from     <- Data.Map.lookup (CollisionEvent.from event) actorMap
  into     <- Data.Map.lookup (CollisionEvent.into event) actorMap
  return scene
fromEvent _     scene = scene

