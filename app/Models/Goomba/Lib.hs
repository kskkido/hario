module Models.Goomba.Lib
  ( modifyGameObjectDTO
  , modifyAction
  , modifyGraphic
  , modifyPosition
  , modifyVelocity
  , modifyAcceleration
  , setAction
  , setPosition
  , setVelocity
  , updateAction
  , updateGraphic
  ) where

import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.GoombaAction.Main as GoombaAction
import qualified Models.GoombaGraphic.Main as GoombaGraphic
import qualified Models.Goomba.From as From
import qualified Models.Goomba.To as To
import qualified Models.Goomba.Types as Types

modifyGameObjectDTO :: (GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO) -> Types.Goomba -> Types.Goomba
modifyGameObjectDTO fn x = From.fromGameObjectDTO (fn $ To.toGameObjectDTO x) x

modifyAction :: (GoombaAction.GoombaAction -> GoombaAction.GoombaAction) -> Types.Goomba -> Types.Goomba
modifyAction fn x = x { Types.action = fn $ Types.action x }

modifyGraphic :: (GoombaGraphic.GoombaGraphic -> GoombaGraphic.GoombaGraphic) -> Types.Goomba -> Types.Goomba
modifyGraphic fn x = x { Types.graphic = fn $ Types.graphic x }

modifyPosition :: (Position.Position -> Position.Position) -> Types.Goomba -> Types.Goomba
modifyPosition fn x = setPosition (fn $ Types.position x) x

modifyVelocity :: (Velocity.Velocity -> Velocity.Velocity) -> Types.Goomba -> Types.Goomba
modifyVelocity fn x = x { Types.velocity = fn $ Types.velocity x }

modifyAcceleration :: (Acceleration.Acceleration -> Acceleration.Acceleration) -> Types.Goomba -> Types.Goomba
modifyAcceleration fn x = x { Types.acceleration = fn $ Types.acceleration x }

setAction :: GoombaAction.GoombaAction -> Types.Goomba -> Types.Goomba
setAction action = modifyAction $ const action

setPosition :: Position.Position -> Types.Goomba -> Types.Goomba
setPosition position x = x { Types.position = position }

setVelocity :: Velocity.Velocity -> Types.Goomba -> Types.Goomba
setVelocity v = modifyVelocity $ const v

setGraphic :: GoombaGraphic.GoombaGraphic -> Types.Goomba -> Types.Goomba
setGraphic graphic = modifyGraphic $ const graphic

updateAction :: GoombaAction.GoombaActionKey -> Types.Goomba -> Types.Goomba
updateAction = modifyAction . GoombaAction.update

updateGraphic :: GoombaGraphic.GoombaGraphicKey -> Types.Goomba -> Types.Goomba
updateGraphic = modifyGraphic . GoombaGraphic.update
