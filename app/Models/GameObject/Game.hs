module Models.GameObject.Game
  ( tick
  , input
  ) where

import Data.Functor ((<&>))
import qualified Control.Monad
import qualified Data.Maybe
import qualified Data.List.Split
import qualified Models.Boundary.Main as Boundary
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
import qualified Models.GameCommand.Main as GameCommand
import qualified Models.GameObject.Lib as Lib
import qualified Models.GameObject.To as To
import qualified Models.GameObject.Types as Types

tick :: Types.GameObject -> Types.GameObject
tick (Types.Hario object)         = Types.Hario         $ Hario.tick object
tick (Types.Goomba object)        = Types.Goomba        $ Goomba.tick object
tick (Types.QuestionBlock object) = Types.QuestionBlock $ QuestionBlock.tick object
tick x                            = x

input :: GameCommand.GameCommand -> Types.GameObject -> Types.GameObject
input command (Types.Hario object)         = Types.Hario $ Hario.input command object
input _       x                            = x
