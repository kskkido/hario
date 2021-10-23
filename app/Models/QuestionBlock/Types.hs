module Models.QuestionBlock.Types
  ( QuestionBlock(..)
  , Variant(..)
  , Status(..)
  ) where

import qualified Models.Dimension.Main as Dimension
import qualified Models.Position.Main as Position
import qualified Models.QuestionBlockGraphic.Main as QuestionBlockGraphic

data QuestionBlock = QuestionBlock
  { position  :: Position.Position
  , dimension :: Dimension.Dimension
  , variant   :: Variant
  , status    :: Status
  , graphic   :: QuestionBlockGraphic.QuestionBlockGraphic
  } deriving (Eq, Show)

data Variant =
    Coin
    deriving (Eq, Show)

data Status =
    Active
  | Inactive
    deriving (Eq, Show)
