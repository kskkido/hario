{-# LANGUAGE TupleSections #-}

module Assets.ImageResource.Lib
  ( find
  ) where

import qualified Data.Maybe
import qualified Assets.Image.Main as Image
import qualified Assets.ImageResource.Types as Types

find :: Image.Image -> [Types.ImageResource] -> Data.Maybe.Maybe Types.ImageResource
find image resources = (image,) <$> lookup image resources
