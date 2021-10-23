module Models.GameObject.From
  ( fromTile
  , fromTileLayer
  , fromPhysicalObjectDTO
  ) where

import qualified Data.Maybe
import qualified Control.Monad
import qualified Assets.Tile.Main as Tile
import qualified Assets.TileLayer.Main as TileLayer
import qualified Configs.App.Main as Config
import qualified Models.Hario.Main as Hario
import qualified Models.Block.Main as Block
import qualified Models.Pole.Main as Pole
import qualified Models.Pipe.Main as Pipe
import qualified Models.PipeBlock.Main as PipeBlock
import qualified Models.GroundBlock.Main as GroundBlock
import qualified Models.RigidBlock.Main as RigidBlock
import qualified Models.QuestionBlock.Main as QuestionBlock
import qualified Models.Decoration.Main as Decoration
import qualified Models.Goomba.Main as Goomba
import qualified Models.GameObject.Types as Types
import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position
import qualified Models.PhysicalObjectDTO.Main as PhysicalObjectDTO
import qualified Models.GameObject.Types as Types

fromTile :: Tile.Tile -> Position.Position -> Dimension.Dimension -> Data.Maybe.Maybe Types.GameObject
fromTile tile position dimension =
  Control.Monad.msum $
    [ Types.Block         <$> Block.fromTile         tile position dimension
    , Types.Pole          <$> Pole.fromTile          tile position dimension
    , Types.Pipe          <$> Pipe.fromTile          tile position dimension
    , Types.PipeBlock     <$> PipeBlock.fromTile     tile position dimension
    , Types.GroundBlock   <$> GroundBlock.fromTile   tile position dimension
    , Types.RigidBlock    <$> RigidBlock.fromTile    tile position dimension
    , Types.QuestionBlock <$> QuestionBlock.fromTile tile position dimension
    , Types.Decoration    <$> Decoration.fromTile    tile position dimension
    , Types.Hario         <$> Hario.fromTile         tile position dimension
    , Types.Goomba        <$> Goomba.fromTile        tile position dimension
    ]

fromTileLayer :: TileLayer.TileLayer -> Config.Config -> [Types.GameObject]
fromTileLayer layer config = Data.Maybe.catMaybes $ concat $ zipWith line [0..] layer
  where line y as     = zipWith (cell y) [0..] as
        cell y x a    = fromTile a (position x y) dimension
        position x y  = Position.from  (fromIntegral $ Config.gameTileWidth config * x) (fromIntegral $ Config.gameTileHeight config * y)
        dimension     = Dimension.from (fromIntegral $ Config.gameTileWidth config) (fromIntegral $ Config.gameTileHeight config)

fromPhysicalObjectDTO :: PhysicalObjectDTO.PhysicalObjectDTO -> Types.GameObject -> Types.GameObject
fromPhysicalObjectDTO dto (Types.Hario  object) = Types.Hario  $ Hario.fromPhysicalObjectDTO dto object
fromPhysicalObjectDTO dto (Types.Goomba object) = Types.Goomba $ Goomba.fromPhysicalObjectDTO dto object
fromPhysicalObjectDTO dto x                    = x
