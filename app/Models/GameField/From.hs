module Models.GameField.From
  ( fromTilemap
  , fromLevel
  , fromPhysicalWorld
  ) where

import qualified System.Random
import qualified Configs.App.Main as Config
import qualified Assets.Tilemap.Main as Tilemap
import qualified Models.Level.Main as Level
import qualified Models.Actor.Main as Actor
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.PhysicalWorld.Main as PhysicalWorld
import qualified Models.GameMeta.Main as GameMeta
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameField.Types as Types

fromTilemap :: Tilemap.Tilemap -> GameMeta.GameMeta -> Config.Config -> Types.GameField
fromTilemap tilemap meta = do
  frame      <- return $ GameMeta.frame meta
  uuids      <- return $ System.Random.randoms $ System.Random.mkStdGen frame
  background <- GameObject.fromTileLayer $ Tilemap.background tilemap
  object     <- GameObject.fromTileLayer $ Tilemap.object tilemap
  return $ Types.GameField
    { Types.background = ActorMap.fromActors $ zipWith Actor.fromObject background uuids
    , Types.object     = ActorMap.fromActors $ zipWith Actor.fromObject object (drop (length background) uuids)
    }

fromLevel :: Level.Level -> GameMeta.GameMeta -> Config.Config -> IO Types.GameField
fromLevel level meta config = do
  tilemap <- Tilemap.fromPath (Level.toPath level) config
  return $ fromTilemap tilemap meta config

fromPhysicalWorld :: PhysicalWorld.PhysicalWorld -> Types.GameField -> Types.GameField
fromPhysicalWorld world field = field
  { Types.object = ActorMap.fromPhysicalEntityMap (PhysicalWorld.entityMap world) (Types.object field)
  }
