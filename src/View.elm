module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model)
import Login.View

view : Model -> Html msg
view model =
    case model.currentLocation of
        Model.Login ->
            Login.View.view model

        Model.ProductOwnerLocation ->
            ProductOwner.View.view model

        Model.ScrumMasterLocation ->
            ScrumMaster.View.view model

        Model.DeveloperLocation ->
            Developer.View.view model

