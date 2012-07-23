#!/usr/bin/runhaskell
> module Main (main) where

> import Distribution.Simple
> import Distribution.MacOSX

> main :: IO ()
> main = defaultMainWithHooks simpleUserHooks { postBuild = appBundleBuildHook apps }

> apps :: [MacApp]
> apps = [MacApp "Arcade" (Just "resources/Arcade.icns") Nothing [] [] DoNotChase ]
