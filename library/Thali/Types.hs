{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Thali.Types where

import           Dhall
import           Protolude


data CircleConfig = CircleConfig {
    foo :: Integer
  , bar :: Vector Double
  } deriving (Generic, Show)


instance Interpret CircleConfig


