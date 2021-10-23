module Models.GoombaGraphic.Types
  ( GoombaGraphic(..)
  , GoombaGraphicKey(..)
  ) where

data GoombaGraphic = GoombaGraphic
  { key   :: GoombaGraphicKey
  , frame :: Integer
  }
  deriving (Eq, Show)

data GoombaGraphicKey =
    Idle
  | Walk
  deriving (Eq, Show, Ord)

