module Assets.Tile.From
  ( fromChar
  ) where

import qualified Assets.Tile.Types as Types

fromVariant :: Types.Variant -> Types.Tile
fromVariant variant = Types.Tile { Types.variant = variant }

fromChar :: Char -> Types.Tile
fromChar '@'  = fromVariant Types.Block0
fromChar 'O'  = fromVariant Types.Block1
fromChar 'X'  = fromVariant Types.Block2
fromChar '?'  = fromVariant Types.Block3
fromChar '#'  = fromVariant Types.Block4
fromChar 'K'  = fromVariant Types.Block5
fromChar '_'  = fromVariant Types.Mountain0
fromChar '/'  = fromVariant Types.Mountain1
fromChar ','  = fromVariant Types.Mountain2
fromChar '\\' = fromVariant Types.Mountain3
fromChar '.'  = fromVariant Types.Mountain4
fromChar '1'  = fromVariant Types.Cloud0
fromChar '2'  = fromVariant Types.Cloud1
fromChar '3'  = fromVariant Types.Cloud2
fromChar '4'  = fromVariant Types.Cloud3
fromChar '5'  = fromVariant Types.Cloud4
fromChar '6'  = fromVariant Types.Cloud5
fromChar '7'  = fromVariant Types.Grass0
fromChar '8'  = fromVariant Types.Grass1
fromChar '9'  = fromVariant Types.Grass2
fromChar '['  = fromVariant Types.Pipe0
fromChar ']'  = fromVariant Types.Pipe1
fromChar 'l'  = fromVariant Types.Pipe2
fromChar '|'  = fromVariant Types.Pipe3
fromChar 'o'  = fromVariant Types.Pole0
fromChar '!'  = fromVariant Types.Pole1
fromChar 'm'  = fromVariant Types.Hario0
fromChar 'k'  = fromVariant Types.Goomba0
fromChar  _   = fromVariant Types.Empty
