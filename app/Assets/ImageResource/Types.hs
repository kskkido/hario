module Assets.ImageResource.Types
  ( ImageResource
  ) where

import qualified SDL
import qualified Assets.Image.Types

type ImageResource = (Assets.Image.Types.Image, SDL.Surface)
