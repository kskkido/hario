module Models.Input.From
  ( fromEventPayload
  , fromEventPayloads
  ) where

import qualified SDL.Event
import qualified Data.Maybe
import qualified Control.Arrow
import qualified Models.Input.Types as Types

fromEventPayload :: SDL.Event.EventPayload -> Data.Maybe.Maybe Types.Input
fromEventPayload x | x == SDL.Event.QuitEvent = Data.Maybe.Nothing
                   | otherwise                = return $ Types.Input { Types.payload = x }

fromEventPayloads :: [SDL.Event.EventPayload] -> ([Types.Input], Data.Maybe.Maybe SDL.Event.EventPayload)
fromEventPayloads = run . span (Data.Maybe.isJust . fromEventPayload)
  where run = (Data.Maybe.catMaybes . fmap fromEventPayload) Control.Arrow.*** Data.Maybe.listToMaybe
