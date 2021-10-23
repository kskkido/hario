module Models.GameMeta.Types
  ( GameMeta(..)
  ) where

data GameMeta = GameMeta
  { frame :: Int
  } deriving (Eq, Show)
