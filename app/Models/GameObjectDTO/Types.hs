{-# LANGUAGE RankNTypes #-}

module Models.GameObjectDTO.Types
  ( GameObjectDTO(..)
  , _position
  , _dimension
  , _velocity
  , _acceleration
  ) where

import qualified Control.Lens
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Dimension.Main as Dimension
import qualified Models.Velocity.Main as Velocity
import qualified Models.Position.Main as Position
import qualified Models.Velocity.Main as Velocity

data GameObjectDTO = GameObjectDTO
  { position     :: Position.Position
  , dimension    :: Dimension.Dimension
  , velocity     :: Velocity.Velocity
  , acceleration :: Acceleration.Acceleration
  } deriving (Eq, Show)

type Lens s a = forall f. Functor f => (a -> f a) -> s -> f s

lens :: Functor f => (s -> a) -> (s -> a -> s) -> (a -> f a) -> s -> f s
lens getter setter fn s = setter s <$> fn (getter s)

_position :: Lens GameObjectDTO Position.Position
_position = lens position $ \s x -> s { position = x }

_dimension :: Lens GameObjectDTO Dimension.Dimension
_dimension = lens dimension $ \s x -> s { dimension = x }

_velocity :: Lens GameObjectDTO Velocity.Velocity
_velocity = lens velocity $ \s x -> s { velocity = x }

_acceleration :: Lens GameObjectDTO Acceleration.Acceleration
_acceleration = lens acceleration $ \s x -> s { acceleration = x }
