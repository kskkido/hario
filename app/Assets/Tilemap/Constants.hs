module Assets.Tilemap.Constants
  ( unit
  ) where

import qualified Assets.Tilemap.Types as Types

unit :: Types.Tilemap
unit = Types.Tilemap
  { Types.background = []
  , Types.object     = []
  }
