module Assets.Tile.Types
  ( Tile(..)
  , Variant(..)
  ) where

data Tile = Tile
  { variant :: Variant
  }

data Variant =
    Block0
  | Block1
  | Block2
  | Block3
  | Block4
  | Block5
  | Mountain0
  | Mountain1
  | Mountain2
  | Mountain3
  | Mountain4
  | Cloud0
  | Cloud1
  | Cloud2
  | Cloud3
  | Cloud4
  | Cloud5
  | Grass0
  | Grass1
  | Grass2
  | Pipe0
  | Pipe1
  | Pipe2
  | Pipe3
  | Pole0
  | Pole1
  | Hario0
  | Goomba0
  | Empty
    deriving (Eq, Show)
