module Models.GameObject.IO
  ( blit
  , blitAll
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
import qualified Models.GameGraphic.Main as GameGraphic
import qualified Models.GameObject.To as To
import qualified Models.GameObject.Types as Types

blit :: SDL.Surface -> Types.GameObject -> [ImageResource.ImageResource] -> Config.Config -> IO ()
blit surface object resources config = GameGraphic.blit surface (To.toGraphic object) resources config

blitAll :: SDL.Surface -> [Types.GameObject] -> [ImageResource.ImageResource] -> Config.Config -> IO ()
blitAll surface objects resources config = GameGraphic.blitAll surface (To.toGraphic <$> objects) resources config
