module Main where

import Prelude
import Model
import Update
import View
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Database.LowDB (LOWDB)
import Pux (start, fromSimple, renderToDOM, CoreEffects)
import Signal.Channel (CHANNEL)

main :: Eff (CoreEffects (lowdb :: LOWDB)) Unit
main = do
  app <- start
    { initialState : initialModel
    , update : update
    , view : view
    , inputs : []
    }

  renderToDOM "#app" app.html
