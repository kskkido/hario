module Models.Acceleration.From
  ( fromY
  ) where

import Control.Lens
import qualified Linear
import qualified Models.Acceleration.Constants as Constants
import qualified Models.Acceleration.Types as Types

fromY :: Float -> Types.Acceleration
fromY n = Constants.unit & Linear._y .~ n
