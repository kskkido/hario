module Models.Friction.To
  ( toFrictionX
  , toFrictionY
  ) where

import Control.Lens
import qualified Linear
import qualified Models.Friction.Types as Types

toFrictionX :: Types.Friction -> Types.Friction
toFrictionX = Linear._y .~ 0

toFrictionY :: Types.Friction -> Types.Friction
toFrictionY = Linear._x .~ 0

