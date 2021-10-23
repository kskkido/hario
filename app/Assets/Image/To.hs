module Assets.Image.To
  ( toFile
  ) where

import qualified Data.Maybe
import qualified Assets.Image.Types as Types
import qualified Assets.Image.Constant as Constant

toFile :: Types.Image -> Data.Maybe.Maybe String
toFile = flip lookup Constant.fileByType

