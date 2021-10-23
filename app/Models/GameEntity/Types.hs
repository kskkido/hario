module Models.GameEntity.Types
  ( GameEntity(..)
  ) where

data GameEntity =
    PlayerEntity
  | EnemyEntity
  | StaticEntity
    deriving (Eq, Show)
