module Models.GameCommand.Constants
  ( unit
  ) where

import qualified Models.KeyState.Main as KeyState
import qualified Models.GameCommand.Types as Types

unit :: Types.GameCommand
unit = Types.GameCommand
  { Types.up    = KeyState.unit
  , Types.down  = KeyState.unit
  , Types.left  = KeyState.unit
  , Types.right = KeyState.unit
  , Types.a     = KeyState.unit
  , Types.b     = KeyState.unit
  }
