module Models.GameObject.Types
  ( GameObject(..)
  ) where

import qualified Models.Hario.Main as Hario
import qualified Models.Block.Main as Block
import qualified Models.Pole.Main as Pole
import qualified Models.Pipe.Main as Pipe
import qualified Models.PipeBlock.Main as PipeBlock
import qualified Models.GroundBlock.Main as GroundBlock
import qualified Models.RigidBlock.Main as RigidBlock
import qualified Models.QuestionBlock.Main as QuestionBlock
import qualified Models.Decoration.Main as Decoration
import qualified Models.Goomba.Main as Goomba

data GameObject =
    Hario Hario.Hario
  | Block Block.Block
  | Pole Pole.Pole
  | Pipe Pipe.Pipe
  | PipeBlock PipeBlock.PipeBlock
  | GroundBlock GroundBlock.GroundBlock
  | RigidBlock RigidBlock.RigidBlock
  | QuestionBlock QuestionBlock.QuestionBlock
  | Decoration Decoration.Decoration
  | Goomba Goomba.Goomba
    deriving (Eq, Show)

