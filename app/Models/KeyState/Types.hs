module Models.KeyState.Types
  ( KeyState(..)
  , Status(..)
  ) where

data KeyState = KeyState
  { status :: Status
  } deriving (Eq, Show)

data Status =
    Pressed
  | Released
    deriving (Eq, Show)
