module Options (
    fullOptionsParser
  , showHelpOnErrorExecParser
  , Options(..)
  ) where

import           Protolude

import           Options.Applicative

-- | Option parsing with optparse-applicative. See docs with tutorial here:
-- https://hackage.haskell.org/package/optparse-applicative

-- ADT representing all parsed options
data Options = Options {
    oGlobalFlag :: Bool
  }
  deriving (Eq, Show)


-- Parsers

fullOptionsParser :: ParserInfo Options
fullOptionsParser = info (helper <*> optionsParser) fullDesc

optionsParser
  :: Parser Options
optionsParser = Options
    <$> globalFlag
  where
    globalFlag = switch $  short 'f'
                        <> long "my-flag"
                        <> help "My global flag"




-- | A version of 'execParser' which shows full help on error.
--
-- The regular 'execParser' only prints usage on error, which doesn't
-- include the options, subcommands, or mention of the help switch
-- @--help@.
showHelpOnErrorExecParser
  :: ParserInfo a
  -> IO a
showHelpOnErrorExecParser =
  customExecParser (prefs showHelpOnError)
