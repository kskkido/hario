module Models.Cell.Main
  ( Cell(..)
  , unit
  ) where

newtype Cell a = Cell a
  deriving (Show)

unit :: Cell ()
unit = Cell ()
