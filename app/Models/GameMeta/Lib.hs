module Models.GameMeta.Lib
  ( tick
  ) where

import qualified Models.GameMeta.Types as Types

tick :: Types.GameMeta -> Types.GameMeta
tick x = x { Types.frame = Types.frame x + 1 }

