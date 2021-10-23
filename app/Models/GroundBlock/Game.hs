module Models.GroundBlock.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GroundBlock.Types as Types

input :: GameCommand.GameCommand -> Types.GroundBlock -> Types.GroundBlock
input = const id
