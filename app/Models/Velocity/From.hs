module Models.Velocity.From
  ( fromX
  , fromY
  ) where

import Control.Lens
import qualified Linear
import qualified Models.Velocity.Constants as Constants
import qualified Models.Velocity.Types as Types

fromX :: Float -> Types.Velocity
fromX x = Constants.unit & Linear._x .~ x

fromY :: Float -> Types.Velocity
fromY y = Constants.unit & Linear._y .~ y
