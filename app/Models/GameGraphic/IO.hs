module Models.GameGraphic.IO
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
import qualified Models.Position.Main as Position
import qualified Models.GameGraphic.To as To
import qualified Models.GameGraphic.Types as Types

blit :: SDL.Surface -> Types.GameGraphic -> [ImageResource.ImageResource] -> Config.Config -> IO ()
blit surface graphic resources config = Control.Monad.void $ Control.Monad.Trans.Maybe.runMaybeT $ do
  resource <- Control.Monad.Trans.Maybe.MaybeT $ return $ To.toImageResource graphic resources
  Control.Monad.Trans.lift $ ImageResource.blit (Types.position graphic) surface resource config

blitAll :: SDL.Surface -> [Types.GameGraphic] -> [ImageResource.ImageResource] -> Config.Config -> IO ()
blitAll surface graphics resources config = Control.Monad.forM_ graphics $ \x -> blit surface x resources config
