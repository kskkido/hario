module Models.Goomba.To
  ( toGraphic
  , toGraphicKey
  , toActionKey
  , toBoundary
  , toVelocity
  , toAcceleration
  , toPhysicalObject
  , toGameEntity
  , toGameObjectDTO
  ) where

import Control.Lens
import qualified Linear
import qualified Data.Maybe
import qualified Control.Monad
import qualified Assets.Image.Main as Image
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.Direction.Main as Direction
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Velocity.Main as Velocity
import qualified Models.Solid.Main as Solid
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameGraphicLayer.Main as GameGraphicLayer
import qualified Models.GameEntity.Main as GameEntity
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.GoombaGraphic.Main as GoombaGraphic
import qualified Models.GoombaAction.Main as GoombaAction
import qualified Models.Goomba.Types as Types

toGraphic :: Types.Goomba -> GameGraphic.GameGraphic
toGraphic x = GameGraphic.GameGraphic
  { GameGraphic.layer     = GameGraphicLayer.Character
  , GameGraphic.image     = GoombaGraphic.toImage $ Types.graphic x
  , GameGraphic.position  = Types.position x
  , GameGraphic.dimension = Types.dimension x
  }

toGraphicKey :: Types.Goomba -> GoombaGraphic.GoombaGraphicKey
toGraphicKey = GoombaGraphic.key . Types.graphic

toActionKey :: Types.Goomba -> GoombaAction.GoombaActionKey
toActionKey = GoombaAction.key . Types.action

toBoundary :: Types.Goomba -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }

toVelocity :: Types.Goomba -> Velocity.Velocity
toVelocity = Types.velocity

toAcceleration :: Types.Goomba -> Acceleration.Acceleration
toAcceleration = Types.acceleration

toPhysicalObject :: Types.Goomba -> PhysicalObject.PhysicalObject
toPhysicalObject x = PhysicalObject.Solid $ Solid.Solid
  { Solid.mass = 0
  , Solid.friction = 0
  , Solid.boundary = toBoundary x
  , Solid.velocity = toVelocity x
  , Solid.acceleration = Acceleration.fromY (0.2)
  }

toGameEntity :: Types.Goomba -> GameEntity.GameEntity
toGameEntity _ = GameEntity.EnemyEntity

toGameObjectDTO :: Types.Goomba -> GameObjectDTO.GameObjectDTO
toGameObjectDTO x = GameObjectDTO.GameObjectDTO
  { GameObjectDTO.position     = Types.position x
  , GameObjectDTO.dimension    = Types.dimension x
  , GameObjectDTO.velocity     = Types.velocity x
  , GameObjectDTO.acceleration = Types.acceleration x
  }
