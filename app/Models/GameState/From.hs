module Models.GameState.From
  ( fromResource
  , fromPhysicalWorld
  ) where

import qualified Linear
import qualified Data.Map
import qualified Data.UUID
import qualified System.Random
import qualified Configs.App.Main as Config
import qualified Models.Level.Main as Level
import qualified Models.Hario.Main as Hario
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameResource.Main as GameResource
import qualified Models.GameState.Types as Types

fromResource :: GameResource.GameResource -> Config.Config -> Types.GameState
fromResource resource config = undefined
-- fromResource resource config = Types.GameState
--   { Types.frame    = 0
--   , Types.camera   = GameCamera.fromConfig config
--   , Types.actorMap = ActorMap.fromActors $ zipWith (flip Actor.fromObject)
--       (System.Random.randoms $ System.Random.mkStdGen 0)
--       (GameObject.Hario (Hario.fromPosition (GameResource.toPosition (Linear.V2 3 12) resource config) config) : GameObject.fromTilemap (GameResource.tilemap resource) config)
--   }

fromPhysicalWorld :: PhysicalWorld.PhysicalWorld -> Types.GameState -> Types.GameState
fromPhysicalWorld world state = undefined
--fromPhysicalWorld world state = state
--  { Types.actorMap = ActorMap.fromPhysicalEntityMap
--      (PhysicalWorld.entityMap world)
--      (Types.actorMap state)
--  }
