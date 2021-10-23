module Models.QuestionBlock.Lib
  ( modifyGraphic
  , updateGraphic
  ) where

import qualified Models.QuestionBlockGraphic.Main as QuestionBlockGraphic
import qualified Models.QuestionBlock.Types as Types

modifyGraphic :: (QuestionBlockGraphic.QuestionBlockGraphic -> QuestionBlockGraphic.QuestionBlockGraphic) -> Types.QuestionBlock -> Types.QuestionBlock
modifyGraphic fn x = x { Types.graphic = fn $ Types.graphic x }

updateGraphic :: QuestionBlockGraphic.QuestionBlockGraphicKey -> Types.QuestionBlock -> Types.QuestionBlock
updateGraphic = modifyGraphic . QuestionBlockGraphic.update
