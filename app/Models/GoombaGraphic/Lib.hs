{-# LANGUAGE BlockArguments #-}

module Models.GoombaGraphic.Lib
  ( update
  , tick
  ) where

import qualified Control.Monad
import qualified Models.GoombaGraphic.From as From
import qualified Models.GoombaGraphic.Types as Types

update :: Types.GoombaGraphicKey -> Types.GoombaGraphic -> Types.GoombaGraphic
update key x = maybe (From.fromKey key) id $ do
  Control.Monad.guard (Types.key x == key)
  return $ tick x

tick :: Types.GoombaGraphic -> Types.GoombaGraphic
tick x = x { Types.frame = Types.frame x + 1 }
