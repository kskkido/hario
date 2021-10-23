module Models.GameCommand.To
  ( toUp
  , toDown
  , toLeft
  , toRight
  , toA
  , toB
  ) where

import qualified Models.KeyState.Main as KeyState
import qualified Models.GameCommand.Constants as Constants
import qualified Models.GameCommand.Types as Types

toUp :: Types.GameCommand -> KeyState.KeyState
toUp = Types.up

toDown :: Types.GameCommand -> KeyState.KeyState
toDown = Types.down

toLeft :: Types.GameCommand -> KeyState.KeyState
toLeft = Types.left

toRight :: Types.GameCommand -> KeyState.KeyState
toRight = Types.right

toA :: Types.GameCommand -> KeyState.KeyState
toA = Types.a

toB :: Types.GameCommand -> KeyState.KeyState
toB = Types.b

