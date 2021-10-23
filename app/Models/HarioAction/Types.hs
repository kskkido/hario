module Models.HarioAction.Types
  ( HarioAction(..)
  , HarioActionKey(..)
  ) where

data HarioAction = HarioAction
  { key   :: HarioActionKey
  , frame :: Integer
  }
  deriving (Eq, Show)

data HarioActionKey =
    Idle
  | Jump
  | MoveLeft
  | MoveRight
  deriving (Eq, Show, Ord)

