module Models.GameCommand.Types
  ( GameCommand(..)
  ) where

import qualified Models.KeyState.Main as KeyState

data GameCommand = GameCommand
  { up    :: KeyState.KeyState
  , down  :: KeyState.KeyState
  , left  :: KeyState.KeyState
  , right :: KeyState.KeyState
  , a     :: KeyState.KeyState
  , b     :: KeyState.KeyState
  }
    deriving (Eq, Show)

