module Lib.Time.Main
  ( getTimeMS
  ) where

import qualified Data.Time.Clock.POSIX

getTimeMS :: Integral a => IO a
getTimeMS = (round . (* 1000)) <$> Data.Time.Clock.POSIX.getPOSIXTime
