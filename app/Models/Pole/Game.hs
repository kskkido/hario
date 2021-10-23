module Models.Pole.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.Pole.Types as Types

input :: GameCommand.GameCommand -> Types.Pole -> Types.Pole
input = const id
