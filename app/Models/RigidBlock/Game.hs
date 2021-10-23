module Models.RigidBlock.Game
  ( input
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.RigidBlock.Types as Types

input :: GameCommand.GameCommand -> Types.RigidBlock -> Types.RigidBlock
input = const id
