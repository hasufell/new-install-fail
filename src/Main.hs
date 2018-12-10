{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import qualified Language.Haskell.TH.Syntax as TH


main :: IO ()
main = do
  let !foo = $(do let mdPath = "resources/foo.md"
                  TH.qAddDependentFile mdPath
                  TH.liftData =<< TH.runIO (pure ()))
  putStrLn "Hello, Haskell!"
