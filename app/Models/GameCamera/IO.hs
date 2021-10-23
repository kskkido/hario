module Models.GameCamera.IO
  ( blit
  ) where

import qualified SDL
import qualified SDL.Vect
import qualified Foreign.C.Types
import qualified Data.Maybe
import qualified Control.Arrow
import qualified Control.Monad
import qualified Control.Monad.Trans
import qualified Control.Monad.Trans.Maybe
import qualified Configs.App.Main as Config
import qualified Assets.ImageResource.Main as ImageResource
import qualified Models.Position.Main as Position
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameCamera.Lib as Lib
import qualified Models.GameCamera.Types as Types

blit :: SDL.Surface -> [GameGraphic.GameGraphic] -> Types.GameCamera -> [ImageResource.ImageResource] -> Config.Config -> IO ()
blit surface graphics camera resources config = Control.Monad.void $ do
  Control.Monad.forM_ graphics $ \graphic -> Control.Monad.Trans.Maybe.runMaybeT $ do
    Control.Monad.guard $ Lib.visible (GameGraphic.toBoundary graphic) camera
    resource <- Control.Monad.Trans.Maybe.MaybeT $ return $ GameGraphic.toImageResource graphic resources
    relative <- Control.Monad.Trans.lift $ return $ GameGraphic.offset (Types.position camera) graphic
    Control.Monad.Trans.lift $ ImageResource.blit (GameGraphic.position relative) surface resource config
