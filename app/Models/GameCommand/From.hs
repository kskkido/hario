{-# LANGUAGE BlockArguments #-}

module Models.GameCommand.From
  ( fromInputs
  , fromKeyboardEventData
  , fromKeyboardEventDatas
  ) where

import qualified Data.Maybe
import qualified Control.Monad
import qualified SDL.Input.Keyboard
import qualified SDL.Input.Keyboard.Codes
import qualified Models.KeyState.Main as KeyState
import qualified Models.Input.Main as Input
import qualified Models.KeyboardEventData.Main as KeyboardEventData
import qualified Models.GameCommand.Constants as Constants
import qualified Models.GameCommand.Types as Types

fromInputs :: [Input.Input] -> Types.GameCommand -> Types.GameCommand
fromInputs xs = fromKeyboardEventDatas (Data.Maybe.catMaybes $ fmap Input.toKeyboardEventData xs)

fromKeyboardEventData :: KeyboardEventData.KeyboardEventData -> Types.GameCommand -> Types.GameCommand
fromKeyboardEventData x command = maybe command id $ do
  keycode <- return $ KeyboardEventData.toKeycode x
  Control.Monad.msum
    [ (\state -> command { Types.up    = state }) <$> (Control.Monad.guard (keycode == SDL.Input.Keyboard.Codes.KeycodeK) >> KeyState.fromKeyboardEventData x)
    , (\state -> command { Types.down  = state }) <$> (Control.Monad.guard (keycode == SDL.Input.Keyboard.Codes.KeycodeJ) >> KeyState.fromKeyboardEventData x)
    , (\state -> command { Types.left  = state }) <$> (Control.Monad.guard (keycode == SDL.Input.Keyboard.Codes.KeycodeH) >> KeyState.fromKeyboardEventData x)
    , (\state -> command { Types.right = state }) <$> (Control.Monad.guard (keycode == SDL.Input.Keyboard.Codes.KeycodeL) >> KeyState.fromKeyboardEventData x)
    , (\state -> command { Types.a     = state }) <$> (Control.Monad.guard (keycode == SDL.Input.Keyboard.Codes.KeycodeSpace) >> KeyState.fromKeyboardEventData x)
    ]

fromKeyboardEventDatas :: [KeyboardEventData.KeyboardEventData] -> Types.GameCommand -> Types.GameCommand
fromKeyboardEventDatas xs command = foldl (flip fromKeyboardEventData) command xs

