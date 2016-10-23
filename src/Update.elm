module Update exposing (..)

import Model exposing (..)
import Messages exposing (..)
import Login.Update
import ProductOwner.Update
import ScrumMaster.Update


update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model =
    case msg of
        LMsg m -> Login.Update.update m model
        SMMsg m -> ScrumMaster.Update.update m model
        POMsg m -> ProductOwner.Update.update m model
        Logout -> ( Model.initialModel, Cmd.none )
        _ -> (model, Cmd.none)
