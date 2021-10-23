module Models.GameField.Types
  ( GameField(..)
  ) where

import qualified Models.ActorMap.Main as ActorMap

data GameField = GameField
  { background :: ActorMap.ActorMap
  , object     :: ActorMap.ActorMap
  } deriving (Eq, Show)
