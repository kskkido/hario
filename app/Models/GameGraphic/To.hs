module Models.GameGraphic.To
  ( toImageResource
  , toBoundary
  ) where

import Control.Lens
import qualified Linear
import qualified Data.Maybe
import qualified Assets.ImageResource.Main as ImageResource
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameGraphic.Types as Types

toImageResource :: Types.GameGraphic -> [ImageResource.ImageResource] -> Data.Maybe.Maybe ImageResource.ImageResource
toImageResource = ImageResource.find . Types.image

toBoundary :: Types.GameGraphic -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }
