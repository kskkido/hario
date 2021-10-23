module Models.QuestionBlock.Game
  ( tick
  ) where

import qualified Models.GameCommand.Main as GameCommand
import qualified Models.QuestionBlockGraphic.Main as QuestionBlockGraphic
import qualified Models.QuestionBlock.Lib as Lib
import qualified Models.QuestionBlock.To as To
import qualified Models.QuestionBlock.Types as Types

tick :: Types.QuestionBlock -> Types.QuestionBlock
tick = To.toGraphicKey >>= Lib.updateGraphic

