{-# LANGUAGE BlockArguments #-}

module Models.HarioGraphic.Lib
  ( update
  , tick
  ) where

import qualified Control.Monad
import qualified Models.HarioGraphic.From as From
import qualified Models.HarioGraphic.Types as Types

update :: Types.HarioGraphicKey -> Types.HarioGraphic -> Types.HarioGraphic
update key x = maybe (From.fromKey key) id $ do
  Control.Monad.guard (Types.key x == key)
  return $ tick x

tick :: Types.HarioGraphic -> Types.HarioGraphic
tick x = x { Types.frame = Types.frame x + 1 }
