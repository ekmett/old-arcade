module Main (main) where

import Control.Concurrent (threadDelay)
import Control.Monad (join)
import Graphics.Rendering.OpenGL
import Graphics.UI.SDL as SDL
-- import EnableGUI

main :: IO ()
main = do
--  enableGUI
  SDL.init [InitEverything]
  _ <- setVideoMode 800 600 24 [HWSurface, DoubleBuf, OpenGL]
  join setCaption "Arcadia"
  render
  sequence_ $ replicate 1000 eventLoop

render :: IO ()
render = do
  clearColor $= Color4 0 0 0 0
  matrixMode $= Projection
  loadIdentity
  ortho2D (-4/3) (4/3) (-1) 1
  clear [ColorBuffer]
  color $ Color3 1 1 (1 :: Double)
  renderPrimitive Polygon $ do
    vertex $ Vertex2 (-0.05) (-0.05 :: Double)
    vertex $ Vertex2 (-0.05) ( 0.05 :: Double)
    vertex $ Vertex2   0.05  ( 0.05 :: Double)
    vertex $ Vertex2   0.05  (-0.05 :: Double)
  glSwapBuffers

eventLoop :: IO ()
eventLoop = do
  print =<< SDL.pollEvent
  threadDelay 10000
