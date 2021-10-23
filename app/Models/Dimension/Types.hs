module Models.Dimension.Types
  ( Dimension(..)
  ) where

data Dimension = Dimension
  {
    width :: Float
  , height :: Float
  } deriving(Eq, Show)
