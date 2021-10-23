module Models.PipeBlock.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.PipeBlock.Types as Types

input :: GameCommand.GameCommand -> Types.PipeBlock -> Types.PipeBlock
input = const id
