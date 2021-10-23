{-# LANGUAGE BlockArguments #-}

module Models.HarioGraphic.From
  ( fromKey
  , fromGameObjectDTO
  ) where

import Control.Lens
import Data.Functor (($>))
import qualified Control.Monad
import qualified Models.Velocity.Main as Velocity
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.HarioGraphic.Constants as Constants
import qualified Models.HarioGraphic.Types as Types

fromKey :: Types.HarioGraphicKey -> Types.HarioGraphic
fromKey key = Types.HarioGraphic
  { Types.key   = key
  , Types.frame = 0
  }

fromGameObjectDTO :: GameObjectDTO.GameObjectDTO -> Types.HarioGraphic
fromGameObjectDTO dto = maybe Constants.unit id $ do
  velocity <- return $ dto ^. GameObjectDTO._velocity
  Control.Monad.msum
    [ Control.Monad.guard (Velocity.toY velocity /= 0) $> fromKey Types.JumpRight
    , Control.Monad.guard (-0.05 < Velocity.toX velocity && Velocity.toX velocity < 0.05) $> fromKey Types.IdleRight
    , Control.Monad.guard (Velocity.toX velocity <  0) $> fromKey Types.WalkLeft
    , Control.Monad.guard (Velocity.toX velocity >  0) $> fromKey Types.WalkRight
    ]
