module Models.Motion.Constants
  ( empty
  ) where

import qualified Linear
import qualified Models.Motion.Types as Types

empty :: Types.Motion
empty = Types.Motion
  { Types.velocity = Linear.V2 0 0
  , Types.acceleration = Linear.V2 0 0
  }
