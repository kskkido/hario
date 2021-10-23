module Models.Block.To
  ( toGraphic
  , toBoundary
  , toHitBox
  , toPhysicalObject
  ) where

import Control.Lens
import qualified Linear
import qualified Data.Maybe
import qualified Assets.Image.Main as Image
import qualified Models.Static.Main as Static
import qualified Models.PhysicalObject.Main as PhysicalObject
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Boundary.Main as Boundary
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity
import qualified Models.Dimension.Main as Dimension
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameGraphicLayer.Main as GameGraphicLayer
import qualified Models.Block.Types as Types

toGraphic :: Types.Block -> GameGraphic.GameGraphic
toGraphic x = GameGraphic.GameGraphic
  { GameGraphic.layer     = GameGraphicLayer.Object
  , GameGraphic.image     = Image.ImgBlock2
  , GameGraphic.position  = Types.position x
  , GameGraphic.dimension = Types.dimension x
  }

toBoundary :: Types.Block -> Boundary.Boundary
toBoundary x = Boundary.Rect
  { Boundary.position  = Types.position x
  , Boundary.dimension = Types.dimension x
  }

toHitBox :: Types.Block -> Data.Maybe.Maybe Boundary.Boundary
toHitBox x = return $ toBoundary x

toPhysicalObject :: Types.Block -> PhysicalObject.PhysicalObject
toPhysicalObject x = PhysicalObject.Static $ Static.Static
  { Static.mass = 0
  , Static.friction = 1
  , Static.boundary = toBoundary x
  , Static.velocity = Velocity.unit
  , Static.acceleration = Acceleration.unit
  }
