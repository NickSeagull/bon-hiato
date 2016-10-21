module Main exposing (..)

import Html.App as App
import Model exposing (Model, Location (..), User(..))
import Update as Update
import View as View

main = App.program
  { init          = init
  , view          = View.view
  , update        = Update.update
  , subscriptions = subscriptions
  }

init : (Model.Model, Cmd a)
init = ( { currentLocation = Login
         , loggedAs = NotLogged 
         , username = ""
         , password = ""
         }
       , Cmd.none)

subscriptions _ = Sub.none
