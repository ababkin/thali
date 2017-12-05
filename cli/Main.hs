{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Dhall
import           Options     (Options, fullOptionsParser,
                              showHelpOnErrorExecParser)
import           Protolude

import           Thali.Types


main :: IO ()
main = do

  -- `showHelpOnErrorExecParser` parses out commands, arguments and options using the rules in `opts`
  -- and gives the `Options` structure to `dispatch` that acts in accord to the options
  dispatch =<< showHelpOnErrorExecParser fullOptionsParser


dispatch
  :: Options
  -> IO ()
dispatch _opts = do
  x <- input auto "./config"
  print (x :: CircleConfig)


