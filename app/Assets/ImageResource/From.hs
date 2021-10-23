module Assets.ImageResource.From
  ( fromImage
  , fromImages
  ) where

import Control.Applicative ((<*))
import qualified SDL
import qualified Linear
import qualified Data.Maybe
import qualified Control.Monad
import qualified Control.Monad.Trans
import qualified Control.Monad.Trans.Maybe
import qualified Configs.App.Main as Config
import qualified Assets.Image.Main as Image
import qualified Assets.ImageResource.Types as Types

fromImage :: Image.Image -> Config.Config -> IO (Data.Maybe.Maybe Types.ImageResource)
fromImage image config = Control.Monad.Trans.Maybe.runMaybeT $ do
  file    <- Control.Monad.Trans.Maybe.MaybeT $ return $ Image.toFile image
  surface <- Control.Monad.Trans.lift $ do
    surface <- SDL.loadBMP $ Config.filePathAssetImage config ++ file
    format  <- SDL.surfaceFormat surface
    SDL.surfaceColorKey  surface SDL.$= (return $ Linear.V4 1 10 5 10) -- ???
    SDL.convertSurface surface format <* SDL.freeSurface surface
  return (image, surface)

fromImages :: [Image.Image] -> Config.Config -> IO [Types.ImageResource]
fromImages images config = do
  resources <- Control.Monad.mapM (`fromImage` config) images
  return $ Data.Maybe.catMaybes resources
