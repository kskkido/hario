module Models.GameGraphicLayer.Types
  ( GameGraphicLayer(..)
  ) where

data GameGraphicLayer =
    Background
  | Decoration
  | Object
  | Character
  | Player
    deriving (Eq, Show)

instance Enum GameGraphicLayer where
  fromEnum Background = 1
  fromEnum Decoration = 2
  fromEnum Object     = 3
  fromEnum Character  = 4
  fromEnum Player     = 5
  toEnum 1            = Background
  toEnum 2            = Decoration
  toEnum 3            = Object
  toEnum 4            = Character
  toEnum 5            = Player

instance Ord GameGraphicLayer where
  compare x y = fromEnum x `compare` fromEnum y
