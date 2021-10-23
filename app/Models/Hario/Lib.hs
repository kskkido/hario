module Models.Hario.Lib
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
import qualified Models.HarioAction.Main as HarioAction
import qualified Models.HarioGraphic.Main as HarioGraphic
import qualified Models.Hario.From as From
import qualified Models.Hario.To as To
import qualified Models.Hario.Types as Types

modifyGameObjectDTO :: (GameObjectDTO.GameObjectDTO -> GameObjectDTO.GameObjectDTO) -> Types.Hario -> Types.Hario
modifyGameObjectDTO fn x = From.fromGameObjectDTO (fn $ To.toGameObjectDTO x) x

modifyAction :: (HarioAction.HarioAction -> HarioAction.HarioAction) -> Types.Hario -> Types.Hario
modifyAction fn x = x { Types.action = fn $ Types.action x }

modifyGraphic :: (HarioGraphic.HarioGraphic -> HarioGraphic.HarioGraphic) -> Types.Hario -> Types.Hario
modifyGraphic fn x = x { Types.graphic = fn $ Types.graphic x }

modifyPosition :: (Position.Position -> Position.Position) -> Types.Hario -> Types.Hario
modifyPosition fn x = setPosition (fn $ Types.position x) x

modifyVelocity :: (Velocity.Velocity -> Velocity.Velocity) -> Types.Hario -> Types.Hario
modifyVelocity fn x = x { Types.velocity = fn $ Types.velocity x }

modifyAcceleration :: (Acceleration.Acceleration -> Acceleration.Acceleration) -> Types.Hario -> Types.Hario
modifyAcceleration fn x = x { Types.acceleration = fn $ Types.acceleration x }

setAction :: HarioAction.HarioAction -> Types.Hario -> Types.Hario
setAction action = modifyAction $ const action

setPosition :: Position.Position -> Types.Hario -> Types.Hario
setPosition position x = x { Types.position = position }

setVelocity :: Velocity.Velocity -> Types.Hario -> Types.Hario
setVelocity v = modifyVelocity $ const v

setGraphic :: HarioGraphic.HarioGraphic -> Types.Hario -> Types.Hario
setGraphic graphic = modifyGraphic $ const graphic

updateAction :: HarioAction.HarioActionKey -> Types.Hario -> Types.Hario
updateAction = modifyAction . HarioAction.update

updateGraphic :: HarioGraphic.HarioGraphicKey -> Types.Hario -> Types.Hario
updateGraphic = modifyGraphic . HarioGraphic.update
