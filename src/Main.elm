module Main exposing (..)

import Html.App as App
import Model exposing (Model, Location (..), User(..), initialModel)
import Update as Update
import View as View

main = App.program
  { init          = init
  , view          = View.view
  , update        = Update.update
  , subscriptions = subscriptions
  }

init : (Model.Model, Cmd a)
init = ( initialModel
       , Cmd.none)

subscriptions _ = Sub.none
