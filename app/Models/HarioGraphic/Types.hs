module Models.HarioGraphic.Types
  ( HarioGraphic(..)
  , HarioGraphicKey(..)
  ) where

data HarioGraphic = HarioGraphic
  { key   :: HarioGraphicKey
  , frame :: Integer
  }
  deriving (Eq, Show)

data HarioGraphicKey =
    IdleLeft
  | IdleRight
  | JumpLeft
  | JumpRight
  | WalkLeft
  | WalkRight
  | RunLeft
  | RunRight
  | Crouch
  deriving (Eq, Show, Ord)

