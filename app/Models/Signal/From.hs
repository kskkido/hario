module Models.Signal.From
  ( fromInterval
  ) where

import Control.Concurrent as Concurrent
import Control.Event.Handler as Handler

fromInterval :: Int -> Handler.Handler () -> IO ()
fromInterval ms fn = do
  Concurrent.threadDelay $ fromInteger $ toInteger $ ms `div` 1000
  fn ()
  fromInterval ms fn

