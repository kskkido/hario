module Assets.ImageResource.IO
  ( blit
  ) where

import qualified SDL
import qualified SDL.Vect
import qualified Linear
import qualified Foreign.C.Types
import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Monad.Trans
import qualified Control.Monad.Trans.Maybe
import qualified Configs.App.Main as Config
import qualified Models.Position.Main as Position
import qualified Assets.ImageResource.Types as Types

blit :: Position.Position -> SDL.Surface -> Types.ImageResource -> Config.Config -> IO ()
blit position target resource _ = Control.Monad.void $
  SDL.surfaceBlit (snd resource) Data.Maybe.Nothing target $ Just $ SDL.Vect.P ((fromInteger . floor) <$> position)

