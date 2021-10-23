module Models.GoombaGraphic.Constants
  ( animationByKey
  , unit
  ) where

import qualified Data.Map
import qualified Assets.Image.Main as Image
import qualified Models.GoombaGraphic.Types as Types

animationByKey :: Data.Map.Map Types.GoombaGraphicKey [Image.Image]
animationByKey = Data.Map.fromList
  [ (Types.Idle,  replicate 5 Image.ImgKuri0)
  , (Types.Walk,  replicate 5 Image.ImgKuri0 ++ replicate 5 Image.ImgKuri1)
  ]

unit :: Types.GoombaGraphic
unit = Types.GoombaGraphic
  { Types.key   = Types.Idle
  , Types.frame = 0
  }
