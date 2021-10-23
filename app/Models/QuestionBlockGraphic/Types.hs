module Models.QuestionBlockGraphic.Types
  ( QuestionBlockGraphic(..)
  , QuestionBlockGraphicKey(..)
  ) where

data QuestionBlockGraphic = QuestionBlockGraphic
  { key   :: QuestionBlockGraphicKey
  , frame :: Integer
  }
  deriving (Eq, Show)

data QuestionBlockGraphicKey =
    Idle
    deriving (Eq, Show, Ord)

