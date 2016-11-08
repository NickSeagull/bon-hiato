module View where (..)

import Pux where (..)
import Pux.Attributes where (..)
import Model where (Model)
import Login.Update
import Login.View
import ProductOwner.View
import ScrumMaster.View
import Developer.View
import Messages where (Msg(..))



view :: Model -> Html Msg
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
