module Models.HarioAction.Constants
  ( unit
  ) where

import qualified Data.Map
import qualified Models.HarioAction.Types as Types

unit :: Types.HarioAction
unit = Types.HarioAction
  { Types.key   = Types.Idle
  , Types.frame = 0
  }
