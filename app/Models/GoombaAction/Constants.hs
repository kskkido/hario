module Models.GoombaAction.Constants
  ( unit
  ) where

import qualified Data.Map
import qualified Models.GoombaAction.Types as Types

unit :: Types.GoombaAction
unit = Types.GoombaAction
  { Types.key   = Types.Idle
  , Types.frame = 0
  }
