{-# LANGUAGE BlockArguments #-}

module Models.QuestionBlockGraphic.Lib
  ( update
  , tick
  ) where

import qualified Control.Monad
import qualified Models.QuestionBlockGraphic.From as From
import qualified Models.QuestionBlockGraphic.Types as Types

update :: Types.QuestionBlockGraphicKey -> Types.QuestionBlockGraphic -> Types.QuestionBlockGraphic
update key x = maybe (From.fromKey key) id $ do
  Control.Monad.guard (Types.key x == key)
  return $ tick x

tick :: Types.QuestionBlockGraphic -> Types.QuestionBlockGraphic
tick x = x { Types.frame = Types.frame x + 1 }
