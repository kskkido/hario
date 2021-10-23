module Models.QuestionBlockGraphic.Constants
  ( animationByKey
  , unit
  ) where

import qualified Data.Map
import qualified Assets.Image.Main as Image
import qualified Models.QuestionBlockGraphic.Types as Types

animationByKey :: Data.Map.Map Types.QuestionBlockGraphicKey [Image.Image]
animationByKey = Data.Map.fromList
  [ (Types.Idle,  replicate 20 Image.ImgBlock4 ++ replicate 20 Image.ImgBlock5)
  ]

unit :: Types.QuestionBlockGraphic
unit = Types.QuestionBlockGraphic
  { Types.key   = Types.Idle
  , Types.frame = 0
  }
