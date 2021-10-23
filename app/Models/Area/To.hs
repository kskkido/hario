module Models.Area.To
  ( toPath
  ) where

import qualified Models.Area.Types as Types

toPath :: Types.Area -> String
toPath Types.Aboveground = "aboveground"
toPath Types.Underground = "underground"
