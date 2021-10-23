{-# LANGUAGE BlockArguments #-}

module Models.KeyState.From
  ( fromBool
  , fromKeyboardEventData
  ) where

import Data.Functor (($>))
import qualified Data.Maybe
import qualified Control.Monad
import qualified Models.KeyboardEventData.Main as KeyboardEventData
import qualified Models.KeyState.Constants as Constants
import qualified Models.KeyState.Types as Types

fromBool :: Bool -> Types.KeyState
fromBool True  = Types.KeyState { Types.status = Types.Pressed }
fromBool False = Types.KeyState { Types.status = Types.Released }

fromKeyboardEventData x = do
  Control.Monad.guard (not $ KeyboardEventData.toKeyRepeat x)
  status <- Control.Monad.msum
    [ KeyboardEventData.toKeyPressed  x $> Types.Pressed
    , KeyboardEventData.toKeyReleased x $> Types.Released
    ]
  return $ Types.KeyState
    { Types.status = status
    }
