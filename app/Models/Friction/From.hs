{-# LANGUAGE BlockArguments #-}

module Models.Friction.From
  ( fromVelocity
  ) where

import qualified Control.Monad
import qualified Linear.Metric
import qualified Models.Velocity.Main as Velocity
import qualified Models.Friction.Types as Types

fromVelocity :: Float -> Velocity.Velocity -> Types.Friction
fromVelocity scalar velocity = maybe (Velocity.reverse velocity) id $ do
  normalized <- return $ Linear.Metric.normalize $ Velocity.reverse velocity
  friction   <- return $ (* scalar) <$> normalized
  Control.Monad.guard (Velocity.toMagnitude friction < Velocity.toMagnitude velocity)
  return friction
