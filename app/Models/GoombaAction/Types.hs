module Models.GoombaAction.Types
  ( GoombaAction(..)
  , GoombaActionKey(..)
  ) where

data GoombaAction = GoombaAction
  { key   :: GoombaActionKey
  , frame :: Integer
  }
  deriving (Eq, Show)

data GoombaActionKey =
    Idle
  | MoveLeft
  | MoveRight
  deriving (Eq, Show, Ord)

