module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Login.Update
import Login.View
import ProductOwner.View
import ScrumMaster.View
import Developer.View
import Messages exposing (Msg(..))



view : Model -> Html Msg
view model =
    case model.currentLocation of
        Model.Login ->
            Login.View.view model

        Model.ProductOwnerLocation _ ->
            ProductOwner.View.view model

        Model.ScrumMasterLocation _ ->
            ScrumMaster.View.view model

        Model.DeveloperLocation _ ->
            Developer.View.view model

