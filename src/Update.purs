module Update where (..)

import Model where (..)
import Messages where (..)
import Login.Update
import ProductOwner.Update
import ScrumMaster.Update


update :: Msg -> Model.Model -> Model.Model
update (LMsg m) model = Login.Update.update m model
update (SMMsg m) model = ScrumMaster.Update.update m model
update (POMsg m) model = ProductOwner.Update.update m model
update Logout model = ( Model.initialModel, Cmd.none )
update _ model = (model, Cmd.none)
