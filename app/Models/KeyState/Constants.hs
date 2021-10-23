module Models.KeyState.Constants
  ( unit
  ) where

import qualified Models.KeyState.Types as Types

unit :: Types.KeyState
unit = Types.KeyState
  { Types.status = Types.Released
  }
