{-# LANGUAGE ForeignFunctionInterface #-}
module HSMain where
import Main

foreign export ccall hs_Main :: IO ()

hs_Main :: IO ()
hs_Main = main
