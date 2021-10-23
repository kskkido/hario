{-# LANGUAGE BlockArguments #-}

module Models.QuestionBlockGraphic.To
  ( toImage
  , toKey
  ) where

import qualified Data.Map
import qualified Data.Maybe
import qualified Control.Monad
import qualified Assets.Image.Main as Image
import qualified Models.QuestionBlockGraphic.Constants as Constants
import qualified Models.QuestionBlockGraphic.Types as Types

toImage :: Types.QuestionBlockGraphic -> Image.Image
toImage x = maybe Image.ImgNarioRStand id $ do
  animation <- Data.Map.lookup (toKey x) Constants.animationByKey
  limit     <- return $ length animation
  frame     <- return $ Types.frame x `mod` toInteger limit
  Data.Maybe.listToMaybe $ drop (fromInteger frame) animation

toKey :: Types.QuestionBlockGraphic -> Types.QuestionBlockGraphicKey
toKey = Types.key

