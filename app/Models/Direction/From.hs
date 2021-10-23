module Models.Direction.From
  ( fromAngle
  , fromPosition
  , fromPositions
  ) where

import Control.Lens
import qualified Linear
import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Applicative
import qualified Foreign.C.Types
import qualified Lib.Math.Main
import qualified Models.Position.Main as Position
import qualified Models.Direction.Types as Types

fromAngle :: Float -> Data.Maybe.Maybe Types.Direction
fromAngle angle =
  (Control.Monad.guard (45  <= normalized && normalized <= 135) >> return Types.Up) Control.Applicative.<|>
  (Control.Monad.guard (135 <  normalized && normalized <  225) >> return Types.Right) Control.Applicative.<|>
  (Control.Monad.guard (225 <= normalized && normalized <= 315) >> return Types.Down) Control.Applicative.<|>
  (Control.Monad.guard (315 <  normalized || normalized <  45)  >> return Types.Left)
  where normalized = round (angle + 360) `mod` 360

fromPosition :: Position.Position -> Data.Maybe.Maybe Types.Direction
fromPosition = fromAngle . Position.toAngle

fromPositions :: Position.Position -> Position.Position -> Data.Maybe.Maybe Types.Direction
fromPositions x y = fromPosition $ x - y

