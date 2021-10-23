module Models.KeyState.To
  ( toPressed
  , toReleased
  ) where

import qualified Data.Maybe
import qualified Control.Monad
import qualified Models.KeyState.Types as Types

toPressed :: Types.KeyState -> Data.Maybe.Maybe Types.KeyState
toPressed x = do
  Control.Monad.guard (Types.status x == Types.Pressed)
  return $ x

toReleased :: Types.KeyState -> Data.Maybe.Maybe Types.KeyState
toReleased x = do
  Control.Monad.guard (Types.status x == Types.Released)
  return $ x
