{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Thali.Types where

import           Dhall
import           Protolude hiding (Text)


data Auth = Auth {
    username :: Text
  , password :: Text
  }
  deriving (Generic, Show)

data DockerImage = DockerImage {
    image :: Text
  , auth  :: Maybe Auth
  }
  deriving (Generic, Show)


data Step =
    RunShell {
        cmdName :: Maybe Text
      , cmd     :: Text
      }
  | SetupRemoteDocker {
        dockerVersion :: Text
      }
  | StoreArtifacts {
        path   :: Text
      , prefix :: Text
      }

  deriving (Generic, Show)

data Job = Job {
    jobName     :: Text
  , jobImage    :: DockerImage
  , otherImages :: [DockerImage]
  , parallelism :: Maybe Natural
  , steps       :: [Step]
  } deriving (Generic, Show)


data CircleConfig = CircleConfig {
    jobs :: [Job]
  } deriving (Generic, Show)


instance Interpret CircleConfig
instance Interpret Job
instance Interpret Step
instance Interpret DockerImage
instance Interpret Auth


