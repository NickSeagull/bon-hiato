module ScrumMaster.Update exposing (..)

import Messages exposing (Msg(..), ScrumMasterMsg(..))
import Model exposing (Model, Location(..), SMLocation(..))

update : ScrumMasterMsg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
         _ -> ( model, Cmd.none)
