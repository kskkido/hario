module Models.Pipe.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.Pipe.Types as Types

input :: GameCommand.GameCommand -> Types.Pipe -> Types.Pipe
input = const id
