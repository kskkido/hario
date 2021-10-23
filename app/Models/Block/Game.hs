module Models.Block.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.Block.Types as Types

input :: GameCommand.GameCommand -> Types.Block -> Types.Block
input = const id
