module Models.KeyboardEventData.Lib
  ( findByKeycode
  ) where

import qualified Control.Monad
import qualified Data.List
import qualified Data.Maybe
import qualified SDL.Input.Keyboard
import qualified Models.KeyboardEventData.To as To
import qualified Models.KeyboardEventData.Types as Types

findByKeycode :: SDL.Input.Keyboard.Keycode -> [Types.KeyboardEventData] -> Data.Maybe.Maybe Types.KeyboardEventData
findByKeycode keycode = Data.List.find ((== keycode) . To.toKeycode)
