module Models.Hario.Types
  ( Hario(..)
  , Quirk(..)
  , Status(..)
  , Attribute(..)
  ) where

import qualified Models.Motion.Main as Motion
import qualified Models.Acceleration.Main as Acceleration
import qualified Models.Dimension.Main as Dimension
import qualified Models.Velocity.Main as Velocity
import qualified Models.Position.Main as Position
import qualified Models.HarioAction.Main as HarioAction
import qualified Models.HarioGraphic.Main as HarioGraphic

data Hario = Hario
  { quirk :: Quirk
  , status :: Status
  , acceleration :: Acceleration.Acceleration
  , velocity :: Velocity.Velocity
  , position :: Position.Position
  , dimension :: Dimension.Dimension
  , attribute :: Attribute
  , action :: HarioAction.HarioAction
  , graphic :: HarioGraphic.HarioGraphic
  }
  deriving (Eq, Show)

data Quirk =
    Mini
  deriving (Eq, Show)

data Status =
    Live
  | Dead
  deriving (Eq, Show)

data Attribute = Attribute
  { jump  :: Float
  , speed :: Float
  }
  deriving (Eq, Show)
