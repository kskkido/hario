module Models.Decoration.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.Decoration.Types as Types

input :: GameCommand.GameCommand -> Types.Decoration -> Types.Decoration
input = const id
