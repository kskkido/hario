module Models.GameObject.To
  ( toGraphic
  , toBoundary
  , toPosition
  , toHario
  , toPhysicalObject
  , toPhysicalObjects
  , toGameEntity
  ) where

import qualified Data.Maybe
import qualified Control.Monad
import qualified Assets.Tile.Main as Tile
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
import qualified Models.Boundary.Main as Boundary
import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.GameEntity.Main as GameEntity
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameObject.Types as Types

toGraphic :: Types.GameObject -> GameGraphic.GameGraphic
toGraphic (Types.Hario object)         =  Hario.toGraphic object
toGraphic (Types.Block object)         =  Block.toGraphic object
toGraphic (Types.Pole object)          =  Pole.toGraphic object
toGraphic (Types.Pipe object)          =  Pipe.toGraphic object
toGraphic (Types.PipeBlock object)     =  PipeBlock.toGraphic object
toGraphic (Types.GroundBlock object)   =  GroundBlock.toGraphic object
toGraphic (Types.RigidBlock object)    =  RigidBlock.toGraphic object
toGraphic (Types.QuestionBlock object) =  QuestionBlock.toGraphic object
toGraphic (Types.Decoration object)    =  Decoration.toGraphic object
toGraphic (Types.Goomba object)        =  Goomba.toGraphic object

toBoundary :: Types.GameObject -> Boundary.Boundary
toBoundary (Types.Hario object)         =  Hario.toBoundary object
toBoundary (Types.Block object)         =  Block.toBoundary object
toBoundary (Types.Pole object)          =  Pole.toBoundary object
toBoundary (Types.Pipe object)          =  Pipe.toBoundary object
toBoundary (Types.PipeBlock object)     =  PipeBlock.toBoundary object
toBoundary (Types.GroundBlock object)   =  GroundBlock.toBoundary object
toBoundary (Types.RigidBlock object)    =  RigidBlock.toBoundary object
toBoundary (Types.QuestionBlock object) =  QuestionBlock.toBoundary object
toBoundary (Types.Decoration object)    =  Decoration.toBoundary object
toBoundary (Types.Goomba object)        =  Goomba.toBoundary object

toPosition :: Types.GameObject -> Position.Position
toPosition (Types.Hario object)         =  Hario.position object
toPosition (Types.Block object)         =  Block.position object
toPosition (Types.Pole object)          =  Pole.position object
toPosition (Types.Pipe object)          =  Pipe.position object
toPosition (Types.PipeBlock object)     =  PipeBlock.position object
toPosition (Types.GroundBlock object)   =  GroundBlock.position object
toPosition (Types.RigidBlock object)    =  RigidBlock.position object
toPosition (Types.QuestionBlock object) =  QuestionBlock.position object
toPosition (Types.Decoration object)    =  Decoration.position object
toPosition (Types.Goomba object)        =  Goomba.position object

toHario :: Types.GameObject -> Data.Maybe.Maybe Types.GameObject
toHario x@(Types.Hario object) = return x
toHario _                      = Data.Maybe.Nothing

toPhysicalObject :: Types.GameObject -> Data.Maybe.Maybe PhysicalObject.PhysicalObject
toPhysicalObject (Types.Hario object)         = return $ Hario.toPhysicalObject object
toPhysicalObject (Types.Block object)         = return $ Block.toPhysicalObject object
toPhysicalObject (Types.Pipe object)          = return $ Pipe.toPhysicalObject object
toPhysicalObject (Types.PipeBlock object)     = return $ PipeBlock.toPhysicalObject object
toPhysicalObject (Types.GroundBlock object)   = return $ GroundBlock.toPhysicalObject object
toPhysicalObject (Types.RigidBlock object)    = return $ RigidBlock.toPhysicalObject object
toPhysicalObject (Types.QuestionBlock object) = return $ QuestionBlock.toPhysicalObject object
toPhysicalObject (Types.Goomba object)        = return $ Goomba.toPhysicalObject object
toPhysicalObject _                            = Data.Maybe.Nothing

toPhysicalObjects :: [Types.GameObject] -> [PhysicalObject.PhysicalObject]
toPhysicalObjects xs = Data.Maybe.catMaybes $ toPhysicalObject <$> xs

toGameEntity :: Types.GameObject -> GameEntity.GameEntity
toGameEntity (Types.Hario  object) = Hario.toGameEntity object
toGameEntity (Types.Goomba object) = Goomba.toGameEntity object
toGameEntity _                     = GameEntity.StaticEntity
