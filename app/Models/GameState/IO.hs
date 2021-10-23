module Models.GameState.IO
  ( blit
  , render
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
import qualified Models.ActorMap.Main as ActorMap
import qualified Models.GameCamera.Main as GameCamera
import qualified Models.GameObject.Main as GameObject
import qualified Models.GameResource.Main as GameResource
import qualified Models.GameState.Types as Types

blit :: Types.GameState -> GameResource.GameResource -> Config.Config -> IO ()
blit state resource config = do
  surface        <- SDL.getWindowSurface $ GameResource.window resource
  imageResources <- return $ GameResource.imageResources resource
  graphics       <- return $ ActorMap.toGraphics $ Types.actorMap state
  camera         <- return $ Types.camera state
  GameCamera.blit surface graphics camera imageResources config

render :: Types.GameState -> GameResource.GameResource -> Config.Config -> IO ()
render state resource config = do
  surface <- SDL.getWindowSurface $ GameResource.window resource
  SDL.surfaceFillRect surface Data.Maybe.Nothing $ Config.windowBackgroundColor config
  blit state resource config
  SDL.updateWindowSurface $ GameResource.window resource
