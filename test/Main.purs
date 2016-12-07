module Test.Main where

import Prelude
import Database.LowDB
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Maybe

import Data.Foldable (traverse_)

type User =
    { userName :: String
    , userPass :: String
    , userType :: String
    }

main :: forall e. Eff (console :: CONSOLE, lowdb :: LOWDB | e) Unit
main = do
    conn <- connectTo "bonhiato.json" Nothing
    defaults conn ["users", "projects"]
    push conn "users" { userName : "developer1", userPass : "developer1", userType : "Developer"}
    push conn "users" { userName : "developer2", userPass : "developer2", userType : "Developer"}
    push conn "users" { userName : "scrumMaster1", userPass : "scrumMaster1", userType : "scrumMaster"}
    push conn "users" { userName : "developer", userPass : "", userType : "Developer"}
    n :: Array User <- get conn "users"

    traverse_ (\x -> log $ show x.userName) n
