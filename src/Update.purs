module Update where

import Model
import Messages
import Login.Update as Login
import ProductOwner.Update as ProductOwner
import ScrumMaster.Update as ScrumMaster
import Developer.Update as Developer


update :: Msg -> Model-> Model
update (LMsg m) model = Login.update model m
update (SMMsg m) model = ScrumMaster.update m model
update (POMsg m) model = ProductOwner.update m model
update (DMsg m) model = Developer.update m model
update Logout model = initialModel
update _ model = model
