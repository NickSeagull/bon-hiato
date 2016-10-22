module ProductOwner.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Materialize.Materialize as Materialize
import Messages exposing (Msg(..), ProductOwnerMsg(..))

view : Model -> Html Msg
view model = 
    div [] 
        [
        Materialize.navbar 
            (greetUser model)
            []
            [ a [ onClick <| POMsg ManagePriorities ] [ text "Manage priorities" ]
            , a [ onClick <| POMsg EditUserStories ] [ text "User stories" ]
            , a [ onClick Logout ] [ text "Logout" ]
            ]
        ]

greetUser : Model -> String
greetUser model =
    model.username ++ " - Dashboard"
