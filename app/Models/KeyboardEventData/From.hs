module Models.KeyboardEventData.From
  ( fromEventPayload
  ) where

import qualified SDL.Event
import qualified Control.Monad
import qualified Data.Maybe
import qualified SDL.Input.Keyboard
import qualified Models.KeyboardEventData.Types as Types

fromEventPayload :: SDL.Event.EventPayload -> Data.Maybe.Maybe Types.KeyboardEventData
fromEventPayload (SDL.Event.KeyboardEvent event) = Data.Maybe.Just event
fromEventPayload _                               = Data.Maybe.Nothing

