{-# LANGUAGE BlockArguments #-}

module Models.GoombaGraphic.From
  ( fromKey
  , fromGameObjectDTO
  ) where

import Control.Lens
import Data.Functor (($>))
import qualified Control.Monad
import qualified Models.Velocity.Main as Velocity
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.GoombaGraphic.Constants as Constants
import qualified Models.GoombaGraphic.Types as Types

fromKey :: Types.GoombaGraphicKey -> Types.GoombaGraphic
fromKey key = Types.GoombaGraphic
  { Types.key   = key
  , Types.frame = 0
  }

fromGameObjectDTO :: GameObjectDTO.GameObjectDTO -> Types.GoombaGraphic
fromGameObjectDTO dto = maybe Constants.unit id $ do
  velocity <- return $ dto ^. GameObjectDTO._velocity
  Control.Monad.msum
    [ Control.Monad.guard (velocity /= Velocity.unit) $> fromKey Types.Walk
    , Control.Monad.guard (velocity == Velocity.unit) $> fromKey Types.Idle
    ]
