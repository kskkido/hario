module Models.HarioGraphic.Constants
  ( animationByKey
  , unit
  ) where

import qualified Data.Map
import qualified Assets.Image.Main as Image
import qualified Models.HarioGraphic.Types as Types

animationByKey :: Data.Map.Map Types.HarioGraphicKey [Image.Image]
animationByKey = Data.Map.fromList
  [ (Types.IdleLeft,  replicate 5 Image.ImgNarioLStand)
  , (Types.IdleRight, replicate 5 Image.ImgNarioRStand)
  , (Types.JumpLeft,  replicate 5 Image.ImgNarioLJump)
  , (Types.JumpRight, replicate 5 Image.ImgNarioRJump)
  , (Types.WalkLeft,  replicate 5 Image.ImgNarioLWalk1 ++ replicate 5 Image.ImgNarioLWalk2 ++ replicate 5 Image.ImgNarioLWalk3)
  , (Types.WalkRight, replicate 5 Image.ImgNarioRWalk1 ++ replicate 5 Image.ImgNarioRWalk2 ++ replicate 5 Image.ImgNarioRWalk3)
  ]

unit :: Types.HarioGraphic
unit = Types.HarioGraphic
  { Types.key   = Types.IdleRight
  , Types.frame = 0
  }
