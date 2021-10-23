module Models.Input.Types
  ( Input(..)
  ) where

import qualified SDL.Event

data Input = Input
  { payload :: SDL.Event.EventPayload
  } deriving (Eq, Show)
