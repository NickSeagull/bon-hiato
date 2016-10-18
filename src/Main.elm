module Main exposing (..)

import Html.App as App
import Common.Model
import Update as Update
import View as View

main = App.program
  { init          = init
  , view          = View.view
  , update        = Update.update
  , subscriptions = subscriptions
  }
