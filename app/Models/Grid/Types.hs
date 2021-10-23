module Models.Grid.Types
  ( Grid
  ) where

import Models.Cell.Main as Cell

type Grid a = [[Cell.Cell a]]
