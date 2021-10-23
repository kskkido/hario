module Models.HarioAction.From
  ( fromKey
  ) where

import qualified Models.HarioAction.Types as Types

fromKey :: Types.HarioActionKey -> Types.HarioAction
fromKey key = Types.HarioAction
  { Types.key   = key
  , Types.frame = 0
  }

