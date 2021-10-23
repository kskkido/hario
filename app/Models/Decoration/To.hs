module Models.Decoration.To
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
import qualified Models.Decoration.Types as Types

toGraphic :: Types.Decoration -> GameGraphic.GameGraphic
toGraphic x = GameGraphic.GameGraphic
  { GameGraphic.layer     = GameGraphicLayer.Decoration
  , GameGraphic.image     = toImage x
  , GameGraphic.position  = Types.position x
  , GameGraphic.dimension = Types.dimension x
  }

toImage :: Types.Decoration -> Image.Image
toImage x = case Types.variant x of
  Types.Cloud0 -> Image.ImgCloud00
  Types.Cloud1 -> Image.ImgCloud01
  Types.Cloud2 -> Image.ImgCloud02
  Types.Cloud3 -> Image.ImgCloud10
  Types.Cloud4 -> Image.ImgCloud11
  Types.Cloud5 -> Image.ImgCloud12
  Types.Grass0 -> Image.ImgGrass0
  Types.Grass1 -> Image.ImgGrass1
  Types.Grass2 -> Image.ImgGrass2
  Types.Mountain0 -> Image.ImgMt02
  Types.Mountain1 -> Image.ImgMt11
  Types.Mountain2 -> Image.ImgMt12
  Types.Mountain3 -> Image.ImgMt13
  Types.Mountain4 -> Image.ImgMt22

toBoundary :: Types.Decoration -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }

toHitBox :: Types.Decoration -> Data.Maybe.Maybe Boundary.Boundary
toHitBox x = Data.Maybe.Nothing
