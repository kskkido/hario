module Configs.App.Types
  ( Config(..)
  ) where

import qualified Linear
import qualified Data.Text
import qualified Data.Word
import qualified Foreign.C.Types

data Config = Config
  { windowTitle :: Data.Text.Text
  , windowWidth :: Foreign.C.Types.CInt
  , windowHeight :: Foreign.C.Types.CInt
  , windowBorder :: Bool
  , windowBackgroundColor :: Linear.V4 Data.Word.Word8
  , gameTileWidth :: Foreign.C.Types.CInt
  , gameTileHeight :: Foreign.C.Types.CInt
  , frameRate :: Int
  , filePathAssetImage :: String
  , filePathAssetTilemap :: String
  , physicsGravity :: Float
  }
