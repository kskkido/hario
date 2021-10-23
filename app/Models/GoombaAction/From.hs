module Models.GoombaAction.From
  ( fromKey
  ) where

import qualified Models.GoombaAction.Types as Types

fromKey :: Types.GoombaActionKey -> Types.GoombaAction
fromKey key = Types.GoombaAction
  { Types.key   = key
  , Types.frame = 0
  }

