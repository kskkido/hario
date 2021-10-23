module Models.Sprite.Types
  ( Sprite(..)
  ) where

import qualified Assets.Image.Main as Image

data Sprite = Sprite
  { image :: Image.Image
  } deriving(Eq, Show)
