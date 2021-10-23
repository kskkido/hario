module Models.Acceleration.Constants
  ( unit
  ) where

import qualified Linear
import qualified Models.Acceleration.Types as Types

unit :: Types.Acceleration
unit = Linear.V2 0 0

