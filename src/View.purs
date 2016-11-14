module View where

import Pux.Html
import Pux.Html.Attributes

import Model
import Login.Update as LUpdate
import Login.View as LView
import ProductOwner.View as POView
import ScrumMaster.View as SMView
import Developer.View as DView
import Messages



view :: Model -> Html Msg
view model =
    case model.currentLocation of
        Login ->
            LView.view model

        ProductOwnerLocation _ ->
            POView.view model

        ScrumMasterLocation _ ->
            SMView.view model

        DeveloperLocation _ ->
            DView.view model
