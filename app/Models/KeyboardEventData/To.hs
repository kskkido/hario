module Models.KeyboardEventData.To
  ( toKeyPressed
  , toKeyReleased
  , toKeyMotion
  , toKeycode
  , toKeysym
  , toKeyRepeat
  ) where

import qualified Control.Monad
import qualified Data.Maybe
import qualified SDL.Event
import qualified SDL.Input.Keyboard
import qualified Models.KeyboardEventData.Types as Types

toKeyPressed :: Types.KeyboardEventData -> Data.Maybe.Maybe Types.KeyboardEventData
toKeyPressed x = do
  Control.Monad.guard (toKeyMotion x == SDL.Event.Pressed)
  return $ x

toKeyReleased :: Types.KeyboardEventData -> Data.Maybe.Maybe Types.KeyboardEventData
toKeyReleased x = do
  Control.Monad.guard (toKeyMotion x == SDL.Event.Released)
  return $ x

toKeyMotion :: Types.KeyboardEventData -> SDL.Event.InputMotion
toKeyMotion = Types.keyboardEventKeyMotion

toKeycode :: Types.KeyboardEventData -> SDL.Input.Keyboard.Keycode
toKeycode = SDL.Input.Keyboard.keysymKeycode . toKeysym

toKeysym :: Types.KeyboardEventData -> SDL.Input.Keyboard.Keysym
toKeysym = Types.keyboardEventKeysym

toKeyRepeat :: Types.KeyboardEventData -> Bool
toKeyRepeat = Types.keyboardEventRepeat
