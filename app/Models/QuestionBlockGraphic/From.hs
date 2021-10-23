{-# LANGUAGE BlockArguments #-}

module Models.QuestionBlockGraphic.From
  ( fromKey
  ) where

import Control.Lens
import Data.Functor (($>))
import qualified Control.Monad
import qualified Models.Velocity.Main as Velocity
import qualified Models.GameObjectDTO.Main as GameObjectDTO
import qualified Models.QuestionBlockGraphic.Constants as Constants
import qualified Models.QuestionBlockGraphic.Types as Types

fromKey :: Types.QuestionBlockGraphicKey -> Types.QuestionBlockGraphic
fromKey key = Types.QuestionBlockGraphic
  { Types.key   = key
  , Types.frame = 0
  }

