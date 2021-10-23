module Models.PhysicalObject.Types
  ( PhysicalObject(..)
  ) where

import qualified Linear
import qualified Data.UUID
import qualified Models.Ghost.Main as Ghost
import qualified Models.Solid.Main as Solid
import qualified Models.Static.Main as Static

data PhysicalObject =
    Solid  Solid.Solid
  | Ghost  Ghost.Ghost
  | Static Static.Static
    deriving (Eq, Show)
