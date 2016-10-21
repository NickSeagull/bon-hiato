module Update exposing (..)

import Model exposing (..)
import Login.Update exposing (Msg(..))

update : Msg -> Model.Model -> (Model.Model, Cmd Login.Update.Msg)
update msg model =
    case model.currentLocation of
        Login -> Login.Update.update msg model
        _ -> ( model, Cmd.none )
