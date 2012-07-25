{-# LANGUAGE OverloadedStrings #-}
module Web where

import Data.IORef
import Data.ByteString.Char8 as B
import Data.Maybe
import Snap
import Snap.Snaplet.Heist

data App = App
   { _heist :: Snaplet (Heist App)
-- , _displaySettings :: Snaplet DisplaySettings
-- , _connectToServer :: Snaplet ConnectToServer
-- , _chat            :: Snaplet Chat
-- , _shutdown        :: Snaplet Shutdown
   }

makeLens ''App

appInit :: SnapletInit App App
appInit = makeSnaplet "arcade" "Haskell Arcade Client" Nothing $ do
  hs <- nestSnaplet "heist" $ heistInit "templates"
  addRoutes [ ("/hello", writeText "hello world") ]
  wrapHandlers (<|> heistServe)
  return $ App hs

instance HasHeist App where
  heistLens = subSnaplet heist

main :: IO ()
main = serveSnaplet defaultConfig appInit
