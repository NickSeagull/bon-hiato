module Main where

import Prelude

import Pux (start, fromSimple, renderToDOM, CoreEffects)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Signal.Channel (CHANNEL)
import Model
import Update
import View

main :: forall e . Eff (err :: EXCEPTION, channel :: CHANNEL | e) Unit
main = do
  app <- start
    { initialState : initialModel
    , update : (fromSimple update)
    , view : view
    , inputs : []
    }

  renderToDOM "#app" app.html
