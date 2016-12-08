module Update where

import Prelude
import Model
import Messages
import Developer.Update as Developer
import Login.Update as Login
import ProductOwner.Update as ProductOwner
import ScrumMaster.Update as ScrumMaster
import Database.LowDB (LOWDB)
import Pux (noEffects)


update :: Msg -> Model-> EffModel (lowdb::LOWDB) Msg
update (LMsg m) model = Login.update model m
update (SMMsg m) model = noEffects $ ScrumMaster.update m model
update (POMsg m) model = noEffects $ ProductOwner.update m model
update (DMsg m) model = noEffects $ Developer.update m model
update Logout model = noEffects $ initialModel
