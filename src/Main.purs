module Main where

import Pux (start, fromSimple, renderToDOM)
import Model where (Model, Location (..), User(..), initialModel)
import Update.update as update
import View.view as view

main = do

  App.program <- start
      {   init          : init
        , view          : view
        , update        : update
        , inputs: []
      }

init :: Model.Model
init =  initialModel
