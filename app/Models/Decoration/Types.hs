module Models.Decoration.Types
  ( Decoration(..)
  , Variant(..)
  ) where

import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position

data Decoration = Decoration
  { position  :: Position.Position
  , dimension :: Dimension.Dimension
  , variant   :: Variant
  }
  deriving (Eq, Show)

data Variant =
    Cloud0
  | Cloud1
  | Cloud2
  | Cloud3
  | Cloud4
  | Cloud5
  | Grass0
  | Grass1
  | Grass2
  | Mountain0
  | Mountain1
  | Mountain2
  | Mountain3
  | Mountain4
  deriving (Eq, Show)
