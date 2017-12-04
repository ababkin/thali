import           Protolude


main :: IO ()
main =
  runSpecs defaultSpecs { name = "Thali"
                        , unit = []
                        }
