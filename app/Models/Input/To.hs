module Models.Input.To
  ( toKeyboardEventData
  ) where

import qualified Data.Maybe
import qualified Models.KeyboardEventData.Main as KeyboardEventData
import qualified Models.Input.Types as Types

toKeyboardEventData :: Types.Input -> Data.Maybe.Maybe KeyboardEventData.KeyboardEventData
toKeyboardEventData = KeyboardEventData.fromEventPayload . Types.payload
