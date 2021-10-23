module Models.Hario.To
  ( toGraphic
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
import qualified Models.GameEntity.Main as GameEntity
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameGraphicLayer.Main as GameGraphicLayer
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.HarioGraphic.Main as HarioGraphic
import qualified Models.HarioAction.Main as HarioAction
import qualified Models.Hario.Types as Types

toGraphic :: Types.Hario -> GameGraphic.GameGraphic
toGraphic x = GameGraphic.GameGraphic
  { GameGraphic.layer     = GameGraphicLayer.Player
  , GameGraphic.image     = HarioGraphic.toImage $ Types.graphic x
  , GameGraphic.position  = Types.position x
  , GameGraphic.dimension = Types.dimension x
  }

toActionKey :: Types.Hario -> HarioAction.HarioActionKey
toActionKey = HarioAction.key . Types.action

toGraphicKey :: Types.Hario -> HarioGraphic.HarioGraphicKey
toGraphicKey = HarioGraphic.key . Types.graphic

toBoundary :: Types.Hario -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }

toVelocity :: Types.Hario -> Velocity.Velocity
toVelocity = Types.velocity

toAcceleration :: Types.Hario -> Acceleration.Acceleration
toAcceleration = Types.acceleration

toPhysicalObject :: Types.Hario -> PhysicalObject.PhysicalObject
toPhysicalObject x = PhysicalObject.Solid $ Solid.Solid
  { Solid.mass = 0
  , Solid.friction = 0
  , Solid.boundary = toBoundary x
  , Solid.velocity = toVelocity x
  , Solid.acceleration = Acceleration.fromY (0.2)
  }

toGameEntity :: Types.Hario -> GameEntity.GameEntity
toGameEntity _ = GameEntity.PlayerEntity

toGameObjectDTO :: Types.Hario -> GameObjectDTO.GameObjectDTO
toGameObjectDTO x = GameObjectDTO.GameObjectDTO
  { GameObjectDTO.position     = Types.position x
  , GameObjectDTO.dimension    = Types.dimension x
  , GameObjectDTO.velocity     = Types.velocity x
  , GameObjectDTO.acceleration = Types.acceleration x
  }
