module Models.Pole.To
  ( toGraphic
  , toImage
  , toBoundary
  , toHitBox
  ) where

import Control.Lens
import qualified Linear
import qualified Data.Maybe
import qualified Assets.Image.Main as Image
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameGraphicLayer.Main as GameGraphicLayer
import qualified Models.Pole.Types as Types

toGraphic :: Types.Pole -> GameGraphic.GameGraphic
toGraphic x = GameGraphic.GameGraphic
  { GameGraphic.layer     = GameGraphicLayer.Object
  , GameGraphic.image     = toImage x
  , GameGraphic.position  = Types.position x
  , GameGraphic.dimension = Types.dimension x
  }

toImage :: Types.Pole -> Image.Image
toImage x = case Types.variant x of
  Types.Tip -> Image.ImgPole0
  Types.Bar -> Image.ImgPole1

toBoundary :: Types.Pole -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }

toHitBox :: Types.Pole -> Data.Maybe.Maybe Boundary.Boundary
toHitBox x = return $ toBoundary x
