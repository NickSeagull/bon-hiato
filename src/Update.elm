module Update exposing (..)

import Model exposing (..)
import Messages exposing (..)
import Login.Update


update : Msg -> Model.Model -> (Model.Model, Cmd Msg)
update msg model =
    case msg of
        LMsg m -> Login.Update.update m model
        _ -> ( model, Cmd.none )
